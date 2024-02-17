import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:earth_and_i/views/load_map/widgets/challenge_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChallengeList extends BaseWidget<LoadMapViewModel> {
  final bool isCompleted;

  const ChallengeList({super.key, required this.isCompleted});

  @override
  Widget buildView(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.dialog(ChallengeDialog(isCompleted: isCompleted));
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
          border: isCompleted
              ? Border.all(
                  color: ColorSystem.grey[200]!,
                  width: 2,
                )
              : Border.all(
                  color: ColorSystem.green[500]!,
                  width: 2,
                ),
        ),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 행위 리스트의 아이콘
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage("assets/icons/thumbnail.png"),
                  ),
                ),
                child: null,
              ),
              const SizedBox(width: 12),

              // 행위 리스트의 이름과 간단한 설명
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "친환경 제품 사용하기",
                      style: FontSystem.KR16B,
                    ),
                    Text(
                      "친환경 제품 마크가 부착된 상품을 구매해요!",
                      style: FontSystem.KR12R,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // 진행중인지 달성한 챌린지인지에 따라 나타낼 체크 표시와 완료한 날짜 표시
              if (isCompleted)
                SizedBox(
                  width: 52,
                  height: 52,
                  child: Column(
                    children: [
                      SvgPicture.asset("assets/icons/check_small.svg"),
                      Text(
                        "24/02/11",
                        style: FontSystem.KR12R.copyWith(
                          color: ColorSystem.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
