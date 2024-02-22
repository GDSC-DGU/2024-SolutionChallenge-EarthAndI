import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/sign_in/sign_in_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInScreen extends BaseScreen<SignInViewModel> {
  const SignInScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "sign_in".tr,
      ),
    );
  }

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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            color: ColorSystem.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: ColorSystem.grey,
                offset: const Offset(0, 1),
                blurRadius: 3,
              ),
            ],
          ),
          child: SvgPicture.asset(
            'assets/images/app_icon.svg',
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          "Earth & I",
          style: FontSystem.KR20M,
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            width: Get.width - 32,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ColorSystem.grey[200],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              "sign_in_conditions".tr,
              style: FontSystem.KR16M,
              textAlign: TextAlign.left,
            ),
          ),
        ),
        const SizedBox(height: 20),
        MaterialButton(
          onPressed: onPressedSignInButton,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0,
          padding: const EdgeInsets.all(16),
          color: ColorSystem.green,
          child: SizedBox(
            width: Get.width - 64,
            child: Text(
              "sign_in_btn".tr,
              style: FontSystem.KR24M.copyWith(
                fontSize: 22,
                color: ColorSystem.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void onPressedSignInButton() {
    viewModel.signInWithGoogle().then((value) {
      if (value) {
        Get.back();
        Get.snackbar(
          'sign_in_success'.tr,
          'sign_in_success_long'.tr,
          snackPosition: SnackPosition.TOP,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          duration: const Duration(seconds: 2),
          backgroundColor: ColorSystem.grey.withOpacity(0.3),
        );
      } else {
        Get.snackbar(
          'sign_in_failed'.tr,
          'sign_in_failed_long'.tr,
          snackPosition: SnackPosition.TOP,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          duration: const Duration(seconds: 2),
          backgroundColor: ColorSystem.grey.withOpacity(0.3),
        );
      }
    });
  }
}
