import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/shapes/floor_layer_clipper.dart';
import 'package:earth_and_i/views/home/widgets/carbon_cloud.dart';
import 'package:earth_and_i/views/home/widgets/speech_bubble.dart';
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
          child: Obx(() => carbonDiOxide()),
        ),
      ),
    );
  }

  Widget carbonDiOxide() {
    String firstChar = "";
    Color color = const Color(0xFF000000);

    if (viewModel.changedCO2 > 0) {
      firstChar = "↑ ";
      color = const Color(0xFFF2ABAB);
    } else {
      firstChar = "↓ ";
      color = const Color(0xFF90CDBE);
    }

    return Text(
      '$firstChar${NumberFormat('#,###,###.####').format(viewModel.changedCO2.abs())} kg',
      style: FontSystem.KR24B.copyWith(
        color: color,
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height,
      child: Stack(
        children: [
          floorLayer(),
          carbonCloudLayer(),
          characterLayer(),
        ],
      ),
    );
  }

  Widget floorLayer() => Positioned(
        bottom: 0,
        child: ClipPath(
          clipper: FloorLayerClipper(),
          child: Container(
            width: Get.width,
            height: Get.height * 0.3,
            color: const Color(0xFFF3F0EB),
          ),
        ),
      );

  Widget characterLayer() => Positioned(
        left: 0,
        right: 0,
        bottom: Get.height * 0.25,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            children: [
              const SpeechBubble(),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  DevOnLog.i('characterLayer onTap');
                },
                child: Obx(
                  () => character(),
                ),
              ),
            ],
          ),
        ),
      );

  Widget carbonCloudLayer() => Positioned(
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            height: Get.height * 0.3,
            child: Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.carbonCloudStates.length > 4
                    ? 4
                    : viewModel.carbonCloudStates.length,
                itemBuilder: (context, index) {
                  return CarbonCloudBubble(
                    index: index,
                  );
                },
              ),
            ),
          ),
        ),
      );

  Widget character() {
    // 각 스탯에 따라 이미지 경로 결정
    String prefix = 'assets/images/character';
    String suffix = '.svg';

    String environment =
        viewModel.characterStatsState.isGoodEnvironment ? '1' : '2';
    String health = viewModel.characterStatsState.isGoodHealth ? '1' : '2';
    String mental = viewModel.characterStatsState.isGoodMental ? '1' : '2';
    String cash = viewModel.characterStatsState.isGoodCash ? '1' : '2';

    return SvgPicture.asset(
      '${prefix}_${environment}_${health}_${mental}_$cash$suffix',
      height: Get.height * 0.2,
    );
  }
}
