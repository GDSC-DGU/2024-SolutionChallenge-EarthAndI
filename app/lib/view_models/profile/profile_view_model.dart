import 'package:earth_and_i/models/profile/daily_carbon_state.dart';
import 'package:earth_and_i/models/profile/weekly_calendar_state.dart';
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
  late final Rx<WeeklyCalendarState> _calendarState;
  late final Rx<DailyCarbonState> _dailyCarbonState;
  late final RxString _nickname;
  late final RxInt _dailySteps;
  late final RxDouble _dailyStepsCarbonAmount;
  late final RxList _dailyHistory;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  WeeklyCalendarState get calendarState => _calendarState.value;
  DailyCarbonState get dailyCarbonState => _dailyCarbonState.value;
  String get nickname => _nickname.value;
  int get dailySteps => _dailySteps.value;
  double get dailyStepsCarbonAmount => _dailyStepsCarbonAmount.value;
  List<dynamic> get dailyHistory => _dailyHistory;

  @override
  void onInit() async {
    super.onInit();
    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();

    _nickname = _userRepository.readNickname().obs;

    _calendarState = WeeklyCalendarState.initial().obs;
    _dailyCarbonState = _userRepository.readDailyCarbonState().obs;
    _dailySteps = 0.obs;
    _dailyStepsCarbonAmount = 0.0.obs;
    _dailyHistory = <dynamic>[].obs;

    await loadDailyStepsandHistory();
  }

  void changeSelectedDate(DateTime selectedDate) {
    if (!isSameDay(selectedDate, _calendarState.value.selectedDate)) {
      _calendarState.value = _calendarState.value
          .copyWith(selectedDate: selectedDate, focusedDate: selectedDate);
    }
    loadDailyStepsandHistory();
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
  }

  @override
  void dispose() {
    super.dispose();
    _calendarState.close();
    _dailyCarbonState.close();
  }
}
