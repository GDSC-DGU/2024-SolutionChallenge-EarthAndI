import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends BaseScreen<ChallengeAuthenticationViewModel> {
  const LoadingScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  Widget buildBody(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 160,
          height: 160,
          child: CircularProgressIndicator(strokeWidth: 8),
        ),
        SizedBox(height: 40),
        Center(
          child: Text(
            "제출한 사진을 분석중이에요.",
            style: FontSystem.KR20B,
          ),
        ),
      ],
    );
  }
}
