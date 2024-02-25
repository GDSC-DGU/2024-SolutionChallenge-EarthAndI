class NotificationState {
  final bool isActive;
  final int hour;
  final int minute;

  const NotificationState({
    required this.isActive,
    required this.hour,
    required this.minute,
  });

  NotificationState copyWith({
    bool? isActive,
    int? hour,
    int? minute,
  }) {
    return NotificationState(
      isActive: isActive ?? this.isActive,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  factory NotificationState.initial() {
    return const NotificationState(
      isActive: false,
      hour: 0,
      minute: 0,
    );
  }

  @override
  String toString() {
    return 'AlarmState{isAlarmActive: $isActive, alarmHour: $hour, alarmMinute: $minute}';
  }
}
