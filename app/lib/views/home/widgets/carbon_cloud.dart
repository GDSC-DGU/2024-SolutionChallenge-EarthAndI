import 'package:auto_size_text/auto_size_text.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarbonCloudBubble extends BaseWidget<HomeViewModel> {
  const CarbonCloudBubble({super.key, required this.text});

  final String text;

  @override
  Widget buildView(BuildContext context) {
    return InkWell(
      onTap: () {
        if (viewModel.isLoadingAnalysis) {
          Get.snackbar(
            '분석 중',
            '분석 중에는 탄소발자국을 확인할 수 없습니다.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color(0xFFF3F1EE).withOpacity(0.7),
            colorText: const Color(0xFF000000),
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            borderRadius: 24.0,
            snackStyle: SnackStyle.FLOATING,
            duration: const Duration(seconds: 2),
          );
        } else {
          Get.snackbar(
            '탄소발자국',
            '탄소발자국은 탄소배출량을 의미합니다.',
            snackPosition: SnackPosition.TOP,
            backgroundColor: const Color(0xFFF3F1EE).withOpacity(0.7),
            colorText: const Color(0xFF000000),
            margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            borderRadius: 24.0,
            snackStyle: SnackStyle.FLOATING,
            duration: const Duration(seconds: 2),
          );
        }
      },
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        constraints: BoxConstraints(
          maxWidth: Get.width * 0.5,
          maxHeight: Get.height * 0.2,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFFF3F1EE).withOpacity(0.9),
        ),
        child: AutoSizeText(
          text,
          style: FontSystem.KR16M,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
