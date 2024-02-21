import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:earth_and_i/views/load_map/load_map_screen.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_dialog.dart';
import 'package:earth_and_i/views/profile/profile_screen.dart';
import 'package:earth_and_i/views/root/widgets/custom_bottom_navigation_bar.dart';
import 'package:earth_and_i/views/root/widgets/overlay_grey_barrier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RootScreen extends GetView<RootViewModel> {
  const RootScreen({super.key});

  RootViewModel get viewModel => controller;

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    if (!viewModel.initialized) {
      viewModel.initialized;
    }

    return Material(
      child: Stack(
        children: [
          buildScreen(),
          const OverlayGreyBarrier(),
          Obx(
            () => viewModel.isEnableGreyBarrier
                ? Center(
                    child: GestureDetector(
                      onTap: () {
                        Get.find<HomeViewModel>().stopSpeech();
                      },
                      child: const Text(
                        '음성인식',
                        style: FontSystem.KR42B,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget buildScreen() => Scaffold(
        backgroundColor: Colors.white,
        body: Obx(
          () => IndexedStack(
            index: viewModel.selectedIndex,
            children: [
              const LoadMapScreen(),
              HomeScreen(),
              const ProfileScreen(),
            ],
          ),
        ),

        // Floating action button
        floatingActionButton: buildFloatingActionButton(),

        // Floating action button Location
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // Enable Behind FAB
        extendBody: true,

        // Bottom navigation bar
        bottomNavigationBar: const CustomBottomNavigationBar(),
      );

  FloatingActionButton buildFloatingActionButton() => FloatingActionButton(
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
}
