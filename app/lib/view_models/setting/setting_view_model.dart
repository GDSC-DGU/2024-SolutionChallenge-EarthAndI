import 'package:earth_and_i/models/setting/alarm_state.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SettingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isSignIn;
  late final RxString _languageName;
  late final Rx<AlarmState> _alarmState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isSignIn => _isSignIn.value;
  String get languageName => _languageName.value;
  AlarmState get alarmState => _alarmState.value;

  @override
  void onInit() {
    super.onInit();
    // DI Fields
    _userRepository = Get.find<UserRepository>();

    // Private Fields
    _isSignIn = (SecurityUtil.isSignin).obs;
    _languageName = Get.deviceLocale?.languageCode.obs ?? 'ko'.obs;
    _alarmState = _userRepository.readAlarmState().obs;
  }

  void onIsAlarmSwitch() {
    _userRepository
        .updateUserAlarmSetting(isActive: !_alarmState.value.isActive)
        .then((value) => _alarmState.value = value);
  }

  void changeAlarmTime(int hour, int minute) {
    _userRepository
        .updateUserAlarmSetting(
          hour: hour,
          minute: minute,
        )
        .then((value) => _alarmState.value = value);
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _userRepository.updateUserBriefInformation(
        id: 'GUEST',
        nickname: 'GUEST',
      );
      _isSignIn.value = false;
    } catch (e) {
      return false;
    }

    informChangedSignInState();

    return true;
  }

  void fetchSignInState() {
    _isSignIn.value = SecurityUtil.isSignin;
  }

  void informChangedSignInState() {
    Get.find<ProfileViewModel>().fetchUserBriefState();
  }
}
