class DailyDeltaCO2State {
  // Delta CO2
  final double positiveDeltaCO2;
  final double negativeDeltaCO2;

  // Count
  final int healthPositiveCnt;
  final int healthNegativeCnt;
  final int mentalPositiveCnt;
  final int mentalNegativeCnt;
  final int cashPositiveCnt;
  final int cashNegativeCnt;

  double get totalDeltaCO2 => positiveDeltaCO2 + negativeDeltaCO2;

  DailyDeltaCO2State({
    required this.positiveDeltaCO2,
    required this.negativeDeltaCO2,
    required this.healthPositiveCnt,
    required this.healthNegativeCnt,
    required this.mentalPositiveCnt,
    required this.mentalNegativeCnt,
    required this.cashPositiveCnt,
    required this.cashNegativeCnt,
  });

  DailyDeltaCO2State copyWith({
    double? positiveDeltaCO2,
    double? negativeDeltaCO2,
    int? healthPositiveCnt,
    int? healthNegativeCnt,
    int? mentalPositiveCnt,
    int? mentalNegativeCnt,
    int? cashPositiveCnt,
    int? cashNegativeCnt,
  }) {
    return DailyDeltaCO2State(
      positiveDeltaCO2: positiveDeltaCO2 ?? this.positiveDeltaCO2,
      negativeDeltaCO2: negativeDeltaCO2 ?? this.negativeDeltaCO2,
      healthPositiveCnt: healthPositiveCnt ?? this.healthPositiveCnt,
      healthNegativeCnt: healthNegativeCnt ?? this.healthNegativeCnt,
      mentalPositiveCnt: mentalPositiveCnt ?? this.mentalPositiveCnt,
      mentalNegativeCnt: mentalNegativeCnt ?? this.mentalNegativeCnt,
      cashPositiveCnt: cashPositiveCnt ?? this.cashPositiveCnt,
      cashNegativeCnt: cashNegativeCnt ?? this.cashNegativeCnt,
    );
  }

  factory DailyDeltaCO2State.initial() {
    return DailyDeltaCO2State(
      positiveDeltaCO2: 0,
      negativeDeltaCO2: 0,
      healthPositiveCnt: 0,
      healthNegativeCnt: 0,
      mentalPositiveCnt: 0,
      mentalNegativeCnt: 0,
      cashPositiveCnt: 0,
      cashNegativeCnt: 0,
    );
  }

  @override
  String toString() {
    return 'DailyDeltaCO2State(positiveDeltaCO2: $positiveDeltaCO2, negativeDeltaCO2: $negativeDeltaCO2, healthPositiveCnt: $healthPositiveCnt, healthNegativeCnt: $healthNegativeCnt, mentalPositiveCnt: $mentalPositiveCnt, mentalNegativeCnt: $mentalNegativeCnt, cashPositiveCnt: $cashPositiveCnt, cashNegativeCnt: $cashNegativeCnt)';
  }
}
