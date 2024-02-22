import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ResultFragment extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ResultFragment({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => true;

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SizedBox()),
        Obx(() {
          if (viewModel.isAnalysisResult == null) {
            return SvgPicture.asset(
              "assets/icons/server_communication_error.svg",
            );
          }

          return SvgPicture.asset(
            viewModel.isAnalysisResult!
                ? "assets/icons/clear_challenge.svg"
                : "assets/icons/failed_challenge.svg",
          );
        }),
        const SizedBox(height: 40),
        Center(
          child: Obx(() {
            if (viewModel.isAnalysisResult == null) {
              return Text(
                "server_communication_failed".tr,
                style: FontSystem.KR20B,
                textAlign: TextAlign.center,
              );
            }

            return Text(
              viewModel.isAnalysisResult!
                  ? "success_challenge".tr
                  : "failed_challenge".tr,
              style: FontSystem.KR20B,
              textAlign: TextAlign.center,
            );
          }),
        ),
        const SizedBox(height: 40),
        const Spacer(),
        SizedBox(
          width: Get.width - 32,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
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
            child: Text("confirm".tr),
          ),
        )
      ],
    );
  }
}
