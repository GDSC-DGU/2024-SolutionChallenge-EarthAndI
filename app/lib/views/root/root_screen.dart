import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:earth_and_i/views/load_map/load_map_screen.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_dialog.dart';
import 'package:earth_and_i/views/profile/profile_screen.dart';
import 'package:earth_and_i/views/root/widgets/custom_bottom_navigation_bar.dart';
import 'package:earth_and_i/views/sign_in/widget/overlay_grey_barrier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RootScreen extends BaseScreen<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget buildBody(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: viewModel.selectedIndex,
        children: const [
          LoadMapScreen(),
          HomeScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }

  @override
  Widget? get buildFloatingActionButton => FloatingActionButton(
        elevation: 2,
        shape: const CircleBorder(),
        onPressed: () {
          if (viewModel.isEnableGreyBarrier) {
            return;
          }

          if (viewModel.selectedIndex != 1) {
            viewModel.changeIndex(1);
          } else {
            Get.dialog(ChallengeDialog(
                challenge: viewModel.currentChallengeHistoryState[0],
                isCompleted:
                    viewModel.currentChallengeHistoryState[0].isCompleted));
          }
        },
        backgroundColor: const Color(0xFF90CDBE),
        child: Obx(
          () => SvgPicture.asset(
            viewModel.selectedIndex != 1
                ? 'assets/icons/home.svg'
                : 'assets/icons/verification_echo.svg',
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        ),
      );

  @override
  FloatingActionButtonLocation? get floatingActionButtonLocation =>
      FloatingActionButtonLocation.centerDocked;

  @override
  bool get extendBodyBehindAppBar => true;

  @override
  Widget? buildBottomNavigationBar(BuildContext context) =>
      const CustomBottomNavigationBar();
}
