import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/home/widgets/rive_animated_micro_phone_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class SpeechRecognizeBottomSheet extends BaseWidget<HomeViewModel> {
  final int index;
  const SpeechRecognizeBottomSheet({super.key, required this.index});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Top Indicator
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              width: Get.width * 0.2,
              height: 4.0,
              decoration: BoxDecoration(
                color: ColorSystem.grey[300],
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            const SizedBox(height: 80.0),

            // Long Question
            centerText(
              viewModel.carbonCloudStates[index].longQuestion.tr,
              style: FontSystem.KR24B.copyWith(
                color: ColorSystem.black,
              ),
            ),
            const SizedBox(height: 20.0),

            // Example Answer
            centerText(
              viewModel.carbonCloudStates[index].exampleAnswer.tr,
              style: FontSystem.KR16R.copyWith(
                color: ColorSystem.grey[500],
              ),
            ),
            const SizedBox(height: 50.0),

            // Speech Recognize Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Obx(
                () {
                  if (!viewModel.speechState.isListening) {
                    return centerText(
                      'start_speech_recognize'.tr,
                      style: FontSystem.KR16R.copyWith(color: Colors.grey[600]),
                    );
                  }
                  return centerText(
                    viewModel.speechState.speechText,
                    style: FontSystem.KR16R.copyWith(color: Colors.grey[600]),
                  );
                },
              ),
            ),

            // Spacer
            const Spacer(),

            // Speech Animation
            RiveAnimatedMicroPhoneButton(
              width: 100.0,
              height: 100.0,
              riveFileName: 'assets/riv/record_animation_for_vox.riv',
              animationName: 'RoundAnimation',
              onTap: () {
                if (viewModel.speechState.isListening) {
                  viewModel.stopSpeech().then((value) => {
                        Get.back(),
                      });
                } else {
                  viewModel.startSpeech();
                }
              },
            ),

            // Padding
            SizedBox(height: Get.height * 0.1),
          ],
        ),
      ),
    );
  }

  Widget centerText(String text, {TextStyle? style}) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }
}
