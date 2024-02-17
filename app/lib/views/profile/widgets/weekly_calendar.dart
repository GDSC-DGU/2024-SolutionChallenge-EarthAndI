import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendar extends BaseWidget<ProfileViewModel> {
  const WeeklyCalendar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Obx(
      () => Container(
        width: Get.width,
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Center(
          child: TableCalendar(
            locale: "ko_KR",
            focusedDay: viewModel.calendarState.focusedDate,
            firstDay: DateTime.now().subtract(const Duration(days: 365)),
            lastDay: DateTime.now().add(const Duration(days: 365)),
            currentDay: DateTime.now(),
            calendarFormat: CalendarFormat.week,
            selectedDayPredicate: (day) =>
                isSameDay(day, viewModel.calendarState.selectedDate),
            enabledDayPredicate: (DateTime date) {
              return date.isBefore(DateTime.now().add(const Duration(days: 1)));
            },
            daysOfWeekVisible: false,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleTextFormatter: (date, locale) =>
                  DateFormat.yMMMMEEEEd('ko_KR').format(date),
              titleTextStyle:
                  FontSystem.KR12R.copyWith(color: ColorSystem.grey[500]),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              todayDecoration: const BoxDecoration(
                color: Colors.white,
              ),
              defaultTextStyle:
                  FontSystem.KR16R.copyWith(color: ColorSystem.black),
              weekendTextStyle:
                  FontSystem.KR16R.copyWith(color: ColorSystem.black),
              todayTextStyle:
                  FontSystem.KR16R.copyWith(color: ColorSystem.black),
              selectedTextStyle:
                  FontSystem.KR16R.copyWith(color: ColorSystem.black),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              viewModel.changeSelectedDate(selectedDay);
            },
            calendarBuilders: CalendarBuilders(
              disabledBuilder: (context, day, focusedDay) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  child: Text(
                    day.day.toString(),
                    style:
                        FontSystem.KR16R.copyWith(color: ColorSystem.grey[300]),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
