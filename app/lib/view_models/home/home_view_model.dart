import 'dart:math';

import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
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
  late final RxBool _isLoadingAnalysis;
  late final Rx<SpeechState> _speechState;
  late final RxList<CarbonCloudState> _carbonCloudStates;

  double get changedCO2 => _changedCO2.value;
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
    _changedCO2 = 0.0.obs;
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
    _changedCO2.value = _userRepository.getTotalCarbonDiOxide();
  }

  Future<void> analysisSpeech(int index) async {
    _isLoadingAnalysis.value = true;
    Map<String, dynamic> result = await _analysisRepository.analysisAction(
      _carbonCloudStates[index].userStatus,
      _speechState.value.speechText,
    );

    // DB 저장
    ActionHistoryData data = await _actionHistoryRepository.createOrUpdate(
      ActionHistoryCompanion.insert(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userStatus: _carbonCloudStates[index].userStatus,
        type: _carbonCloudStates[index].action,
        question: _carbonCloudStates[index].text,
        answer: _speechState.value.speechText,
        changeCapacity: result['changeCapacity'],
      ),
    );

    // User Update
    await _userRepository.changeTotalCarbonDiOxide(
        _carbonCloudStates[index].userStatus, data.changeCapacity);

    // UI Update
    _changedCO2.value = _userRepository.getTotalCarbonDiOxide();
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

  setReducedCO2(double value) {
    _changedCO2.value = value;
  }
}
