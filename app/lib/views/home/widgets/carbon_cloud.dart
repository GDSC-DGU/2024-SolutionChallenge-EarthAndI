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
        viewModel.startSpeech();
      },
      borderRadius: BorderRadius.circular(24.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        constraints: BoxConstraints(
          maxWidth: (Get.width - 32) * 0.5,
          maxHeight: Get.height * 0.1,
        ),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFFF3F1EE).withOpacity(0.9),
        ),
        child: AutoSizeText(
          text,
          style: FontSystem.KR14M,
          maxFontSize: 14.0,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
