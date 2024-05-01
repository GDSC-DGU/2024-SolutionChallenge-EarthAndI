import 'package:earth_and_i/models/profile/action_history_state.dart';
import 'package:earth_and_i/models/profile/calendar_state.dart';
import 'package:earth_and_i/models/profile/daily_delta_co2_state.dart';
import 'package:earth_and_i/models/profile/user_brief_state.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/follow_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfileViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ActionHistoryRepository _actionHistoryRepository;

  late final FollowRepository _followRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final Rx<UserBriefState> _userBriefState;
  late final Rx<CalendarState> _calendarState;
  late final Rx<DailyDeltaCO2State> _dailyDeltaCO2State;
  late final RxList<ActionHistoryState> _actionHistoryStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  UserBriefState get userBriefState => _userBriefState.value;
  CalendarState get calendarState => _calendarState.value;
  DailyDeltaCO2State get dailyDeltaCO2State => _dailyDeltaCO2State.value;
  List<ActionHistoryState> get actionHistoryStates => _actionHistoryStates;

  @override
  void onInit() async {
    super.onInit();
    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();

    _followRepository = Get.find<FollowRepository>();

    // Private Fields
    _userBriefState = _userRepository.readUserBriefState().obs;
    _calendarState = CalendarState.initial().obs;
    _dailyDeltaCO2State = DailyDeltaCO2State.initial().obs;
    _actionHistoryStates = <ActionHistoryState>[].obs;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    fetchUserBriefState();
    fetchDailyDeltaCO2State(_calendarState.value.selectedDate);
    fetchActionHistoryStates(_calendarState.value.selectedDate);
  }

  @override
  void onClose() {
    super.onClose();
    _userBriefState.close();
    _calendarState.close();
    _dailyDeltaCO2State.close();
    _actionHistoryStates.close();
  }

  void updateFocusedDate(DateTime focusedDay) {
    _calendarState.value = _calendarState.value.copyWith(
      focusedDate: focusedDay,
    );
  }

  void changeSelectedDate(DateTime selectedDate) {
    if (!isSameDay(selectedDate, _calendarState.value.selectedDate)) {
      _calendarState.value = _calendarState.value.copyWith(
        selectedDate: selectedDate,
        focusedDate: selectedDate,
      );
    }

    fetchDailyDeltaCO2State(selectedDate);
    fetchActionHistoryStates(selectedDate);
  }

  void fetchUserBriefState() async {
    UserBriefState temp = _userRepository.readUserBriefState();

    if (SecurityUtil.isSignin) {
      _userBriefState.value = _userBriefState.value.copyWith(
        id: temp.id,
        nickname: temp.nickname,
        followingCount: await _followRepository.readFollowingsCount(),
        followerCount: await _followRepository.readFollowersCount(),
      );
    } else {
      _userBriefState.value = _userBriefState.value.copyWith(
        id: "GUEST",
        nickname: "GUEST",
        followingCount: 0,
        followerCount: 0,
      );
    }
  }

  void fetchDailyDeltaCO2State(DateTime? currentAt) async {
    currentAt ??= Get.find<RootViewModel>().currentAt;

    if (!isSameDay(currentAt, _calendarState.value.selectedDate)) {
      return;
    }

    _dailyDeltaCO2State.value =
        await _actionHistoryRepository.readDailyDeltaCO2State(currentAt);
  }

  void fetchActionHistoryStates(DateTime? currentAt) async {
    currentAt ??= Get.find<RootViewModel>().currentAt;

    if (!isSameDay(currentAt, _calendarState.value.selectedDate)) {
      return;
    }

    _actionHistoryStates.value =
        await _actionHistoryRepository.readActionHistoryStates(
      currentAt,
      0,
      20,
    );
  }
}
