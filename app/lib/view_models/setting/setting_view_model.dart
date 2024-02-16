import 'package:flutter/material.dart';
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
    List<String> parts = _alramTime.split(':');
    int hourPart = int.parse(parts[0]);
    int minutePart = int.parse(parts[1]);
    TimeOfDay initialTime = TimeOfDay(hour: hourPart, minute: minutePart);

    showTimePicker(context: Get.context!, initialTime: initialTime)
        .then((selectedTime) {
      if (selectedTime != null && selectedTime != initialTime) {
        int hour = selectedTime.hour;
        int minute = selectedTime.minute;
        _alramTime.value =
            "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}";
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
