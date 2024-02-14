import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(2.0),
              ),
            ),
            const SizedBox(height: 80.0),
            Text(
              viewModel.carbonCloudStates[index].longQuestion,
              style: FontSystem.KR24B.copyWith(
                color: const Color(0xFF000000),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              viewModel.carbonCloudStates[index].exampleAnswer,
              style: FontSystem.KR16R.copyWith(
                color: const Color(0xFFACADB2),
              ),
            ),
            const SizedBox(height: 20.0),
            Obx(
              () => Text(
                viewModel.speechState.speechText,
                style: FontSystem.KR16R.copyWith(color: Colors.grey[600]),
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
          Obx(
            () => ElevatedButton(
              onPressed: !viewModel.speechState.isListening
                  ? () {
                      viewModel.startSpeech(index);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorSystem.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Container(
                width: 100.0,
                height: 40.0,
                alignment: Alignment.center,
                child: Text(
                  '시작',
                  style: FontSystem.KR16M.copyWith(
                    color: const Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Obx(
            () => ElevatedButton(
              onPressed: viewModel.speechState.isListening
                  ? () async {
                      await viewModel.stopSpeech();
                      Get.back();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorSystem.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Container(
                width: 100.0,
                height: 40.0,
                alignment: Alignment.center,
                child: Text(
                  '종료',
                  style: FontSystem.KR16M.copyWith(
                    color: ColorSystem.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
