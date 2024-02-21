class DeltaCO2State {
  final double totalPositiveCO2;
  final double totalNegativeCO2;
  final double changeCO2;

  double get totalCO2 => totalPositiveCO2 + totalNegativeCO2;

  DeltaCO2State({
    required this.totalPositiveCO2,
    required this.totalNegativeCO2,
    this.changeCO2 = 0,
  });

  DeltaCO2State copyWith({
    double? totalPositiveCO2,
    double? totalNegativeCO2,
    double? changeCO2,
  }) {
    return DeltaCO2State(
      totalPositiveCO2: totalPositiveCO2 ?? this.totalPositiveCO2,
      totalNegativeCO2: totalNegativeCO2 ?? this.totalNegativeCO2,
      changeCO2: changeCO2 ?? this.changeCO2,
    );
  }

  factory DeltaCO2State.initial() {
    return DeltaCO2State(
      totalPositiveCO2: 0,
      totalNegativeCO2: 0,
    );
  }
}
