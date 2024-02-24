import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/views/profile/widgets/delta_co2_text.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class FollowItem extends StatelessWidget {
  const FollowItem({
    super.key,
    required this.state,
    required this.onPressed,
  });

  final FollowState state;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                padding: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: ColorSystem.grey[200],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: SvgPicture.asset(
                  state.thumbnailPath,
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        state.nickname,
                        style: FontSystem.KR16SB,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "#${state.id.substring(0, 5)}",
                        style:
                            FontSystem.KR12R.copyWith(color: ColorSystem.grey),
                      )
                    ],
                  ),
                  DeltaCO2Text(
                    deltaCO2: state.totalDeltaCO2,
                    style: FontSystem.KR12B,
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: 84,
                height: 32,
                child: TextButton(
                  onPressed: onPressed,
                  style: TextButton.styleFrom(
                    backgroundColor: state.isFollowing
                        ? ColorSystem.transparent
                        : ColorSystem.green,
                    side: state.isFollowing
                        ? BorderSide(
                            color: ColorSystem.grey[200]!,
                            width: 1,
                          )
                        : BorderSide.none,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: state.isFollowing
                      ? Text(
                          "following".tr,
                          style: FontSystem.KR12B
                              .copyWith(color: ColorSystem.grey),
                        )
                      : Text(
                          "follow".tr,
                          style: FontSystem.KR12B
                              .copyWith(color: ColorSystem.white),
                        ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InfinityLine(
            height: 1,
            color: ColorSystem.grey[200],
          ),
        ),
      ],
    );
  }
}
