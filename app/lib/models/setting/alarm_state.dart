class AlarmState {
  final bool isActive;
  final int hour;
  final int minute;

  const AlarmState({
    required this.isActive,
    required this.hour,
    required this.minute,
  });

  AlarmState copyWith({
    bool? isActive,
    int? hour,
    int? minute,
  }) {
    return AlarmState(
      isActive: isActive ?? this.isActive,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
    );
  }

  factory AlarmState.initial() {
    return const AlarmState(
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
