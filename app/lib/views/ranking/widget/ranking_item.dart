import 'package:earth_and_i/models/ranking/ranking_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/views/profile/widgets/delta_co2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RankingItem extends StatelessWidget {
  const RankingItem({
    super.key,
    required this.rank,
    required this.isLast,
    required this.state,
    required this.onTap,
  });

  final int rank;
  final bool isLast;
  final RankingState state;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width - 32,
      height: 80,
      margin: EdgeInsets.only(
        left: 16,
        right: 16,
        top: rank == 4 ? 16 : 0,
        bottom: isLast ? 48 : 16,
      ),
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: ColorSystem.grey[300]!,
            offset: const Offset(0, 1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Row(
            children: [
              const SizedBox(width: 16),
              SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    rank.toString(),
                    style: FontSystem.KR20M.copyWith(
                      color: ColorSystem.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: ColorSystem.grey[200],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    SvgPicture.asset(
                      state.thumbnailPath,
                      height: 48,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: Get.width - 272,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.nickname,
                      overflow: TextOverflow.ellipsis,
                      style: FontSystem.KR16M.copyWith(
                        color: ColorSystem.grey[900],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "#${state.id.substring(0, 5)}",
                      style: FontSystem.KR12M.copyWith(
                        color: ColorSystem.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              DeltaCO2Text(
                deltaCO2: state.totalDeltaCO2,
                style: FontSystem.KR14M,
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
