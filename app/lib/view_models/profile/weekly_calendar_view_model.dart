import 'package:earth_and_i/models/profile/weekly_calendar_state.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyCalendarViewModel extends GetxController {
  late final Rx<WeeklyCalendarState> _calendarState;

  WeeklyCalendarState get calendarState => _calendarState.value;

  @override
  void onInit() {
    super.onInit();
    _calendarState = WeeklyCalendarState.initial().obs;
  }

  void changeSelectedDate(DateTime selectedDate) {
    if (!isSameDay(selectedDate, _calendarState.value.selectedDate)) {
      _calendarState.value = _calendarState.value
          .copyWith(selectedDate: selectedDate, focusedDate: selectedDate);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _calendarState.close();
  }
}
