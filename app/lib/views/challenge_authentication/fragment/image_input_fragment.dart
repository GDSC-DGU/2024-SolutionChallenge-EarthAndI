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
  bool get setBottomOuterSafeArea => true;

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
            child: TextButton(
              onPressed: viewModel.getImage,
              style: TextButton.styleFrom(
                textStyle: FontSystem.KR20M.copyWith(color: ColorSystem.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: ColorSystem.green,
                foregroundColor: ColorSystem.white,
              ),
              child: Text(
                "image_picker_btn".tr,
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: SizedBox(
            width: Get.width * 0.92,
            height: 56,
            child: Obx(() {
              TextStyle textStyle = viewModel.image == null
                  ? FontSystem.KR20M.copyWith(color: ColorSystem.grey)
                  : FontSystem.KR20M.copyWith(color: ColorSystem.white);
              Color backgroundColor = viewModel.image == null
                  ? ColorSystem.white
                  : ColorSystem.green;
              BorderSide? side = viewModel.image == null
                  ? BorderSide(color: ColorSystem.grey)
                  : null;
              String text = viewModel.image == null ? "인증하기" : "인증하기";

              return TextButton(
                onPressed: viewModel.image == null
                    ? null
                    : viewModel.authenticationChallenge,
                style: TextButton.styleFrom(
                  textStyle: textStyle,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: backgroundColor,
                  foregroundColor: ColorSystem.white,
                  side: side,
                ),
                child: Text(
                  "authentication_btn".tr,
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
