import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/friend/friend_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/friend/widgets/friend_search_bottom_sheet.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendScreen extends BaseScreen<FriendViewModel> {
  const FriendScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "친구",
        actions: [
          CustomIconButton(
              assetPath: "assets/icons/plus.svg",
              onPressed: () {
                Get.bottomSheet(
                  const FriendSearchBottomSheet(),
                  isScrollControlled: true,
                );
              }),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return ExtendedNestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
              SliverToBoxAdapter(child: _tabBar(context)),
              const SliverToBoxAdapter(child: SizedBox(height: 20)),
            ],
        body: _tabBarView());
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
            Tab(text: "팔로워"),
            Tab(text: "팔로잉"),
          ],
        ),
      );

  Widget _tabBarView() => TabBarView(
        controller: viewModel.tabController,
        children: const [
          Center(child: Text("Following People List")),
          Center(child: Text("Follower People List")),
        ],
      );
}
