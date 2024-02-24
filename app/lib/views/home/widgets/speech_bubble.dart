import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/home/shapes/speech_bubble_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SpeechBubble extends BaseWidget<HomeViewModel> {
  const SpeechBubble({super.key});

  @override
  Widget buildView(BuildContext context) {
    return ClipPath(
      clipper: SpeechBubbleClipper(),
      child: Container(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 8.0, bottom: 18.0),
        constraints: BoxConstraints(
          maxWidth: Get.width - 32.0,
          maxHeight: Get.height * 0.2,
        ),
        color: const Color(0xFFF3F1EE).withOpacity(0.9),
        child: Obx(
          () {
            if (viewModel.analysisState.isLoading) {
              return LoadingAnimationWidget.prograssiveDots(
                color: Colors.grey,
                size: Get.width * 0.07,
              );
            } else {
              return Text(
                viewModel.analysisState.speechBubble.tr,
                style: FontSystem.KR16M,
                textAlign: TextAlign.center,
              );
            }
          },
        ),
      ),
    );
  }
}
