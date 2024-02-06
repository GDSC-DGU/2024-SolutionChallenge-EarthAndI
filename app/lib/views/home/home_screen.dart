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

  static const List<String> speechBubbleTexts = [
    '자기전에 너튜브, 인스타\n보지말고 잘꺼지?!',
    '우린 멀 할 수 있지?\n팝콘이나 먹고 자자!',
    '오늘 점심 뭐 먹었어?',
    '왜 우린 쉬지 못하지?\n 나도 몰라 이 녀석아!',
  ];

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
            '${NumberFormat('#,###,###').format(viewModel.reducedCO2)} kg',
            style: FontSystem.KR24B,
          ),
        ),
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
          characterLayer(),
          for (final String text in speechBubbleTexts)
            if (speechBubbleTexts.indexOf(text) == 0)
              Positioned(
                top: Get.height * 0.02,
                right: Get.width * 0.05,
                child: CarbonCloudBubble(
                  text: text,
                ),
              )
            else if (speechBubbleTexts.indexOf(text) == 1)
              Positioned(
                top: Get.height * 0.07,
                left: Get.width * 0.08,
                child: CarbonCloudBubble(
                  text: text,
                ),
              )
            else if (speechBubbleTexts.indexOf(text) == 2)
              Positioned(
                top: Get.height * 0,
                left: Get.width * 0.04,
                child: CarbonCloudBubble(
                  text: text,
                ),
              )
            else
              Positioned(
                top: Get.height * 0.11,
                right: Get.width * 0.07,
                child: CarbonCloudBubble(
                  text: text,
                ),
              ),
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
            height: Get.height * 0.32,
            color: const Color(0xFFF3F0EB),
          ),
        ),
      );

  Widget characterLayer() => Positioned(
        left: 0,
        right: 0,
        bottom: Get.height * 0.26,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
          child: Column(
            children: [
              const SpeechBubble(),
              GestureDetector(
                onLongPress: () {
                  viewModel.analysisSpeech();
                },
                child: SvgPicture.asset(
                  'assets/images/character.svg',
                  width: Get.width * 0.6,
                ),
              ),
            ],
          ),
        ),
      );
}
