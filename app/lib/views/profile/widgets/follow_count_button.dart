import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowCountButton extends StatelessWidget {
  const FollowCountButton({
    super.key,
    required this.width,
    required this.count,
    required this.title,
    this.onTap,
  });

  final double width;

  final int count;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String countText;
    if (count >= 1000000) {
      countText = "${(count / 1000000).toStringAsFixed(1)}M";
    } else if (count >= 1000) {
      countText = "${(count / 1000).toStringAsFixed(1)}K";
    } else {
      countText = count.toString();
    }

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              countText,
              style: FontSystem.KR16M,
            ),
            Text(
              title.tr,
              style: FontSystem.KR14R,
            ),
          ],
        ),
      ),
    );
  }
}
