import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorSizedBox extends StatelessWidget {
  const ColorSizedBox({
    super.key,
    this.color,
    this.width,
    this.height,
  });

  final Color? color;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width,
      height: height ?? Get.height,
      color: color ?? ColorSystem.transparent,
    );
  }
}
