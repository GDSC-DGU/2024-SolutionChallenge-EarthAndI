import 'package:earth_and_i/utilities/static/app_routes.dart';
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
    return Container(
      color: Colors.white,
      child: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.LANGUAGE);
          },
          child: const Text(
            'Go to Language',
            style: FontSystem.KR18R,
          ),
        ),
      ),
    );
  }
}
