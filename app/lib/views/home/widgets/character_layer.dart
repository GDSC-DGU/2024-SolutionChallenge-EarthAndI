import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CharacterLayer extends GetWidget<HomeViewModel> {
  const CharacterLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: SvgPicture.asset(
            'assets/images/ground.svg',
            width: Get.width,
          ),
        ),
        Positioned(
          bottom: 170,
          left: Get.width * 0.125,
          child: SvgPicture.asset(
            'assets/images/character.svg',
            width: Get.width * 0.75,
          ),
        ),
      ],
    );
  }
}
