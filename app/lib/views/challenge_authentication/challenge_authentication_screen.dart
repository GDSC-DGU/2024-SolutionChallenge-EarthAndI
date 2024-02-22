import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/challenge_authentication/fragment/image_input_fragment.dart';
import 'package:earth_and_i/views/challenge_authentication/fragment/loading_fragment.dart';
import 'package:earth_and_i/views/challenge_authentication/fragment/result_fragment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChallengeAuthenticationScreen
    extends BaseScreen<ChallengeAuthenticationViewModel> {
  const ChallengeAuthenticationScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: Obx(
        () => AppBar(
          title: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Text(
              'challenge_authentication_title'.tr,
              style: FontSystem.KR20SB120,
            ),
          ),
          centerTitle: false,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: viewModel.currentPageIndex == 0 ? 0 : 16,
          leadingWidth: 50,
          leading: leadingWidget(),
        ),
      ),
    );
  }

  Widget? leadingWidget() {
    if (viewModel.currentPageIndex == 0) {
      return IconButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        icon: SvgPicture.asset(
          "assets/icons/arrow_back.svg",
          width: 24,
          height: 24,
        ),
        onPressed: () {
          Get.back();
        },
      );
    } else {
      return null;
    }
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
      child: PageView(
        controller: viewModel.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          ImageInputFragment(),
          LoadingFragment(),
          ResultFragment(),
        ],
      ),
    );
  }
}
