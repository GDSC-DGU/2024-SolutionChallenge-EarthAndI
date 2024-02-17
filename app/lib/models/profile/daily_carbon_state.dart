class DailyCarbonState {
  final int _healthPositiveCnt;
  final int _healthNegativeCnt;
  final int _mentalPositiveCnt;
  final int _mentalNegativeCnt;
  final int _cashPositiveCnt;
  final int _cashNegativeCnt;

  int get healthPositiveCnt => _healthPositiveCnt;
  int get healthNegativeCnt => _healthNegativeCnt;
  int get mentalPositiveCnt => _mentalPositiveCnt;
  int get mentalNegativeCnt => _mentalNegativeCnt;
  int get cashPositiveCnt => _cashPositiveCnt;
  int get cashNegativeCnt => _cashNegativeCnt;

  DailyCarbonState({
    required int healthPositiveCnt,
    required int healthNegativeCnt,
    required int mentalPositiveCnt,
    required int mentalNegativeCnt,
    required int cashPositiveCnt,
    required int cashNegativeCnt,
  })  : _healthPositiveCnt = healthPositiveCnt,
        _healthNegativeCnt = healthNegativeCnt,
        _mentalPositiveCnt = mentalPositiveCnt,
        _mentalNegativeCnt = mentalNegativeCnt,
        _cashPositiveCnt = cashPositiveCnt,
        _cashNegativeCnt = cashNegativeCnt;

  DailyCarbonState copyWith({
    int? healthPositiveCnt,
    int? healthNegativeCnt,
    int? mentalPositiveCnt,
    int? mentalNegativeCnt,
    int? cashPositiveCnt,
    int? cashNegativeCnt,
  }) {
    return DailyCarbonState(
      healthPositiveCnt: healthPositiveCnt ?? _healthPositiveCnt,
      healthNegativeCnt: healthNegativeCnt ?? _healthNegativeCnt,
      mentalPositiveCnt: mentalPositiveCnt ?? _mentalPositiveCnt,
      mentalNegativeCnt: mentalNegativeCnt ?? _mentalNegativeCnt,
      cashPositiveCnt: cashPositiveCnt ?? _cashPositiveCnt,
      cashNegativeCnt: cashNegativeCnt ?? _cashNegativeCnt,
    );
  }

  factory DailyCarbonState.initial() {
    return DailyCarbonState(
      healthPositiveCnt: 0,
      healthNegativeCnt: 0,
      mentalPositiveCnt: 0,
      mentalNegativeCnt: 0,
      cashPositiveCnt: 0,
      cashNegativeCnt: 0,
    );
  }
}
