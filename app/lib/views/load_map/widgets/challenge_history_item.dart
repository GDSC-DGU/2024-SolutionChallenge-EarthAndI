import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChallengeHistoryItem extends StatelessWidget {
  const ChallengeHistoryItem({
    super.key,
    required this.state,
    required this.borderColor,
    required this.onTap,
  });

  final ChallengeHistoryState? state;
  final Color borderColor;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        highlightColor: ColorSystem.grey,
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 행위 리스트의 아이콘
              thumbnailView(),
              const SizedBox(width: 12),
              // 행위 리스트의 이름과 간단한 설명
              titleView(),
              // 진행중인지 달성한 챌린지인지에 따라 나타낼 체크 표시
              checkView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget thumbnailView() {
    String assetPath = state == null
        ? 'assets/icons/clear_challenge.png'
        : 'assets/icons/${state!.type.assetPath}';

    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(assetPath),
        ),
      ),
      child: null,
    );
  }

  Widget titleView() {
    String shortTitle;
    String longTitle;
    double width = Get.width - 64 - 52 - 4 - 12;

    if (state == null) {
      shortTitle = "clear_all_challenge_short_title".tr;
      longTitle = "clear_all_challenge_long_title".tr;
    } else {
      shortTitle = state!.type.shortTitle.tr;
      longTitle = state!.type.longTitle.tr;

      width = state!.isCompleted ? width - 36 : width;
    }

    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shortTitle,
            style: FontSystem.KR16B,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            longTitle,
            style: FontSystem.KR12R,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget checkView() {
    if (state == null || !state!.isCompleted) {
      return const SizedBox();
    }

    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        "assets/icons/check_small.svg",
      ),
    );
  }
}
