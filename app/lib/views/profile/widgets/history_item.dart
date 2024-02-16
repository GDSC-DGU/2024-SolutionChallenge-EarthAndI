import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HistoryItem extends BaseWidget<ProfileViewModel> {
  const HistoryItem({super.key, required this.index});

  final int index;

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: const Color(0xFFE5E5E5),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/images/action_history_character.svg",
                width: 72,
                height: 72,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(viewModel.dailyHistory[index].type.toString().tr,
                            style: FontSystem.KR16SB),
                        Text(
                            DateFormat('aa hh:mm').format(
                                viewModel.dailyHistory[index].createdAt),
                            style: FontSystem.KR12R),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Q ${viewModel.dailyHistory[index].question.toString().tr}",
                                style: FontSystem.KR12R),
                            Text("A ${viewModel.dailyHistory[index].answer}",
                                style: FontSystem.KR12R)
                          ],
                        ),
                        Text(
                          viewModel.dailyHistory[index].changeCapacity > 0
                              ? "↑ ${NumberFormat('#,###,###.####').format(viewModel.dailyHistory[index].changeCapacity.abs())} kg"
                              : "↓ ${NumberFormat('#,###,###.####').format(viewModel.dailyHistory[index].changeCapacity.abs())} kg",
                          style: FontSystem.KR16B.copyWith(
                              color:
                                  viewModel.dailyHistory[index].changeCapacity >
                                          0
                                      ? ColorSystem.pink
                                      : ColorSystem.green[500]),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
