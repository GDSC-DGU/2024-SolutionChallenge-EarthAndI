import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DefaultBackAppBar extends StatelessWidget {
  final String title;
  final bool isFriendScreen;
  const DefaultBackAppBar(
      {super.key, required this.title, required this.isFriendScreen});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      leadingWidth: Get.width,
      leading: Row(
        children: [
          IconButton(
            style: TextButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            icon: SvgPicture.asset(
              "assets/icons/arrow_back.svg",
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          Text(
            title,
            style: FontSystem.KR20SB120,
          )
        ],
      ),
      actions: [
        if (isFriendScreen)
          IconButton(
            style: IconButton.styleFrom(
              splashFactory: NoSplash.splashFactory,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
            icon: SvgPicture.asset(
              "assets/icons/plus.svg",
              width: 24,
              height: 24,
            ),
            onPressed: () {
              debugPrint("친구 추가로 이동");
            },
          )
      ],
    );
  }
}
