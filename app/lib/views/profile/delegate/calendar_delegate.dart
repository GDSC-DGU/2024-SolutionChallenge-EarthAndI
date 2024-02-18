import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/views/profile/widgets/weekly_calendar.dart';
import 'package:flutter/material.dart';

class CalendarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      children: [
        Container(
          color: ColorSystem.white,
          height: 12,
        ),
        const WeeklyCalendar(),
        Container(
          color: ColorSystem.white,
          height: 12,
        ),
      ],
    );
  }

  @override
  double get maxExtent => 125;

  @override
  double get minExtent => 125;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
