import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:flutter/material.dart';

class DeltaCO2BarChart extends StatelessWidget {
  const DeltaCO2BarChart({
    super.key,
    required this.positiveDeltaCO2,
    required this.negativeDeltaCO2,
    required this.healthPositiveCnt,
    required this.healthNegativeCnt,
    required this.mentalPositiveCnt,
    required this.mentalNegativeCnt,
    required this.cashPositiveCnt,
    required this.cashNegativeCnt,
  });

  final double positiveDeltaCO2;
  final double negativeDeltaCO2;
  final int healthPositiveCnt;
  final int healthNegativeCnt;
  final int mentalPositiveCnt;
  final int mentalNegativeCnt;
  final int cashPositiveCnt;
  final int cashNegativeCnt;

  @override
  Widget build(BuildContext context) {
    int flexPositive = (positiveDeltaCO2.abs() * 10000).round();
    int flexNegative = (negativeDeltaCO2 * 10000).round();

    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (negativeDeltaCO2 != 0)
            Flexible(
              flex: flexNegative,
              child: Column(
                children: [
                  bar(flexNegative, ColorSystem.pink),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      bar(healthNegativeCnt, ColorSystem.lightPink),
                      spaceSizeBox(healthNegativeCnt, mentalNegativeCnt, 4),
                      bar(mentalNegativeCnt, ColorSystem.lightBlue),
                      spaceSizeBox(mentalNegativeCnt, cashNegativeCnt, 4),
                      bar(cashNegativeCnt, ColorSystem.lightYellow),
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
                      bar(healthPositiveCnt, ColorSystem.lightPink),
                      spaceSizeBox(healthPositiveCnt, mentalPositiveCnt, 4),
                      bar(mentalPositiveCnt, ColorSystem.lightBlue),
                      spaceSizeBox(mentalPositiveCnt, cashPositiveCnt, 4),
                      bar(cashPositiveCnt, ColorSystem.lightYellow),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget bar(num cnt, Color color) => cnt != 0
      ? Flexible(
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
