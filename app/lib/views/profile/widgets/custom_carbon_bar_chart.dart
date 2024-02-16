import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/weekly_calendar_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';

class CustomCarbonBarChart extends BaseWidget<WeeklyCalendarViewModel> {
  const CustomCarbonBarChart({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("↑ 1.2250 kg",
                style:
                    FontSystem.KR12B.copyWith(color: const Color(0xFFF2ABAB))),
            Text(
              "배출한 탄소량  |  절약한 탄소량",
              style: FontSystem.KR10M.copyWith(color: const Color(0xFFACADB2)),
            ),
            Text("↓ 4.4703 kg",
                style:
                    FontSystem.KR12B.copyWith(color: const Color(0xFF90CDBE)))
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFFF2ABAB),
                ),
                height: 12,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF90CDBE)),
                height: 12,
              ),
            )
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFBE1EA)),
                      height: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFE1EAFC)),
                      height: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Flexible(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFEF0D6)),
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
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFBE1EA)),
                    height: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFE1EAFC)),
                    height: 12,
                  ),
                ),
                const SizedBox(width: 4),
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFFEF0D6)),
                    height: 12,
                  ),
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFFBE1EA)),
              width: 8,
              height: 8,
            ),
            const SizedBox(width: 4),
            Text(
              "건강",
              style: FontSystem.KR10R.copyWith(color: const Color(0xFFACADB2)),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFE1EAFC)),
              width: 8,
              height: 8,
            ),
            const SizedBox(width: 4),
            Text(
              "멘탈",
              style: FontSystem.KR10R.copyWith(color: const Color(0xFFACADB2)),
            ),
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xFFFEF0D6)),
              width: 8,
              height: 8,
            ),
            const SizedBox(width: 4),
            Text(
              "금전",
              style: FontSystem.KR10R.copyWith(color: const Color(0xFFACADB2)),
            ),
          ],
        )
      ],
    );
  }
}
