class TotalCarbonState {
  final double _positiveTotalDeltaCO2;
  final double _negativeTotalDeltaCO2;
  final double _totalDeltaCO2;

  double get positiveTotalDeltaCO2 => _positiveTotalDeltaCO2;
  double get negativeTotalDeltaCO2 => _negativeTotalDeltaCO2;
  double get totalDeltaCO2 => _totalDeltaCO2;

  TotalCarbonState({
    required double positiveTotalDeltaCO2,
    required double negativeTotalDeltaCO2,
    required double totalDeltaCO2,
  })  : _positiveTotalDeltaCO2 = positiveTotalDeltaCO2,
        _negativeTotalDeltaCO2 = negativeTotalDeltaCO2,
        _totalDeltaCO2 = totalDeltaCO2;

  TotalCarbonState copyWith({
    double? positiveTotalDeltaCO2,
    double? negativeTotalDeltaCO2,
    double? totalDeltaCO2,
  }) {
    return TotalCarbonState(
      positiveTotalDeltaCO2: positiveTotalDeltaCO2 ?? _positiveTotalDeltaCO2,
      negativeTotalDeltaCO2: negativeTotalDeltaCO2 ?? _negativeTotalDeltaCO2,
      totalDeltaCO2: totalDeltaCO2 ?? _totalDeltaCO2,
    );
  }

  factory TotalCarbonState.initial() {
    return TotalCarbonState(
      positiveTotalDeltaCO2: 0,
      negativeTotalDeltaCO2: 0,
      totalDeltaCO2: 0,
    );
  }
}
