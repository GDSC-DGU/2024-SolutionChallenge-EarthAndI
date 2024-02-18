class CalendarState {
  final DateTime selectedDate;
  final DateTime focusedDate;

  CalendarState({
    required this.selectedDate,
    required this.focusedDate,
  });

  factory CalendarState.initial() {
    return CalendarState(
      selectedDate: DateTime.now(),
      focusedDate: DateTime.now(),
    );
  }

  CalendarState copyWith({
    DateTime? selectedDate,
    DateTime? focusedDate,
  }) {
    return CalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDate: focusedDate ?? this.focusedDate,
    );
  }
}
