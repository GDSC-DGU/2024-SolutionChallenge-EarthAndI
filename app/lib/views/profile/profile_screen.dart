import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_appbar.dart';
import 'package:flutter/material.dart';

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
              debugPrint("plus button pressed");
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Profile',
          style: FontSystem.KR18R,
        ),
      ),
    );
  }
}
