import 'package:earth_and_i/models/setting/alarm_state.dart';
import 'package:earth_and_i/repositories/action_history_repository.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ActionHistoryRepository _actionHistoryRepository;
  late final ChallengeHistoryRepository _challengeHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isSignIn;
  late final RxString _languageName;
  late final Rx<NotificationState> _alarmState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isSignIn => _isSignIn.value;
  String get languageName => _languageName.value;
  NotificationState get alarmState => _alarmState.value;

  @override
  void onInit() {
    super.onInit();
    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _actionHistoryRepository = Get.find<ActionHistoryRepository>();
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();

    // Private Fields
    _isSignIn = (SecurityUtil.isSignin).obs;
    _languageName = Get.deviceLocale?.languageCode.obs ?? 'ko'.obs;
    _alarmState = _userRepository.readNotificationState().obs;
  }

  void onIsAlarmSwitch() async {
    await _userRepository.updateUserNotificationSetting(
      isActive: !_alarmState.value.isActive,
    );

    _alarmState.value = _userRepository.readNotificationState();
  }

  void changeAlarmTime(int hour, int minute) async {
    await _userRepository.updateUserNotificationSetting(
      hour: hour,
      minute: minute,
    );

    _alarmState.value = _userRepository.readNotificationState();
  }

  Future<bool> signOut() async {
    await _userRepository.updateUserInformation(isSignIn: false);

    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      return false;
    }
    _isSignIn.value = false;

    informProfileViewModel();

    return true;
  }

  Future<bool> withdrawal() async {
    await _userRepository.deleteUser();
    await _actionHistoryRepository.deleteAllActionHistories();
    await _challengeHistoryRepository.deleteAllChallengeHistories();

    try {
      await FirebaseAuth.instance.currentUser?.delete();
    } catch (e) {
      return false;
    }

    _isSignIn.value = false;

    informProfileViewModel();
    informHomeViewModel();
    informLoadMapViewModel();

    return true;
  }

  void fetchSignInState() {
    _isSignIn.value = SecurityUtil.isSignin;
  }

  void informProfileViewModel() {
    Get.find<ProfileViewModel>().fetchUserBriefState();
  }

  void informHomeViewModel() {
    Get.find<HomeViewModel>().fetchDeltaCO2(null);
    Get.find<HomeViewModel>().fetchCharacterStatsState(null, null);
    Get.find<HomeViewModel>()
        .fetchCarbonCloudStates(Get.find<RootViewModel>().currentAt);
  }

  void informLoadMapViewModel() {
    Get.find<LoadMapViewModel>().fetchCurrentChallenge();
    Get.find<LoadMapViewModel>().fetchChallengeHistories();
  }
}
