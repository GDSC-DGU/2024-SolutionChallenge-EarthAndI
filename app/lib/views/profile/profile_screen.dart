import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/profile/delegate/calendar_delegate.dart';
import 'package:earth_and_i/views/profile/widgets/color_sized_box.dart';
import 'package:earth_and_i/views/profile/widgets/delta_co2_bar_chart.dart';
import 'package:earth_and_i/views/profile/widgets/action_history_item.dart';
import 'package:earth_and_i/views/profile/widgets/follow_count_button.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
import 'package:earth_and_i/widgets/dialog/sign_in_dialog.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/delta_co2_text.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  Color? get screenBackgroundColor => ColorSystem.grey[200];

  @override
  Widget buildBody(BuildContext context) {
    return ExtendedNestedScrollView(
      headerSliverBuilder: _sliverBuilder,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            _dailyDeltaCO2View(),
            const SizedBox(height: 16),
            _actionHistoriesView(),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  List<Widget> _sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
    return [
      // AppBar
      SliverToBoxAdapter(
        child: PreferredSize(
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
        ),
      ),

      // User Brief View
      SliverToBoxAdapter(child: userBriefView()),

      // Gap
      SliverToBoxAdapter(
        child: ColorSizedBox(
          height: 28,
          color: ColorSystem.white,
        ),
      ),

      // Weekly Calendar
      SliverPersistentHeader(
        pinned: true,
        delegate: CalendarDelegate(),
      ),
    ];
  }

  Widget userBriefView() => Container(
        width: Get.width,
        height: 60,
        color: ColorSystem.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            SizedBox(
              width: Get.width - 185,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      viewModel.userBriefState.nickname,
                      style: FontSystem.KR20SB120,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Obx(
                    () => Text(
                      "#${viewModel.userBriefState.id}",
                      style: FontSystem.KR16R.copyWith(
                        color: ColorSystem.grey[500],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => FollowCountButton(
                width: 68,
                count: viewModel.userBriefState.followingCount,
                title: 'Following'.tr,
                onTap: () {
                  if (SecurityUtil.isSignin) {
                    Get.toNamed(
                      Routes.FOLLOW,
                      arguments: {'friendTabType': 'following'},
                    );
                  } else {
                    Get.dialog(
                      const SignInDialog(),
                    );
                  }
                },
              ),
            ),
            Container(
              width: 1,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              height: double.infinity,
              color: ColorSystem.grey[300],
            ),
            Obx(
              () => FollowCountButton(
                width: 64,
                count: viewModel.userBriefState.followerCount,
                title: 'Follower'.tr,
                onTap: () {
                  if (SecurityUtil.isSignin) {
                    Get.toNamed(
                      Routes.FOLLOW,
                      arguments: {'friendTabType': 'follower'},
                    );
                  } else {
                    Get.dialog(
                      const SignInDialog(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );

  Widget _dailyDeltaCO2View() => Container(
        width: Get.width,
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: ColorSystem.grey[300]!,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Text(
              'total_Delta_CO2'.tr,
              style: FontSystem.KR16SB,
            ),
            const SizedBox(height: 4),
            Obx(
              () => DeltaCO2Text(
                deltaCO2: viewModel.dailyDeltaCO2State.totalDeltaCO2,
                style: FontSystem.KR24B,
              ),
            ),

            // Gap
            const SizedBox(height: 16),

            // Bar Chart Top Column
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Obx(
                  () => SizedBox(
                    width: 76,
                    child: DeltaCO2Text(
                      deltaCO2: viewModel.dailyDeltaCO2State.negativeDeltaCO2,
                      style: FontSystem.KR12B,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "${'emission_CO2'.tr} | ${'economize_CO2'.tr}",
                    style: FontSystem.KR10M.copyWith(color: ColorSystem.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                Obx(
                  () => SizedBox(
                    width: 76,
                    child: DeltaCO2Text(
                      deltaCO2: viewModel.dailyDeltaCO2State.positiveDeltaCO2,
                      style: FontSystem.KR12B,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),

            // Gap
            const SizedBox(height: 4),
            Obx(
              () => DeltaCO2BarChart(
                state: viewModel.dailyDeltaCO2State,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorSystem.lightPink),
                  width: 8,
                  height: 8,
                ),
                const SizedBox(width: 4),
                Text(
                  'health'.tr,
                  style: FontSystem.KR10R.copyWith(color: ColorSystem.grey),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorSystem.lightBlue),
                  width: 8,
                  height: 8,
                ),
                const SizedBox(width: 4),
                Text(
                  'mental'.tr,
                  style: FontSystem.KR10R.copyWith(color: ColorSystem.grey),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: ColorSystem.lightYellow),
                  width: 8,
                  height: 8,
                ),
                const SizedBox(width: 4),
                Text(
                  'cash'.tr,
                  style: FontSystem.KR10R.copyWith(color: ColorSystem.grey),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _actionHistoriesView() => Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => ListView.builder(
            itemCount: viewModel.actionHistoryStates.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ActionHistoryItem(
                  state: viewModel.actionHistoryStates[index],
                ),
              );
            },
          ),
        ),
      );
}
