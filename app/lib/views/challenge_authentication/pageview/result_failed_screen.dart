import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResultFailedScreen extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ResultFailedScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        SvgPicture.asset("assets/icons/failed_challenge.svg"),
        const SizedBox(height: 40),
        const Center(
          child: Text(
            "제출한 사진이 잘못된 것 같아요!",
            style: FontSystem.KR20B,
          ),
        ),
        const SizedBox(height: 40),
        const Expanded(child: SizedBox()),
        SizedBox(
          width: Get.width - 32,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              viewModel.resetImageAndPage();
              Get.back();
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
            child: const Text("확인"),
          ),
        )
      ],
    );
  }
}
