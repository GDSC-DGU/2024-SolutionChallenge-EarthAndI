import 'package:earth_and_i/models/ranking/top_ranking_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/views/profile/widgets/delta_co2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopRankingItem extends StatelessWidget {
  const TopRankingItem({
    super.key,
    required this.index,
    required this.state,
    required this.onTap,
  });

  final int index;
  final TopRankingState state;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index != 1) const SizedBox(height: 13.6),
        InkWell(
          onTap: onTap,
          child: Container(
            width: index == 1 ? 112.2 : 102,
            height: index == 1 ? 149.6 : 136,
            margin: EdgeInsets.only(
              left: index == 1 ? 12 : 0,
              right: index == 1 ? 12 : 0,
            ),
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: ColorSystem.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: ColorSystem.grey[300]!,
                width: 2,
              ),
            ),
            child: content(),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: index == 1 ? 100.2 : 90,
          child: Center(
            child: Text(
              state.nickname,
              overflow: TextOverflow.ellipsis,
              style: FontSystem.KR12M.copyWith(
                color: ColorSystem.grey[900],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget content() {
    if (state.id == null) {
      return SvgPicture.asset(
        "assets/icons/question-mark.svg",
        height: 56,
        colorFilter: ColorFilter.mode(
          ColorSystem.grey[400]!,
          BlendMode.srcIn,
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            state.characterPath,
            height: index == 1 ? 96.8 : 88,
          ),
          const SizedBox(height: 12),
          DeltaCO2Text(
            deltaCO2: state.totalDeltaCO2,
            style: index == 1 ? FontSystem.KR14M : FontSystem.KR12M,
          )
        ],
      );
    }
  }
}
