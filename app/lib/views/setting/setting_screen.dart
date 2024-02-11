import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/setting/setting_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends BaseScreen<SettingViewModel> {
  const SettingScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "설정",
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          settingSection("사용자 인증", Routes.USERAUTH),
          settingSection("언어", Routes.LANGUAGE),
        ],
      ),
    );
  }

  Widget settingSection(String text, String route) => Container(
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: ColorSystem.grey1)),
        ),
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Get.toNamed(route);
          },
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              child: Text(
                text,
                style: FontSystem.KR16B,
              )),
        ),
      );
}
