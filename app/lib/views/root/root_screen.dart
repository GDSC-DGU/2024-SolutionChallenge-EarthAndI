import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:earth_and_i/views/load_map/load_map_screen.dart';
import 'package:earth_and_i/views/profile/profile_screen.dart';
import 'package:earth_and_i/views/root/widgets/custom_bottom_navigation_bar.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RootScreen extends GetView<RootViewModel> {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 만약 뷰 모델이 초기화되지 않았다면 초기화 메서드를 호출
    if (!viewModel.initialized) {
      initViewModel();
    }

    return SafeArea(
      child: Material(
        child: Stack(
          children: [
            Scaffold(
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
              floatingActionButton: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: 60,
                  height: 60,
                  color: Colors.transparent,
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              extendBody: true,
              bottomNavigationBar: const CustomBottomNavigationBar(),
            )
          ],
        ),
      ),
    );
  }

  /// 뷰 모델을 초기화하는 메서드
  @protected
  void initViewModel() {
    viewModel.initialized;
  }

  /// 뷰 모델을 가져오는 메서드
  @protected
  RootViewModel get viewModel => controller;
}
