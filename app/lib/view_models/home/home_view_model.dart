import 'dart:math';

import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:earth_and_i/models/home/character_state.dart';
import 'package:earth_and_i/models/home/speech_state.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/analysis_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeViewModel extends GetxController {
  late final UserRepository _userRepository;
  late final ActionHistoryRepository _actionHistoryRepository;
  late final AnalysisRepository _analysisRepository;

  late final SpeechToText _speechModule;

  late final RxDouble _changedCO2;
  late final Rx<CharacterStatsState> _characterStatsState;
  late final RxBool _isLoadingAnalysis;
  late final Rx<SpeechState> _speechState;
  late final RxList<CarbonCloudState> _carbonCloudStates;

  double get changedCO2 => _changedCO2.value;
  CharacterStatsState get characterStatsState => _characterStatsState.value;
  bool get isLoadingAnalysis => _isLoadingAnalysis.value;
  SpeechState get speechState => _speechState.value;
  RxList<CarbonCloudState> get carbonCloudStates => _carbonCloudStates;

  @override
  void onInit() async {
    super.onInit();
    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();
    _analysisRepository = Get.find<AnalysisRepository>();

    // Module Initialize
    _speechModule = SpeechToText();

    // Observable Initialize
    _changedCO2 = _userRepository.getTotalCarbonDiOxide().obs;
    _characterStatsState = _userRepository.getCharacterStatsState().obs;
    _isLoadingAnalysis = false.obs;
    _carbonCloudStates = RxList<CarbonCloudState>([]);
    _speechState = SpeechState.initial().obs;

    // Load Data
    _carbonCloudStates.addAll(
      await _actionHistoryRepository.readCarbonCloudStates(DateTime.now()),
    );
    _speechState.value = _speechState.value.copyWith(
      isEnableMic: await _speechModule.initialize(),
    );
  }

  Future<void> analysisSpeech(int index) async {
    _isLoadingAnalysis.value = true;

    // 분석
    EUserStatus userStatus = _carbonCloudStates[index].userStatus;
    EAction action = _carbonCloudStates[index].action;
    String question = _carbonCloudStates[index].text;
    String speechText = _speechState.value.speechText;

    Map<String, dynamic> result = await _analysisRepository.analysisAction(
      userStatus,
      speechText,
    );

    // DB 저장
    ActionHistoryData data = await _actionHistoryRepository.createOrUpdate(
      ActionHistoryCompanion.insert(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userStatus: userStatus,
        type: action,
        question: question,
        answer: speechText,
        changeCapacity: result['changeCapacity'],
      ),
    );

    // Update User Information, Character Stats And UI
    bool isPositive = result['changeCapacity'] < 0;
    _changedCO2.value =
        await _userRepository.updateDeltaCO2(data.changeCapacity);
    await _userRepository.updateUserInformationCount(
      _carbonCloudStates[index].userStatus,
      isPositive,
    );
    _characterStatsState.value = await _userRepository.updateCharacterStats(
      _carbonCloudStates[index].userStatus,
      isPositive,
    );

    // Update Data
    _carbonCloudStates.removeAt(index);
    _speechState.value = _speechState.value.copyWith(
      speechText: result['answer'],
    );

    _isLoadingAnalysis.value = false;
  }

  void startSpeech(int index) async {
    await _speechModule.listen(
      onResult: (result) async {
        if (result.finalResult) {
          _speechState.value = _speechState.value.copyWith(
            speechText: result.recognizedWords,
          );
          await analysisSpeech(index);
        }
      },
      localeId: Get.deviceLocale.toString(),
    );

    Get.find<RootViewModel>().changeMicState();
  }

  void stopSpeech() async {
    await _speechModule.stop();
    Get.find<RootViewModel>().changeMicState();
  }

  void fetchDeltaCO2(double value) {
    _changedCO2.value = value;
  }

  void fetchCharacterStatsState(CharacterStatsState state) {
    _characterStatsState.value = state;
  }
}
