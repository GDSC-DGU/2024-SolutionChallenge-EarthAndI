import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/widgets/button/rounded_rectangle_text_button.dart';
import 'package:earth_and_i/widgets/dialog/sign_in_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChallengeDialog extends StatelessWidget {
  const ChallengeDialog({
    super.key,
    this.state,
    this.isComingSoon = true,
  });

  final ChallengeHistoryState? state;
  final bool isComingSoon;

  @override
  Widget build(BuildContext context) {
    double width = Get.width * 0.8;
    double widthWithoutPadding = Get.width * 0.8 - 32;

    return Dialog(
      child: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            titleView(widthWithoutPadding),
            const SizedBox(height: 16),
            ...contentView(widthWithoutPadding),
          ],
        ),
      ),
    );
  }

  Widget titleView(double width) {
    String shortTitle;
    String longTitle;

    if (state == null) {
      shortTitle = "clear_all_challenge_short_title".tr;
      longTitle = "clear_all_challenge_long_title".tr;
    } else {
      shortTitle = state!.type.shortTitle.tr;
      longTitle = state!.type.longTitle.tr;
    }

    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: state != null && state!.isCompleted ? width - 48 : width - 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shortTitle.tr,
                  style: FontSystem.KR18B,
                ),
                Text(
                  longTitle.tr,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: FontSystem.KR12R,
                ),
              ],
            ),
          ),
          if (state != null && state!.isCompleted)
            SizedBox(
              width: 46,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/check_small.svg",
                      width: 36,
                      height: 36,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat("yy/MM/dd").format(state!.completedAt!),
                    style: FontSystem.KR10R.copyWith(
                      color: ColorSystem.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> contentView(double widthWithoutPadding) {
    String assetPath;
    String description;
    String buttonText;

    if (state == null) {
      assetPath = "assets/icons/clear_challenge.png";
      description = "clear_all_challenge_description".tr;
      buttonText = "confirm".tr;
    } else {
      assetPath = 'assets/icons/${state!.type.assetPath}';
      description = state!.type.description.tr;
      buttonText = state!.isCompleted || isComingSoon
          ? "confirm".tr
          : 'challenge_authentication_title'.tr;
    }
    return [
      ClipRRect(
        borderRadius: BorderRadius.circular(36),
        child: Image.asset(
          assetPath,
          fit: BoxFit.fill,
          width: widthWithoutPadding,
        ),
      ),
      const SizedBox(height: 16),
      Text(
        description,
        style: FontSystem.KR16M,
        textAlign: TextAlign.start,
      ),
      const SizedBox(height: 16),
      RoundedRectangleTextButton(
        text: buttonText,
        textStyle: FontSystem.KR16B.copyWith(
          color: ColorSystem.white,
        ),
        width: widthWithoutPadding,
        height: 48,
        backgroundColor: ColorSystem.green,
        foregroundColor: ColorSystem.white,
        onPressed: _onPressedButton,
      ),
    ];
  }

  void _onPressedButton() {
    if (state == null || state!.isCompleted || isComingSoon) {
      Get.back();
      return;
    }

    if (SecurityUtil.isSignin) {
      Get.toNamed(
        Routes.CHALLENGE_AUTHENTICATION,
        arguments: state!.type,
      );
    } else {
      Get.dialog(const SignInDialog());
    }
  }
}
