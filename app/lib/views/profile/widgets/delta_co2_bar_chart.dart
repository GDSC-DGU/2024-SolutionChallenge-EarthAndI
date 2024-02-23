import 'package:earth_and_i/models/profile/daily_delta_co2_state.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:flutter/material.dart';

class DeltaCO2BarChart extends StatelessWidget {
  const DeltaCO2BarChart({
    super.key,
    required this.state,
  });

  final DailyDeltaCO2State state;

  @override
  Widget build(BuildContext context) {
    int flexPositive = (state.positiveDeltaCO2.abs() * 10000).round();
    int flexNegative = (state.negativeDeltaCO2 * 10000).round();

    int flexPositiveHealth =
        (state.healthPositiveDeltaCO2.abs() * 10000).round();
    int flexNegativeHealth = (state.healthNegativeDeltaCO2 * 10000).round();
    int flexPositiveMental =
        (state.mentalPositiveDeltaCO2.abs() * 10000).round();
    int flexNegativeMental = (state.mentalNegativeDeltaCO2 * 10000).round();
    int flexPositiveCash = (state.cashPositiveDeltaCO2.abs() * 10000).round();
    int flexNegativeCash = (state.cashNegativeDeltaCO2 * 10000).round();

    if (flexPositive == 0 && flexNegative == 0) {
      return SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  bar(1, ColorSystem.grey),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                    ],
                  ),
                ],
              ),
            ),
            spaceSizeBox(1, 1, 8),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  bar(1, ColorSystem.grey),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (flexPositive == 0 && flexNegative == 0) {
      return SizedBox(
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  bar(1, ColorSystem.grey),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                    ],
                  ),
                ],
              ),
            ),
            spaceSizeBox(1, 1, 8),
            Flexible(
              flex: 1,
              child: Column(
                children: [
                  bar(1, ColorSystem.grey),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                      spaceSizeBox(1, 1, 4),
                      bar(1, ColorSystem.grey[200]!),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (flexNegative != 0)
            Flexible(
              flex: flexNegative,
              child: Column(
                children: [
                  bar(flexNegative, ColorSystem.pink),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(flexNegativeHealth, ColorSystem.lightPink),
                      spaceSizeBox(flexNegativeHealth, flexNegativeMental, 4),
                      bar(flexNegativeMental, ColorSystem.lightBlue),
                      spaceSizeBox(flexNegativeMental, flexNegativeCash, 4),
                      bar(flexNegativeCash, ColorSystem.lightYellow),
                    ],
                  ),
                ],
              ),
            ),
          spaceSizeBox(flexNegative, flexPositive, 8),
          if (flexPositive != 0)
            Flexible(
              flex: flexPositive,
              child: Column(
                children: [
                  bar(flexPositive, ColorSystem.green),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(flexPositiveHealth, ColorSystem.lightPink),
                      spaceSizeBox(flexPositiveHealth, flexPositiveMental, 4),
                      bar(flexPositiveMental, ColorSystem.lightBlue),
                      spaceSizeBox(flexPositiveMental, flexPositiveCash, 4),
                      bar(flexPositiveCash, ColorSystem.lightYellow),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget bar(int flex, Color color) => flex != 0
      ? Flexible(
          flex: flex,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            height: 12,
          ),
        )
      : const SizedBox.shrink();

  Widget spaceSizeBox(num before, num after, double gap) =>
      before != 0 && after != 0
          ? SizedBox(width: gap)
          : const SizedBox.shrink();
}
