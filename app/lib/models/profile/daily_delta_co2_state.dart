class DailyDeltaCO2State {
  // Brief CO2
  final double positiveDeltaCO2;
  final double negativeDeltaCO2;

  // Detail CO2
  final double healthPositiveDeltaCO2;
  final double healthNegativeDeltaCO2;
  final double mentalPositiveDeltaCO2;
  final double mentalNegativeDeltaCO2;
  final double cashPositiveDeltaCO2;
  final double cashNegativeDeltaCO2;

  double get totalDeltaCO2 => positiveDeltaCO2 + negativeDeltaCO2;

  DailyDeltaCO2State({
    required this.positiveDeltaCO2,
    required this.negativeDeltaCO2,
    required this.healthPositiveDeltaCO2,
    required this.healthNegativeDeltaCO2,
    required this.mentalPositiveDeltaCO2,
    required this.mentalNegativeDeltaCO2,
    required this.cashPositiveDeltaCO2,
    required this.cashNegativeDeltaCO2,
  });

  DailyDeltaCO2State copyWith({
    double? positiveDeltaCO2,
    double? negativeDeltaCO2,
    double? healthPositiveDeltaCO2,
    double? healthNegativeDeltaCO2,
    double? mentalPositiveDeltaCO2,
    double? mentalNegativeDeltaCO2,
    double? cashPositiveDeltaCO2,
    double? cashNegativeDeltaCO2,
  }) {
    return DailyDeltaCO2State(
      positiveDeltaCO2: positiveDeltaCO2 ?? this.positiveDeltaCO2,
      negativeDeltaCO2: negativeDeltaCO2 ?? this.negativeDeltaCO2,
      healthPositiveDeltaCO2:
          healthPositiveDeltaCO2 ?? this.healthPositiveDeltaCO2,
      healthNegativeDeltaCO2:
          healthNegativeDeltaCO2 ?? this.healthNegativeDeltaCO2,
      mentalPositiveDeltaCO2:
          mentalPositiveDeltaCO2 ?? this.mentalPositiveDeltaCO2,
      mentalNegativeDeltaCO2:
          mentalNegativeDeltaCO2 ?? this.mentalNegativeDeltaCO2,
      cashPositiveDeltaCO2: cashPositiveDeltaCO2 ?? this.cashPositiveDeltaCO2,
      cashNegativeDeltaCO2: cashNegativeDeltaCO2 ?? this.cashNegativeDeltaCO2,
    );
  }

  factory DailyDeltaCO2State.initial() {
    return DailyDeltaCO2State(
      positiveDeltaCO2: 0,
      negativeDeltaCO2: 0,
      healthPositiveDeltaCO2: 0,
      healthNegativeDeltaCO2: 0,
      mentalPositiveDeltaCO2: 0,
      mentalNegativeDeltaCO2: 0,
      cashPositiveDeltaCO2: 0,
      cashNegativeDeltaCO2: 0,
    );
  }

  @override
  String toString() {
    return 'DailyDeltaCO2State(positiveDeltaCO2: $positiveDeltaCO2, negativeDeltaCO2: $negativeDeltaCO2, healthPositiveCnt: $healthPositiveDeltaCO2, healthNegativeCnt: $healthNegativeDeltaCO2, mentalPositiveCnt: $mentalPositiveDeltaCO2, mentalNegativeCnt: $mentalNegativeDeltaCO2, cashPositiveCnt: $cashPositiveDeltaCO2, cashNegativeCnt: $cashNegativeDeltaCO2)';
  }
}
