import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/views/setting/widgets/custom_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTimePickerDialog extends StatelessWidget {
  const CustomTimePickerDialog({
    super.key,
    required this.hour,
    required this.minute,
    required this.onConfirm,
    required this.onCancel,
  });

  final int hour;
  final int minute;
  final Function(int hour, int minute) onConfirm;
  final Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        constraints: BoxConstraints(
          minHeight: Get.height * 0.4,
          maxHeight: Get.height * 0.5,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              '${"notification_time".tr} ${"setting".tr}',
              style: FontSystem.KR20B,
            ),
            Expanded(
              child: CustomTimePicker(
                hour: hour,
                minute: minute,
                onConfirm: onConfirm,
                onCancel: onCancel,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
