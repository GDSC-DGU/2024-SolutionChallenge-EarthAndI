import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:earth_and_i/views/load_map/load_map_screen.dart';
import 'package:earth_and_i/views/profile/profile_screen.dart';
import 'package:earth_and_i/views/root/widgets/custom_bottom_navigation_bar.dart';
import 'package:earth_and_i/views/root/widgets/overlay_grey_barrier.dart';
import 'package:earth_and_i/views/root/widgets/root_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
          const RootFloatingActionButton(),
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
            children: const [
              LoadMapScreen(),
              HomeScreen(),
              ProfileScreen(),
            ],
          ),
        ),

        // Floating action button
        floatingActionButton: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 60,
            height: 60,
            color: Colors.transparent,
          ),
        ),

        // Floating action button Location
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        // Enable Behind FAB
        extendBody: true,

        // Bottom navigation bar
        bottomNavigationBar: const CustomBottomNavigationBar(),
      );
}
