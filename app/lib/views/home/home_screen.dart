import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/shapes/floor_layer_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomeScreen extends BaseScreen<HomeViewModel> {
  const HomeScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(92.0),
      child: Container(
        padding: const EdgeInsets.only(left: 16.0),
        height: 92.0,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            '${NumberFormat('###,###,###,###').format(viewModel.reducedCO2)} kg',
            style: FontSystem.KR24B,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Stack(
      children: [
        floorLayer(),
        characterLayer(),
      ],
    );
  }

  Widget floorLayer() => Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: FloorLayerClipper(),
          child: Container(
            width: Get.width,
            height: Get.height * 0.32,
            color: const Color(0xFFF3F0EB),
          ),
        ),
      );

  Widget characterLayer() => Positioned(
        bottom: Get.height * 0.26,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: SvgPicture.asset(
            'assets/images/character.svg',
            width: Get.width * 0.6,
          ),
        ),
      );
}
