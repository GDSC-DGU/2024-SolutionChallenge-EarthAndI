import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChallengeDialog extends BaseWidget<LoadMapViewModel> {
  final ChallengeHistoryState challenge;
  final bool isCompleted;
  const ChallengeDialog(
      {super.key, required this.challenge, required this.isCompleted});

  @override
  Widget buildView(BuildContext context) {
    return AlertDialog(
      title: DialogTitle(
          challengeHistoryState: challenge, isCompleted: isCompleted),
      content: SizedBox(
        width: Get.width * 0.8,
        height: Get.height * 0.45,
        child: DialogContent(challengeHistoryState: challenge),
      ),
      insetPadding: const EdgeInsets.all(20),
      backgroundColor: ColorSystem.white,
      surfaceTintColor: ColorSystem.white,
      actions: [
        SizedBox(
          width: Get.width * 0.8,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              if (isSignIn() == false) {
                return;
              }
              isCompleted
                  ? Get.back()
                  :
                  // 만약 challenge가 다 완료된 상태라면 다시 Get.back()
                  challenge.shortTitle == "clearAllChallenge"
                      ? Get.back()
                      : Get.toNamed("/challenge_authentication",
                          arguments: challenge);
            },
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: ColorSystem.green[500],
              textStyle: FontSystem.KR20M,
              foregroundColor: ColorSystem.white,
              side: BorderSide(
                color: ColorSystem.green[500]!,
                width: 1,
              ),
            ),
            child: isCompleted
                ? const Text("확인")
                :
                // 만약 challenge가 다 완료된 상태라면 "확인" 버튼을 띄움
                challenge.shortTitle == "clearAllChallenge"
                    ? const Text("확인")
                    : const Text("챌린지 인증하기"),
          ),
        ),
      ],
    );
  }
}

// Dialog의 타이틀을 나타내는 위젯
class DialogTitle extends BaseWidget<LoadMapViewModel> {
  final ChallengeHistoryState challengeHistoryState;
  final bool isCompleted;
  const DialogTitle(
      {super.key,
      required this.challengeHistoryState,
      required this.isCompleted});

  @override
  Widget buildView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 9, right: 9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                challengeHistoryState.shortTitle.tr,
                style: FontSystem.KR24B,
              ),
              const SizedBox(height: 8),
              Text(
                challengeHistoryState.longTitle.tr,
                style: FontSystem.KR12R,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(width: 4),
          if (isCompleted)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    child: SvgPicture.asset("assets/icons/check_small.svg")),
              ],
            )
        ],
      ),
    );
  }
}

// Dialog의 내용을 나타내는 위젯
class DialogContent extends BaseWidget<LoadMapViewModel> {
  final ChallengeHistoryState challengeHistoryState;

  const DialogContent({super.key, required this.challengeHistoryState});

  @override
  Widget buildView(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                challengeHistoryState.iconPath.tr,
                fit: BoxFit.fill,
                width: 280,
                height: 280,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 96,
            child: Text(challengeHistoryState.description.tr,
                style: FontSystem.KR16M),
          )
        ],
      ),
    );
  }
}
