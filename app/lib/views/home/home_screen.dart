import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/home/home_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/home/shapes/floor_layer_clipper.dart';
import 'package:earth_and_i/views/home/widgets/carbon_cloud.dart';
import 'package:earth_and_i/views/home/widgets/speech_bubble.dart';
import 'package:earth_and_i/widgets/text_box/animated_num_blink.dart';
import 'package:earth_and_i/widgets/text_box/animated_num_counter.dart';
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(() => totalDeltaCO2()),
            const SizedBox(width: 10),
            Obx(() => changeDeltaCO2()),
          ],
        ),
      ),
    );
  }

  Widget totalDeltaCO2() {
    Color color = ColorSystem.grey;

    if (viewModel.deltaCO2State.totalCO2 > 0) {
      color = ColorSystem.pink;
    } else if (viewModel.deltaCO2State.totalCO2 < 0) {
      color = ColorSystem.green;
    }

    return AnimatedNumCounter(
      value: viewModel.deltaCO2State.totalCO2,
      textStyle: FontSystem.KR24B.copyWith(color: color),
      suffix: ' kg',
    );
  }

  Widget changeDeltaCO2() {
    if (viewModel.deltaCO2State.changeCO2 == 0) {
      return const SizedBox();
    }

    Color color = viewModel.deltaCO2State.changeCO2 > 0
        ? ColorSystem.pink
        : ColorSystem.green;
    String prefix = viewModel.deltaCO2State.changeCO2 > 0 ? "↑ " : "↓ ";
    String value = NumberFormat('###,###,###,###.####')
        .format(viewModel.deltaCO2State.changeCO2);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: AnimatedNumBlink(
        value: '$prefix$value kg',
        duration: const Duration(milliseconds: 800),
        textStyle: FontSystem.KR16B.copyWith(color: color),
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
    String prefix = viewModel.analysisState.isLoading
        ? 'assets/images/analysis/'
        : 'assets/images/character/';
    String suffix = '.svg';

    String environment =
        viewModel.characterStatsState.isGoodEnvironment ? '1' : '2';
    String health = viewModel.characterStatsState.isGoodHealth ? '1' : '2';
    String mental = viewModel.characterStatsState.isGoodMental ? '1' : '2';
    String cash = viewModel.characterStatsState.isGoodCash ? '1' : '2';

    return SvgPicture.asset(
      viewModel.analysisState.isLoading
          ? '$prefix${health}_${mental}_$cash$suffix'
          : '$prefix${environment}_${health}_${mental}_$cash$suffix',
      height: Get.height * 0.2,
    );
  }
}
