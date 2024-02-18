import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:earth_and_i/views/base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendar extends BaseWidget<ProfileViewModel> {
  const WeeklyCalendar({super.key});

  @override
  Widget buildView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: ColorSystem.white,
      child: Column(
        children: [
          Obx(
            () => TableCalendar(
              // Default Properties
              locale: Get.deviceLocale.toString(),
              firstDay: Get.find<RootViewModel>()
                  .currentAt
                  .subtract(const Duration(days: 365)),
              lastDay: Get.find<RootViewModel>()
                  .currentAt
                  .add(const Duration(days: 365)),

              // Date Properties
              currentDay: DateTime.now(),
              focusedDay: viewModel.calendarState.focusedDate,
              calendarFormat: CalendarFormat.week,
              daysOfWeekVisible: true,

              // Calendar Properties
              headerVisible: false,
              selectedDayPredicate: (day) =>
                  isSameDay(day, viewModel.calendarState.selectedDate),
              enabledDayPredicate: (DateTime date) {
                DateTime localDate = date.toLocal().subtract(Duration(
                      hours: date.toLocal().timeZoneOffset.inHours,
                    ));
                return localDate.isBefore(Get.find<RootViewModel>().currentAt);
              },

              calendarStyle: CalendarStyle(
                // Default Day Style
                defaultTextStyle:
                    FontSystem.KR16R.copyWith(color: ColorSystem.black),

                // Selected Day Style
                selectedDecoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                selectedTextStyle:
                    FontSystem.KR16R.copyWith(color: ColorSystem.black),

                // Today Style
                todayDecoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                todayTextStyle:
                    FontSystem.KR16R.copyWith(color: ColorSystem.black),

                // Outside Day Style
                outsideTextStyle:
                    FontSystem.KR16R.copyWith(color: ColorSystem.black),

                // Weekend Style
                weekendTextStyle:
                    FontSystem.KR16R.copyWith(color: ColorSystem.black),
              ),

              // Event Properties
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(
                    selectedDay, viewModel.calendarState.selectedDate)) {
                  viewModel.changeSelectedDate(selectedDay);
                }
              },
              onPageChanged: (focusedDay) {
                viewModel.updateFocusedDate(focusedDay);
              },

              // Calendar Builders
              calendarBuilders: CalendarBuilders(
                disabledBuilder: (context, day, focusedDay) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: FontSystem.KR16R
                          .copyWith(color: ColorSystem.grey[300]),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Obx(
              () => GestureDetector(
                onTap: () {
                  viewModel
                      .updateFocusedDate(viewModel.calendarState.selectedDate);
                },
                child: Text(
                  DateFormat.yMMMMEEEEd('ko_KR')
                      .format(viewModel.calendarState.selectedDate),
                  style: FontSystem.KR14R.copyWith(color: ColorSystem.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
