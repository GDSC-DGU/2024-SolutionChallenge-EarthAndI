import 'package:get/get.dart';

class SettingViewModel extends GetxController {
  late final RxBool _isAlram = true.obs;
  late final RxString _alramTime = "09:00".obs;

  bool get isAlram => _isAlram.value;
  String get alramTime => _alramTime.value;

  @override
  void onInit() {
    super.onInit();
  }

  void onIsAlramSwitch() {
    _isAlram.value = !_isAlram.value;
  }

  void onAlramTimeSet() {
    print("클릭");
  }

  @override
  void dispose() {
    super.dispose();
  }
}
