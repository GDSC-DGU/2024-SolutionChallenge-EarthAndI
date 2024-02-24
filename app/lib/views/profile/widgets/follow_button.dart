import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  const FollowButton({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.count,
    required this.text,
    this.onTap,
  });

  final double width;
  final double height;

  final int count;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    String countText;

    if (count < 1000) {
      countText = count.toString();
    } else if (count < 10000) {
      countText = "${(count / 1000).toStringAsFixed(1)}k";
    } else if (count < 100000) {
      countText = "${(count / 1000).toStringAsFixed(0)}k";
    } else if (count < 1000000) {
      countText = "${(count / 1000).toStringAsFixed(1)}k";
    } else {
      countText = "${(count / 1000000).toStringAsFixed(1)}M";
    }

    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 76,
        child: Column(
          children: [
            Text(
              countText,
              style: FontSystem.KR16R,
            ),
            Text(
              text,
              style: FontSystem.KR16M,
            ),
          ],
        ),
      ),
    );
  }
}
