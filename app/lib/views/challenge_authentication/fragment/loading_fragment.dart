import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoadingFragment extends BaseScreen<ChallengeAuthenticationViewModel> {
  const LoadingFragment({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => true;

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: Get.height * 0.6,
                child: RiveAnimation.asset(
                  "assets/riv/loading_animation_earth.riv",
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  controllers: [
                    viewModel.animationController,
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        Positioned(
          top: Get.height * 0.6,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 100,
            child: Center(
              child: DefaultTextStyle(
                style: FontSystem.KR20B,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText(
                      'loading_analysis_image'.tr,
                      textAlign: TextAlign.center,
                      duration: const Duration(seconds: 2),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
