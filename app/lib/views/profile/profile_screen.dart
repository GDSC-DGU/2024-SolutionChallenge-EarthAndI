import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/profile/widgets/user_profile.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultAppBar(
        title: "",
        actions: [
          CustomIconButton(
            assetPath: "assets/icons/setting.svg",
            onPressed: () {
              Get.toNamed(Routes.SETTING);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const UserProfile(),
        _tabBar(context),
        _tabBarView(),
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

          tabs: const [
            Tab(text: "배지"),
            Tab(text: "기록"),
          ],
        ),
      );

  Widget _tabBarView() => Expanded(
        child: TabBarView(
          controller: viewModel.tabController,
          children: const [
            Center(child: Text("Badge Screen")),
            Center(child: Text("Record Screen")),
          ],
        ),
      );
}
