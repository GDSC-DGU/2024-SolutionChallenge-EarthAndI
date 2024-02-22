import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/models/profile/action_history_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/views/profile/widgets/delta_co2_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActionHistoryItem extends StatelessWidget {
  const ActionHistoryItem({
    super.key,
    required this.state,
  });

  final ActionHistoryState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: ColorSystem.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: ColorSystem.grey[300]!,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          thumbnail(),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                topView(),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    leftBottomView(),
                    const SizedBox(width: 4),
                    rightBottomView(),
                  ],
                ),
                const SizedBox(height: 4),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget thumbnail() {
    String thumbnailPath = state.type == EAction.steps
        ? 'assets/images/thumbnail/walking_thumbnail.png'
        : 'assets/images/thumbnail/${state.characterStatus}.svg';

    if (state.type == EAction.steps) {
      return Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: ColorSystem.grey[200],
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            image: AssetImage(thumbnailPath),
            fit: BoxFit.contain,
          ),
        ),
      );
    } else {
      return Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.only(top: 8),
        decoration: BoxDecoration(
          color: ColorSystem.grey[200],
          borderRadius: BorderRadius.circular(4),
        ),
        child: SvgPicture.asset(
          thumbnailPath,
        ),
      );
    }
  }

  Widget topView() {
    String leftStr = state.type.toString().tr;
    String rightStr = state.type == EAction.steps
        ? "${state.answer} ${EAction.steps.toString().tr}"
        : DateFormat('aa hh:mm', Get.deviceLocale.toString())
            .format(state.createdAt);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftStr,
          style: FontSystem.KR16SB,
        ),
        Text(
          rightStr,
          style: FontSystem.KR12R.copyWith(color: ColorSystem.grey),
        ),
      ],
    );
  }

  Widget leftBottomView() {
    final String question;
    final String answer;

    if (state.type == EAction.steps) {
      question = "";
      answer = "steps_example_answer".tr;
    } else {
      question = "Q ${state.question.tr}";
      answer = "A ${state.answer}";
    }

    return SizedBox(
      width: Get.width - 228,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: FontSystem.KR12R,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            answer,
            style: FontSystem.KR12R,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Widget rightBottomView() {
    return SizedBox(
      width: 76,
      child: DeltaCO2Text(
        deltaCO2: state.changeCapacity,
        style: FontSystem.KR12B,
        textAlign: TextAlign.right,
      ),
    );
  }
}
