class DeltaCO2State {
  final double totalCO2;
  final double changeCO2;

  DeltaCO2State({
    required this.totalCO2,
    this.changeCO2 = 0,
  });

  DeltaCO2State copyWith({
    double? totalCO2,
    double? changeCO2,
  }) {
    return DeltaCO2State(
      totalCO2: totalCO2 ?? this.totalCO2,
      changeCO2: changeCO2 ?? this.changeCO2,
    );
  }
}
