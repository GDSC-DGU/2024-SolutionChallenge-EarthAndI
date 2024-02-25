import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/follow/follow_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/follow_item.dart';

class FollowScreen extends BaseScreen<FollowViewModel> {
  const FollowScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "follow".tr,
        actions: [
          CustomIconButton(
              assetPath: "assets/icons/plus.svg",
              onPressed: () {
                Get.toNamed(Routes.USER_SEARCH);
              }),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      children: [
        _tabBar(context),
        Expanded(child: _tabBarView()),
      ],
    );
  }

  Widget _tabBar(BuildContext context) => SizedBox(
        width: Get.width,
        height: Get.width * 0.12,
        child: TabBar(
          controller: viewModel.tabController,
          padding: const EdgeInsets.only(left: 16, right: 16),

          indicatorColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,

          // 선택된 탭의 색상과 폰트 스타일
          labelColor: Colors.black,
          labelStyle: FontSystem.KR16SB,

          // 선택되지 않은 탭의 색상과 폰트 스타일
          unselectedLabelColor: const Color(0xFFACADB2),
          unselectedLabelStyle: FontSystem.KR16SB,

          // 탭 선택시 하이라이트 제거
          overlayColor: MaterialStateProperty.all(Colors.transparent),

          tabs: [
            Tab(text: "following".tr),
            Tab(text: "follower".tr),
          ],
        ),
      );

  Widget _tabBarView() => TabBarView(
        controller: viewModel.tabController,
        children: [
          Obx(
            () => ListView.builder(
              itemCount: viewModel.followingStates.length,
              itemBuilder: (context, index) {
                return FollowItem(
                  state: viewModel.followingStates[index],
                  onPressed: () {
                    viewModel.onPressedFollowButton(
                      isFollowingTab: true,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
          Obx(
            () => ListView.builder(
              itemCount: viewModel.followerStates.length,
              itemBuilder: (context, index) {
                return FollowItem(
                  state: viewModel.followerStates[index],
                  onPressed: () {
                    viewModel.onPressedFollowButton(
                      isFollowingTab: false,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ],
      );
}
