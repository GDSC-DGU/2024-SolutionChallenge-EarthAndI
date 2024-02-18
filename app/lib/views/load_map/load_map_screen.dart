import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_list.dart';
import 'package:earth_and_i/views/load_map/widgets/load_map_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 40),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 로드맵의 헤더 부분 (배너가 들어갈지 아직 미정)
            const LoadMapCarousel(),

            const SizedBox(height: 12),
            // 현재 진행중인 챌린지 (한 개만 표시)
            const Text("진행중인 챌린지", style: FontSystem.KR20SB120),
            const SizedBox(height: 4),
            Obx(
              () => ChallengeList(
                  challenge: viewModel.currentChallengeHistoryState[0],
                  isCompleted:
                      viewModel.currentChallengeHistoryState[0].isCompleted),
            ),
            const SizedBox(height: 32),
            // 완료한 챌린지 헤더
            Row(
              children: [
                const Text("완료한 챌린지", style: FontSystem.KR20SB120),
                const SizedBox(width: 8),
                Obx(
                  () => Text(
                      "${viewModel.completedChallengeHistoryState.length}",
                      style: FontSystem.KR20SB120
                          .copyWith(color: ColorSystem.grey[500]!)),
                ),
              ],
            ),

            const SizedBox(height: 4),
            // 완료한 챌린지 리스트 뷰 (여러 개 표시)
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: viewModel.completedChallengeHistoryState.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) {
                return Obx(
                  () => Column(
                    children: [
                      ChallengeList(
                          challenge:
                              viewModel.completedChallengeHistoryState[index],
                          isCompleted: viewModel
                              .completedChallengeHistoryState[index]
                              .isCompleted),
                      const SizedBox(height: 12),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
