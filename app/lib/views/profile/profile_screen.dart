import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/profile/delegate/calendar_delegate.dart';
import 'package:earth_and_i/views/profile/widgets/color_sized_box.dart';
import 'package:earth_and_i/views/profile/widgets/delta_co2_bar_chart.dart';
import 'package:earth_and_i/views/profile/widgets/action_history_item.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
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
      headerSliverBuilder: sliverBuilder,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 16),
            dailyDeltaCO2View(),
            const SizedBox(height: 16),
            actionHistoriesView(),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }

  List<Widget> sliverBuilder(BuildContext context, bool innerBoxIsScrolled) {
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
        color: ColorSystem.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  viewModel.userBriefState.nickname,
                  style: FontSystem.KR20SB120,
                ),
                Text(
                  "#${viewModel.userBriefState.id}",
                  style: FontSystem.KR16R.copyWith(
                    color: ColorSystem.grey[500],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget dailyDeltaCO2View() => Container(
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
            const Text("탄소량 총합", style: FontSystem.KR16SB),
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
                  () => DeltaCO2Text(
                    deltaCO2: viewModel.dailyDeltaCO2State.negativeDeltaCO2,
                    style: FontSystem.KR12B,
                  ),
                ),
                Text(
                  "배출한 탄소량 | 절약한 탄소량",
                  style: FontSystem.KR10M.copyWith(color: ColorSystem.grey),
                ),
                Obx(
                  () => DeltaCO2Text(
                    deltaCO2: viewModel.dailyDeltaCO2State.positiveDeltaCO2,
                    style: FontSystem.KR12B,
                  ),
                ),
              ],
            ),

            // Gap
            const SizedBox(height: 4),
            Obx(
              () => DeltaCO2BarChart(
                positiveDeltaCO2: viewModel.dailyDeltaCO2State.positiveDeltaCO2,
                negativeDeltaCO2: viewModel.dailyDeltaCO2State.negativeDeltaCO2,
                healthPositiveDeltaCO2:
                    viewModel.dailyDeltaCO2State.healthPositiveDeltaCO2,
                healthNegativeDeltaCO2:
                    viewModel.dailyDeltaCO2State.healthNegativeDeltaCO2,
                mentalPositiveDeltaCO2:
                    viewModel.dailyDeltaCO2State.mentalPositiveDeltaCO2,
                mentalNegativeDeltaCO2:
                    viewModel.dailyDeltaCO2State.mentalNegativeDeltaCO2,
                cashPositiveDeltaCO2:
                    viewModel.dailyDeltaCO2State.cashPositiveDeltaCO2,
                cashNegativeDeltaCO2:
                    viewModel.dailyDeltaCO2State.cashNegativeDeltaCO2,
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
                  "건강",
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
                  "멘탈",
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
                  "금전",
                  style: FontSystem.KR10R.copyWith(color: ColorSystem.grey),
                ),
              ],
            ),
          ],
        ),
      );

  Widget actionHistoriesView() => Obx(
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
      );
}
