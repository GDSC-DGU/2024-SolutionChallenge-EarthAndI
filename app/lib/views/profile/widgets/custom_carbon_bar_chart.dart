import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomCarbonBarChart extends BaseWidget<ProfileViewModel> {
  const CustomCarbonBarChart({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "↑ ${NumberFormat('#,###,###.####').format(viewModel.totalCarbonState.negativeTotalDeltaCO2.abs())} kg",
                  style:
                      FontSystem.KR12B.copyWith(color: ColorSystem.pink[300])),
              Text(
                "배출한 탄소량  |  절약한 탄소량",
                style: FontSystem.KR10M.copyWith(color: ColorSystem.grey[500]),
              ),
              Text(
                  "↓ ${NumberFormat('#,###,###.####').format(viewModel.totalCarbonState.positiveTotalDeltaCO2.abs())} kg",
                  style:
                      FontSystem.KR12B.copyWith(color: ColorSystem.green[500])),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Obx(
          () => Row(
            children: [
              if (viewModel.totalCarbonState.negativeTotalDeltaCO2
                      .abs()
                      .round() !=
                  0)
                Flexible(
                  flex: viewModel.totalCarbonState.negativeTotalDeltaCO2
                      .abs()
                      .round(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorSystem.pink[300],
                    ),
                    height: 12,
                  ),
                ),
              if (viewModel.totalCarbonState.positiveTotalDeltaCO2
                      .abs()
                      .round() !=
                  0)
                Flexible(
                  flex: viewModel.totalCarbonState.positiveTotalDeltaCO2
                      .abs()
                      .round(),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorSystem.green[500]),
                    height: 12,
                  ),
                )
            ],
          ),
        ),
        const SizedBox(height: 4),
        Obx(
          () => Row(
            children: [
              if (viewModel.totalCarbonState.negativeTotalDeltaCO2
                      .abs()
                      .round() !=
                  0)
                Flexible(
                  flex: viewModel.totalCarbonState.negativeTotalDeltaCO2
                      .abs()
                      .round(),
                  child: Row(
                    children: _buildNegativeBarChildren(viewModel),
                  ),
                ),
              if (viewModel.totalCarbonState.positiveTotalDeltaCO2
                      .abs()
                      .round() !=
                  0)
                Flexible(
                  flex: viewModel.totalCarbonState.positiveTotalDeltaCO2
                      .abs()
                      .round(),
                  child: Row(
                    children: _buildPositiveBarChildren(viewModel),
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

  List<Widget> _buildNegativeBarChildren(viewModel) {
    List<Widget> children = [];

    if (viewModel.dailyCarbonState.healthNegativeCnt != 0) {
      children.add(
        Flexible(
          flex: viewModel.dailyCarbonState.healthNegativeCnt,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.lightPink),
            height: 12,
          ),
        ),
      );
    }

    if (viewModel.dailyCarbonState.mentalNegativeCnt != 0) {
      children.add(
        Flexible(
          flex: viewModel.dailyCarbonState.mentalNegativeCnt,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.lightBlue),
            height: 12,
          ),
        ),
      );
    }

    if (viewModel.dailyCarbonState.cashNegativeCnt != 0) {
      children.add(
        Flexible(
          flex: viewModel.dailyCarbonState.cashNegativeCnt,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.lightYellow),
            height: 12,
          ),
        ),
      );
    }

    return children;
  }

  List<Widget> _buildPositiveBarChildren(viewModel) {
    List<Widget> children = [];

    if (viewModel.dailyCarbonState.healthPositiveCnt != 0) {
      children.add(
        Flexible(
          flex: viewModel.dailyCarbonState.healthPositiveCnt,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.lightPink),
            height: 12,
          ),
        ),
      );
    }

    if (viewModel.dailyCarbonState.mentalPositiveCnt != 0) {
      children.add(
        Flexible(
          flex: viewModel.dailyCarbonState.mentalPositiveCnt,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.lightBlue),
            height: 12,
          ),
        ),
      );
    }

    if (viewModel.dailyCarbonState.cashPositiveCnt != 0) {
      children.add(
        Flexible(
          flex: viewModel.dailyCarbonState.cashPositiveCnt,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorSystem.lightYellow),
            height: 12,
          ),
        ),
      );
    }

    return children;
  }
}
