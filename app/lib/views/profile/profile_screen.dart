import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/profile/widgets/user_history.dart';
import 'package:earth_and_i/views/profile/widgets/user_profile.dart';
import 'package:earth_and_i/views/profile/widgets/weekly_calendar.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends BaseScreen<ProfileViewModel> {
  const ProfileScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

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
    return ExtendedNestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) =>
          [const SliverToBoxAdapter(child: UserProfile())]),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            WeeklyCalendar(),
            UserHistory(),
          ],
        ),
      ),
    );
  }
}
