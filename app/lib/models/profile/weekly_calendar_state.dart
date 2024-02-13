class WeeklyCalendarState {
  final DateTime _selectedDate;
  final DateTime _focusedDate;

  DateTime get selectedDate => _selectedDate;
  DateTime get focusedDate => _focusedDate;

  WeeklyCalendarState({
    required DateTime selectedDate,
    required DateTime focusedDate,
  })  : _selectedDate = selectedDate,
        _focusedDate = focusedDate;

  factory WeeklyCalendarState.initial() {
    return WeeklyCalendarState(
      selectedDate: DateTime.now(),
      focusedDate: DateTime.now(),
    );
  }

  WeeklyCalendarState copyWith({
    DateTime? selectedDate,
    DateTime? focusedDate,
  }) {
    return WeeklyCalendarState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDate: focusedDate ?? this.focusedDate,
    );
  }
}
