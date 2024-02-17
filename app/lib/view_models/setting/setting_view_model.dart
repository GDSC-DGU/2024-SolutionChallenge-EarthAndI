import 'package:earth_and_i/models/alarm_state.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
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
  late final RxBool _isSignin;
  late final RxString _languageName;
  late final Rx<AlarmState> _alarmState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isSignin => _isSignin.value;
  String get languageName => _languageName.value;
  AlarmState get alarmState => _alarmState.value;

  @override
  void onInit() {
    super.onInit();
    // DI
    _userRepository = Get.find<UserRepository>();

    // Rx
    _isSignin = (FirebaseAuth.instance.currentUser != null).obs;
    _languageName = Get.deviceLocale.toString().obs;
    _alarmState = AlarmState.initial().obs;
  }

  void onIsAlarmSwitch() {
    _alarmState.value = _alarmState.value.copyWith(
      isActive: !_alarmState.value.isActive,
    );
  }

  void changeAlarmTime(int hour, int minute) {
    _alarmState.value = _alarmState.value.copyWith(
      hour: hour,
      minute: minute,
    );
  }
}
