import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingViewModel extends GetxController {
  late final RxBool _isAlram;
  late final RxString _alramTime;
  bool get isAlram => _isAlram.value;
  String get alramTime => _alramTime.value;

  @override
  void onInit() {
    super.onInit();
    _isAlram = true.obs;
    _alramTime = "09:00".obs;
  }

  void onIsAlramSwitch() {
    _isAlram.value = !_isAlram.value;
  }

  void setAlramTime(String currentAlramTime) {
    _alramTime.value = currentAlramTime;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
