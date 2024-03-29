import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/widgets/button/rounded_rectangle_text_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'sign_in_required'.tr,
              style: FontSystem.KR20B,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: RoundedRectangleTextButton(
                      text: 'cancel'.tr,
                      textStyle: FontSystem.KR16B.copyWith(
                        color: ColorSystem.grey,
                      ),
                      height: 50,
                      backgroundColor: ColorSystem.white,
                      foregroundColor: ColorSystem.grey,
                      borderSide: BorderSide(
                        color: ColorSystem.grey,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RoundedRectangleTextButton(
                      text: 'sign_in'.tr,
                      textStyle: FontSystem.KR16B.copyWith(
                        color: ColorSystem.white,
                      ),
                      height: 50,
                      backgroundColor: ColorSystem.green,
                      foregroundColor: ColorSystem.white,
                      onPressed: () {
                        Get.back();
                        Get.toNamed(Routes.SIGN_IN);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
