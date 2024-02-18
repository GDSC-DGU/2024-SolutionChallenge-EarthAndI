import 'package:earth_and_i/models/profile/action_history_state.dart';
import 'package:earth_and_i/models/profile/daily_carbon_state.dart';
import 'package:earth_and_i/models/profile/daily_delta_co2_state.dart';
import 'package:earth_and_i/models/profile/total_carbon_state.dart';
import 'package:earth_and_i/models/profile/user_brief_state.dart';
import 'package:earth_and_i/models/profile/calendar_state.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/health_util.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ActionHistoryRepository _actionHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<UserBriefState> _userBriefState;
  late final Rx<CalendarState> _calendarState;
  late final Rx<DailyDeltaCO2State> _dailyDeltaCO2State;
  late final RxList<ActionHistoryState> _actionHistoryStates;

  late final Rx<DailyCarbonState> _dailyCarbonState;
  late final Rx<TotalCarbonState> _totalCarbonState;
  late final RxInt _dailySteps;
  late final RxDouble _dailyStepsCarbonAmount;
  late final RxList _dailyHistory;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  UserBriefState get userBriefState => _userBriefState.value;
  CalendarState get calendarState => _calendarState.value;
  DailyDeltaCO2State get dailyDeltaCO2State => _dailyDeltaCO2State.value;
  List<ActionHistoryState> get actionHistoryStates => _actionHistoryStates;

  DailyCarbonState get dailyCarbonState => _dailyCarbonState.value;
  TotalCarbonState get totalCarbonState => _totalCarbonState.value;
  int get dailySteps => _dailySteps.value;
  double get dailyStepsCarbonAmount => _dailyStepsCarbonAmount.value;
  List<dynamic> get dailyHistory => _dailyHistory;

  @override
  void onInit() async {
    super.onInit();
    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();

    // Private Fields
    _userBriefState = _userRepository.readUserBriefState().obs;
    _calendarState = CalendarState.initial().obs;
    _dailyDeltaCO2State = DailyDeltaCO2State.initial().obs;
    _actionHistoryStates = <ActionHistoryState>[].obs;

    _dailyCarbonState = _userRepository.readDailyCarbonState().obs;
    _totalCarbonState = TotalCarbonState.initial().obs;
    _dailySteps = 0.obs;
    _dailyStepsCarbonAmount = 0.0.obs;
    _dailyHistory = <dynamic>[].obs;

    // Load Data
    fetchDailyDeltaCO2State(_calendarState.value.selectedDate);
    fetchActionHistoryStates(_calendarState.value.selectedDate);
  }

  @override
  void dispose() {
    super.dispose();
    _calendarState.close();
    _dailyCarbonState.close();
  }

  void updateFocusedDate(DateTime focusedDay) {
    _calendarState.value = _calendarState.value.copyWith(
      focusedDate: focusedDay,
    );
  }

  void changeSelectedDate(DateTime selectedDate) {
    if (!isSameDay(selectedDate, _calendarState.value.selectedDate)) {
      _calendarState.value = _calendarState.value
          .copyWith(selectedDate: selectedDate, focusedDate: selectedDate);
    }

    fetchDailyDeltaCO2State(selectedDate);
    fetchActionHistoryStates(selectedDate);
  }

  void fetchDailyDeltaCO2State(DateTime currentAt) async {
    if (!isSameDay(currentAt, _calendarState.value.selectedDate)) {
      return;
    }

    _dailyDeltaCO2State.value =
        await _actionHistoryRepository.readDailyDeltaCO2State(currentAt);
  }

  void fetchActionHistoryStates(DateTime currentAt) async {
    if (!isSameDay(currentAt, _calendarState.value.selectedDate)) {
      return;
    }

    _actionHistoryStates.value =
        await _actionHistoryRepository.readActionHistoryStates(currentAt);
  }

  Future<void> loadDailyStepsandHistory() async {
    DateTime startAt = DateTime(calendarState.selectedDate.year,
        calendarState.selectedDate.month, calendarState.selectedDate.day);
    DateTime endAt = DateTime(
        calendarState.selectedDate.year,
        calendarState.selectedDate.month,
        calendarState.selectedDate.day,
        23,
        59,
        59);
    _dailySteps.value = await HealthUtil.getSteps(startAt, endAt);
    _dailyStepsCarbonAmount.value = _dailySteps.value * 0.000125;

    _dailyHistory.value =
        await _actionHistoryRepository.readAllByDateRange(startAt, endAt);
    _dailyCarbonState.value =
        await _actionHistoryRepository.readDailyCarbonState(startAt, endAt);
    _totalCarbonState.value =
        await _actionHistoryRepository.readTotalCarbonState(startAt, endAt);
  }
}
