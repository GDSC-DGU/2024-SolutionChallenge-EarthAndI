import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCarbonBarChart extends BaseWidget<ProfileViewModel> {
  const CustomCarbonBarChart({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("↑ 1.2250 kg",
                style: FontSystem.KR12B.copyWith(color: ColorSystem.pink[300])),
            Text(
              "배출한 탄소량  |  절약한 탄소량",
              style: FontSystem.KR10M.copyWith(color: ColorSystem.grey[500]),
            ),
            Text("↓ 4.4703 kg",
                style: FontSystem.KR12B.copyWith(color: ColorSystem.green[500]))
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: ColorSystem.pink[300],
                ),
                height: 12,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: ColorSystem.green[500]),
                height: 12,
              ),
            )
          ],
        ),
        const SizedBox(height: 4),
        Obx(
          () => Row(
            children: [
              Flexible(
                flex: viewModel.dailyCarbonState.healthNegativeCnt,
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSystem.lightPink),
                        height: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      flex: viewModel.dailyCarbonState.mentalNegativeCnt,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSystem.lightBlue),
                        height: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      flex: viewModel.dailyCarbonState.cashNegativeCnt,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSystem.lightYellow),
                        height: 12,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Row(
                  children: [
                    Flexible(
                      flex: viewModel.dailyCarbonState.healthPositiveCnt,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSystem.lightPink),
                        height: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      flex: viewModel.dailyCarbonState.mentalPositiveCnt,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSystem.lightBlue),
                        height: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      flex: viewModel.dailyCarbonState.cashPositiveCnt,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: ColorSystem.lightYellow),
                        height: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorSystem.lightPink),
              width: 8,
              height: 8,
            ),
            const SizedBox(width: 4),
            Text(
              "건강",
              style: FontSystem.KR10R.copyWith(color: ColorSystem.grey[500]),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorSystem.lightBlue),
              width: 8,
              height: 8,
            ),
            const SizedBox(width: 4),
            Text(
              "멘탈",
              style: FontSystem.KR10R.copyWith(color: ColorSystem.grey[500]),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: ColorSystem.lightYellow),
              width: 8,
              height: 8,
            ),
            const SizedBox(width: 4),
            Text(
              "금전",
              style: FontSystem.KR10R.copyWith(color: ColorSystem.grey[500]),
            ),
          ],
        )
      ],
    );
  }
}
