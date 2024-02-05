import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class DefaultBackAppBar extends StatelessWidget {
  final String title;
  final List<CustomIconButton> actions;
  const DefaultBackAppBar({
    super.key,
    required this.title,
    this.actions = const <CustomIconButton>[],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Text(
          title,
          style: FontSystem.KR20SB120,
        ),
      ),
      centerTitle: false,
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      titleSpacing: 0,
      leadingWidth: 50,
      leading: IconButton(
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
      actions: actions,
    );
  }
}
