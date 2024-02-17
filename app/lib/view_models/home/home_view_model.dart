import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/home/analysis_state.dart';
import 'package:earth_and_i/models/home/carbon_cloud_state.dart';
import 'package:earth_and_i/models/home/character_state.dart';
import 'package:earth_and_i/models/home/delta_co2_state.dart';
import 'package:earth_and_i/models/home/speech_state.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/analysis_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart';

class HomeViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ActionHistoryRepository _actionHistoryRepository;
  late final AnalysisRepository _analysisRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final SpeechToText _speechModule;

  late final Rx<DeltaCO2State> _deltaCO2State;
  late final Rx<CharacterStatsState> _characterStatsState;
  late final Rx<AnalysisState> _analysisState;
  late final Rx<SpeechState> _speechState;
  late final RxList<CarbonCloudState> _carbonCloudStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  DeltaCO2State get deltaCO2State => _deltaCO2State.value;
  CharacterStatsState get characterStatsState => _characterStatsState.value;
  AnalysisState get analysisState => _analysisState.value;
  SpeechState get speechState => _speechState.value;
  List<CarbonCloudState> get carbonCloudStates => _carbonCloudStates;

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
    _deltaCO2State = DeltaCO2State(
      totalCO2: _userRepository.readTotalDeltaCO2(),
    ).obs;
    _characterStatsState = _userRepository.readCharacterStatsState().obs;
    _analysisState = AnalysisState.initial()
        .copyWith(
          speechBubble: _characterStatsState.value.getTranslation(),
        )
        .obs;
    _carbonCloudStates = RxList<CarbonCloudState>([]);
    _speechState = SpeechState.initial().obs;

    // Load Data And Initialize Module
    _carbonCloudStates.addAll(
      await _actionHistoryRepository.readCarbonCloudStates(DateTime.now()),
    );
    _speechState.value = _speechState.value.copyWith(
      isEnableMic: await _speechModule.initialize(),
    );
  }

  void initializeSpeechState() {
    _speechState.value = _speechState.value.copyWith(
      isListening: false,
      isComplete: false,
      speechText: '',
    );
  }

  void startSpeech() async {
    // 음성인식 시작을 위한 상태 변화
    _speechState.value = _speechState.value.copyWith(
      isListening: true,
    );

    // 음성인식 시작
    await _speechModule.listen(
      onResult: (result) async {
        _speechState.value = _speechState.value.copyWith(
          speechText: result.recognizedWords,
          isListening: !result.finalResult,
        );
      },
      localeId: Get.deviceLocale?.languageCode == 'ko' ? 'ko_KR' : 'en_US',
    );
  }

  Future<void> stopSpeech() async {
    // 음성인식 종료
    await _speechModule.stop();

    // 음성인식 종료를 위한 상태 변화
    _speechState.value = _speechState.value.copyWith(
      isListening: false,
      isComplete: true,
    );
  }

  void forceStopSpeech() async {
    // 음성인식 종료
    await _speechModule.stop();

    // 음성인식 종료를 위한 상태 변화(강제 종료 되었으므로 완료된 상태는 아님)
    _speechState.value = _speechState.value.copyWith(
      isListening: false,
      isComplete: false,
    );
  }

  Future<void> analysisSpeech(int index) async {
    _analysisState.value = _analysisState.value.copyWith(
      isLoading: true,
    );

    // 분석
    EUserStatus userStatus = _carbonCloudStates[index].userStatus;
    EAction action = _carbonCloudStates[index].action;
    String question = _carbonCloudStates[index].shortQuestion;
    String speechText = _speechState.value.speechText;

    Map<String, dynamic> result = await _analysisRepository.analysisAction(
      userStatus,
      _carbonCloudStates[index].longQuestion.tr,
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

    await _userRepository.updateUserInformationCount(
      _carbonCloudStates[index].userStatus,
      isPositive,
    );
    _characterStatsState.value = await _userRepository.updateCharacterStats(
      _carbonCloudStates[index].userStatus,
      isPositive,
    );

    // Update Data
    _deltaCO2State.value = _deltaCO2State.value.copyWith(
      totalCO2: await _userRepository.updateTotalDeltaCO2(data.changeCapacity),
      changeCO2: data.changeCapacity,
    );
    _carbonCloudStates.removeAt(index);

    _analysisState.value = _analysisState.value.copyWith(
      isLoading: false,
      speechBubble: result['answer'],
    );
  }

  void fetchDeltaCO2(double value) {
    double currentCO2 = value - _deltaCO2State.value.totalCO2;

    _deltaCO2State.value = _deltaCO2State.value.copyWith(
      totalCO2: value,
      changeCO2: currentCO2,
    );
  }

  void fetchCharacterStatsState(CharacterStatsState state) {
    _characterStatsState.value = state;
  }
}
