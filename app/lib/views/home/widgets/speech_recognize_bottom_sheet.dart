import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
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
            centerText(
              viewModel.carbonCloudStates[index].longQuestion.tr,
              style: FontSystem.KR24B.copyWith(
                color: ColorSystem.black,
              ),
            ),
            const SizedBox(height: 20.0),
            centerText(
              viewModel.carbonCloudStates[index].exampleAnswer.tr,
              style: FontSystem.KR16R.copyWith(
                color: ColorSystem.grey[500],
              ),
            ),
            const SizedBox(height: 50.0),
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
            const Spacer(),
            _speechAnimationView(),
            SizedBox(height: Get.height * 0.1),
          ],
        ),
      ),
    );
  }

  // 음성인식 버튼에 대한 애니메이션 박스
  Widget _speechAnimationView() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (viewModel.speechState.isListening) {
                viewModel.stopSpeech().then((value) => {
                      Get.back(),
                    });
              } else {
                viewModel.startSpeech(index);
              }
            },
            child: SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  RiveAnimation.asset(
                    'assets/riv/record_animation_for_vox.riv',
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    // Tap시 애니메이션 시작
                    controllers: [
                      viewModel.animationController,
                    ],
                  ),
                  Center(
                    child: Obx(
                      () => Icon(
                        viewModel.speechState.isListening
                            ? Icons.stop
                            : Icons.mic_rounded,
                        size: 40.0,
                        color: ColorSystem.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget centerText(String text, {TextStyle? style}) {
    return Text(
      text,
      style: style,
      textAlign: TextAlign.center,
    );
  }
}
