import 'package:earth_and_i/utilities/static/app_routes.dart';
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // 유저 이미지와 이름을 표시하는 Row
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade300,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
            ],
          ),
          // 팔로워와 팔로잉을 표시하는 Row
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.FRIEND);
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: FontSystem.KR20SB120,
                      ),
                      Text(
                        "팔로워",
                        style: FontSystem.KR16R,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 32,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: VerticalDivider(
                      color: Color(0xFFACADB2),
                      thickness: 1,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.FRIEND);
                  },
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "0",
                        style: FontSystem.KR20SB120,
                      ),
                      Text(
                        "팔로잉",
                        style: FontSystem.KR16R,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
