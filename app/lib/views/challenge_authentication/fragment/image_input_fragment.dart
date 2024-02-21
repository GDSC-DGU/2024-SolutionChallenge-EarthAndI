import 'dart:io';

import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageInputFragment extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ImageInputFragment({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Get.arguments.shortTitle.toString().tr,
            style: FontSystem.KR20SB120),
        const SizedBox(height: 8),
        Text(Get.arguments.longTitle.toString().tr, style: FontSystem.KR16M),
        const SizedBox(height: 20),
        Obx(
          () => viewModel.image == null
              ? Expanded(
                  child: Center(
                    child: Container(
                      color: ColorSystem.grey[100],
                    ),
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Image.file(
                      File(viewModel.image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
        ),
        const SizedBox(height: 20),
        Center(
          child: SizedBox(
            width: Get.width * 0.92,
            height: 56,
            child: OutlinedButton(
              onPressed: () => viewModel.getImage(),
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: ColorSystem.green[500],
                textStyle: FontSystem.KR20M,
                foregroundColor: Colors.white,
                side: BorderSide(
                  color: ColorSystem.green[500]!,
                  width: 1,
                ),
              ),
              child: const Text("사진 선택하기"),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: SizedBox(
            width: Get.width * 0.92,
            height: 56,
            child: Obx(
              // 이미지가 없는 경우의 OutlinedButton
              () => viewModel.image == null
                  ? OutlinedButton(
                      onPressed: null,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: ColorSystem.grey[100],
                        textStyle: FontSystem.KR20M,
                        foregroundColor: ColorSystem.grey[500],
                        side: BorderSide(
                          color: ColorSystem.grey[100]!,
                          width: 1,
                        ),
                      ),
                      child: const Text("인증하기"),
                    )
                  // 이미지가 있는 경우의 OutlinedButton
                  : OutlinedButton(
                      // 인증하기 API 호출 (challenge의 index + 1, image(base64))
                      onPressed: () {
                        viewModel.authChallenge(viewModel.image!);
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        backgroundColor: ColorSystem.green[500],
                        textStyle: FontSystem.KR20M,
                        foregroundColor: ColorSystem.white,
                        side: BorderSide(
                          color: ColorSystem.green[500]!,
                          width: 1,
                        ),
                      ),
                      child: const Text("인증하기"),
                    ),
            ),
          ),
        )
      ],
    );
  }
}
