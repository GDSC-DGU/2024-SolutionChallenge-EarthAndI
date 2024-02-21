import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_list.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoadMapScreen extends BaseScreen<LoadMapViewModel> {
  const LoadMapScreen({super.key});

  @override
  bool get wrapWithOuterSafeArea => true;

  @override
  bool get setTopOuterSafeArea => true;

  @override
  bool get setBottomOuterSafeArea => false;

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animation View
            persistentAnimationView(),

            // Gap
            const SizedBox(height: 12),

            // Carousel View
            textsHintView(),

            // Gap
            const SizedBox(height: 20),

            // Current Challenge View
            currentChallengeView(),

            // Line View
            InfinityLine(
              height: 2,
              color: ColorSystem.grey[200],
            ),

            // Gap
            const SizedBox(height: 20),

            // Completed Challenge View
            completedChallengeView(),
          ],
        ),
      ),
    );
  }

  Widget persistentAnimationView() => Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: RiveAnimation.asset(
            "assets/riv/persistent_animation_earth.riv",
            fit: BoxFit.cover,
            alignment: Alignment.center,
            controllers: [
              viewModel.animationController,
            ],
          ),
        ),
      );

  Widget textsHintView() => SizedBox(
        width: Get.width,
        height: 20,
        child: Center(
          child: DefaultTextStyle(
            style: FontSystem.KR16M,
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                FadeAnimatedText(
                  '찬물 세탁도 지구를 지킬 수 있답니다!',
                  duration: const Duration(seconds: 3),
                ),
                FadeAnimatedText(
                  '불필요한 이메일을 지우면 지구를 지킬 수 있어요!',
                  duration: const Duration(seconds: 3),
                ),
                FadeAnimatedText(
                  '종이컵 대신 개인용 텀블러를 사용해보세요!',
                  duration: const Duration(seconds: 3),
                ),
              ],
            ),
          ),
        ),
      );

  Widget currentChallengeView() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("진행중인 챌린지", style: FontSystem.KR20SB120),
          const SizedBox(height: 16),
          SizedBox(
            height: 110,
            child: Obx(
              () => ListView.builder(
                itemCount: viewModel.currentChallengeHistoryState.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) {
                  return ChallengeList(
                      challenge: viewModel.currentChallengeHistoryState[index],
                      isCompleted: viewModel
                          .currentChallengeHistoryState[index].isCompleted);
                },
              ),
            ),
          ),
        ],
      );

  Widget completedChallengeView() => Column(
        children: [
          Row(
            children: [
              const Text("완료한 챌린지", style: FontSystem.KR20SB120),
              const SizedBox(width: 8),
              Obx(
                () => Text("${viewModel.completedChallengeHistoryState.length}",
                    style: FontSystem.KR20SB120
                        .copyWith(color: ColorSystem.grey[500]!)),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(
            () => ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.completedChallengeHistoryState.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    ChallengeList(
                        challenge:
                            viewModel.completedChallengeHistoryState[index],
                        isCompleted: viewModel
                            .completedChallengeHistoryState[index].isCompleted),
                    const SizedBox(height: 12),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
}
