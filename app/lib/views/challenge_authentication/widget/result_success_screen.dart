import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/challenge_authentication/challenge_authentication_screen.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:earth_and_i/views/load_map/load_map_screen.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultSuccessScreen extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ResultSuccessScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        const Column(
          children: [
            Center(
              child: Text(
                "챌린지 달성 완료!",
                style: FontSystem.KR20B,
              ),
            ),
            Center(
              child: Text(
                "새로운 챌린지를 확인해보세요.",
                style: FontSystem.KR20B,
              ),
            )
          ],
        ),
        const SizedBox(height: 40),
        const Expanded(child: SizedBox()),
        SizedBox(
          width: Get.width - 32,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              viewModel.resetImageAndPage();
              Get.back(closeOverlays: true);
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
