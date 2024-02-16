import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends BaseWidget<ProfileViewModel> {
  const UserProfile({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "유저이름",
              style: FontSystem.KR20SB120,
            ),
            Text(
              "#123",
              style: FontSystem.KR16R.copyWith(
                color: const Color(0xFFACADB2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
