import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:earth_and_i/views/load_map/load_map_screen.dart';
import 'package:earth_and_i/views/profile/profile_screen.dart';
import 'package:earth_and_i/views/root/widgets/verification_menu.dart';
import 'package:earth_and_i/views/root/widgets/custom_bottom_navigation_bar.dart';
import 'package:earth_and_i/views/root/widgets/verification_grey_barrier.dart';
import 'package:earth_and_i/views/root/widgets/root_floating_action_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends GetView<RootViewModel> {
  const RootScreen({super.key});

  RootViewModel get viewModel => controller;

  @override
  Widget build(BuildContext context) {
    if (!viewModel.initialized) {
      viewModel.initialized;
    }

    return Material(
      child: Stack(
        children: [
          buildScreen(),
          const VerificationGreyBarrier(),
          const RootFloatingActionButton(),
          const VerificationMenu(),
        ],
      ),
    );
  }

  Widget buildScreen() => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: viewModel.selectedIndex,
              children: const [
                LoadMapScreen(),
                HomeScreen(),
                ProfileScreen(),
              ],
            ),
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
