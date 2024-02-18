import 'package:earth_and_i/models/setting/alarm_state.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
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
  late final RxString _languageName;
  late final Rx<AlarmState> _alarmState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  String get languageName => _languageName.value;
  AlarmState get alarmState => _alarmState.value;

  @override
  void onInit() {
    super.onInit();
    // DI
    _userRepository = Get.find<UserRepository>();

    // Rx
    _languageName = Get.deviceLocale.toString().obs;
    _alarmState = _userRepository.readAlarmState().obs;
  }

  void onIsAlarmSwitch() {
    _userRepository
        .updateUserSetting(isActive: !_alarmState.value.isActive)
        .then((value) => _alarmState.value = value);
  }

  void changeAlarmTime(int hour, int minute) {
    _userRepository
        .updateUserSetting(
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
    } catch (e) {
      return false;
    }

    informChangedSignInState();

    return true;
  }

  void informChangedSignInState() {
    Get.find<RootViewModel>().fetchSignInState();
    Get.find<ProfileViewModel>().fetchUserBriefState();
  }
}
