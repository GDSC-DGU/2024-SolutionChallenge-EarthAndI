import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/converter/e_type_converter.dart';
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
import 'package:earth_and_i/utilities/functions/health_util.dart';
import 'package:earth_and_i/utilities/functions/widget_util.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
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
    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();
    _analysisRepository = Get.find<AnalysisRepository>();

    // Private Fields
    _speechModule = SpeechToText();

    _deltaCO2State = DeltaCO2State.initial()
        .copyWith(
          totalPositiveCO2: _userRepository.readTotalPositiveDeltaCO2(),
          totalNegativeCO2: _userRepository.readTotalNegativeDeltaCO2(),
        )
        .obs;
    _characterStatsState = _userRepository.readCharacterStatsState().obs;
    _analysisState = AnalysisState.initial()
        .copyWith(
          speechBubble: _characterStatsState.value.getTranslation(),
        )
        .obs;
    _carbonCloudStates = RxList<CarbonCloudState>([]);
    _speechState = SpeechState.initial().obs;

    // Load Data
    _carbonCloudStates.addAll(
      await _actionHistoryRepository.readCarbonCloudStates(
        Get.find<RootViewModel>().currentAt,
      ),
    );
    _speechState.value = _speechState.value.copyWith(
      isEnableMic: await _speechModule.initialize(),
    );

    loadAndSaveSteps(Get.find<RootViewModel>().currentAt);
  }

  void onReadySpeechState() {
    _speechState.value = _speechState.value.copyWith(
      isListening: false,
      isComplete: false,
      speechText: '',
    );
  }

  void startSpeech() async {
    // 음성인식 시작
    await _speechModule.listen(
      onResult: (result) async {
        _speechState.value = _speechState.value.copyWith(
          speechText: result.recognizedWords,
        );
      },
      localeId: Get.deviceLocale?.languageCode == 'ko' ? 'ko_KR' : 'en_US',
    );

    // 음성인식 시작을 위한 상태 변화
    _speechState.value = _speechState.value.copyWith(
      isListening: true,
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
    EUserStatus userStatus = ETypeConverter.actionToUserStatus(
      _carbonCloudStates[index].action,
    );
    EAction action = _carbonCloudStates[index].action;
    String question = _carbonCloudStates[index].shortQuestion;
    String speechText = _speechState.value.speechText;

    Map<String, dynamic> result;

    try {
      result = await _analysisRepository.analysisAction(
        userStatus,
        _carbonCloudStates[index].longQuestion.tr,
        speechText,
      );
    } catch (e) {
      _analysisState.value = _analysisState.value.copyWith(
        isLoading: false,
        speechBubble: "server_communication_failed_character".tr,
      );

      return;
    }

    String answer = result['answer'];
    double changeCapacity = result['changeCapacity'];

    // DB 저장
    await _actionHistoryRepository.createOrUpdate(
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

    // Update Data, Character Stats And UI
    if (changeCapacity != 0.0) {
      bool isPositive = changeCapacity < 0;

      if (changeCapacity < 0) {
        _deltaCO2State.value = _deltaCO2State.value.copyWith(
          totalPositiveCO2:
              await _userRepository.updateTotalPositiveDeltaCO2(changeCapacity),
          changeCO2: changeCapacity,
        );
      } else {
        _deltaCO2State.value = _deltaCO2State.value.copyWith(
          totalNegativeCO2:
              await _userRepository.updateTotalNegativeDeltaCO2(changeCapacity),
          changeCO2: changeCapacity,
        );
      }

      _characterStatsState.value = await _userRepository.updateCharacterStats(
        userStatus,
        isPositive,
      );

      WidgetUtil.setInformation(
        positiveDeltaCO2: _deltaCO2State.value.totalPositiveCO2,
        negativeDeltaCO2: _deltaCO2State.value.totalNegativeCO2,
        isHealthCondition: _characterStatsState.value.isHealthCondition,
        isMentalCondition: _characterStatsState.value.isMentalCondition,
        isCashCondition: _characterStatsState.value.isCashCondition,
      );
    }

    // Update Data
    _carbonCloudStates.removeAt(index);

    _analysisState.value = _analysisState.value.copyWith(
      isLoading: false,
      speechBubble: answer,
    );

    Get.find<ProfileViewModel>().fetchDailyDeltaCO2State(null);
    Get.find<ProfileViewModel>().fetchActionHistoryStates(null);
  }

  Future<void> loadAndSaveSteps(DateTime currentAt) async {
    // 금일 날짜의 00:00:00 ~ 23:59:59 사이의 걸음 수를 가져옴
    DateTime startAt = DateTime(currentAt.year, currentAt.month, currentAt.day);
    DateTime endAt =
        DateTime(currentAt.year, currentAt.month, currentAt.day, 23, 59, 59);
    double currentChangeCapacity =
        (await HealthUtil.getSteps(startAt, endAt)) * 0.000125;

    // 걸음 수가 0이라면 업데이트를 하지 않음
    if (currentChangeCapacity == 0) {
      return;
    }

    ActionHistoryData? data =
        await _actionHistoryRepository.readOneByTypeAndDateRange(
      EAction.steps,
      startAt,
      endAt,
    );

    // 이산화탄소량의 변화량을 계산함
    double changedCO2 = (data != null ? data.changeCapacity.abs() : 0.0) -
        currentChangeCapacity;

    // 이산화탄소량의 변화량이 0이라면 업데이트를 하지 않음
    if (changedCO2 >= 0) {
      return;
    }

    // 금일 날짜의 00:00:00 ~ 23:59:59 사이의 걸음 수를 저장하는데
    // 저장된 걸음 수가 없다면 새로운 데이터를 생성하고
    // 저장된 걸음 수가 있다면 새로운 데이터를 생성하지 않고 업데이트함
    // 이후 사용자의 총 이산화탄소를 변화시킴
    if (data == null) {
      await _actionHistoryRepository.createOrUpdate(
        ActionHistoryCompanion.insert(
          changeCapacity: -currentChangeCapacity,
          createdAt: currentAt,
          updatedAt: currentAt,
          question: "",
          answer: "${currentChangeCapacity ~/ 0.000125}",
          userStatus: EUserStatus.health,
          type: EAction.steps,
        ),
      );
    } else if (data.changeCapacity.abs() < currentChangeCapacity) {
      await _actionHistoryRepository.createOrUpdate(
        data
            .copyWith(
              changeCapacity: -currentChangeCapacity,
              updatedAt: currentAt,
              answer: "${currentChangeCapacity ~/ 0.000125}",
            )
            .toCompanion(true),
      );
    }

    fetchDeltaCO2(
      await _userRepository.updateTotalPositiveDeltaCO2(changedCO2),
      changedCO2,
    );

    fetchCharacterStatsState(
      await _userRepository.updateCharacterStats(null, null),
    );

    WidgetUtil.setInformation(
      positiveDeltaCO2: _deltaCO2State.value.totalPositiveCO2,
      negativeDeltaCO2: _deltaCO2State.value.totalNegativeCO2,
      isHealthCondition: _characterStatsState.value.isHealthCondition,
      isMentalCondition: _characterStatsState.value.isMentalCondition,
      isCashCondition: _characterStatsState.value.isCashCondition,
    );

    // Screen Dependency
    Get.find<ProfileViewModel>().fetchDailyDeltaCO2State(null);
    Get.find<ProfileViewModel>().fetchActionHistoryStates(null);
  }

  void fetchDeltaCO2(double totalCO2, double changedCO2) {
    if (changedCO2 < 0) {
      _deltaCO2State.value = _deltaCO2State.value.copyWith(
        totalPositiveCO2: totalCO2,
        changeCO2: changedCO2,
      );
    } else {
      _deltaCO2State.value = _deltaCO2State.value.copyWith(
        totalNegativeCO2: totalCO2,
        changeCO2: changedCO2,
      );
    }
  }

  void fetchCarbonCloudStates(DateTime currentAt) async {
    _carbonCloudStates.clear();
    await Future.delayed(const Duration(seconds: 1));
    _carbonCloudStates.addAll(
      await _actionHistoryRepository.readCarbonCloudStates(currentAt),
    );
  }

  void fetchCharacterStatsState(CharacterStatsState state) {
    _characterStatsState.value = state;
  }
}
