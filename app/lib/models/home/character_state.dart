class CharacterStatsState {
  final bool _isGoodEnvironment;
  final bool _isGoodHealth;
  final bool _isGoodMental;
  final bool _isGoodCash;

  bool get isGoodEnvironment => _isGoodEnvironment;
  bool get isGoodHealth => _isGoodHealth;
  bool get isGoodMental => _isGoodMental;
  bool get isGoodCash => _isGoodCash;

  CharacterStatsState({
    required bool isGoodEnvironment,
    required bool isGoodHealth,
    required bool isGoodMental,
    required bool isGoodCash,
  })  : _isGoodEnvironment = isGoodEnvironment,
        _isGoodHealth = isGoodHealth,
        _isGoodMental = isGoodMental,
        _isGoodCash = isGoodCash;

  CharacterStatsState copyWith({
    bool? isGoodEnvironment,
    bool? isGoodHealth,
    bool? isGoodMental,
    bool? isGoodCash,
  }) {
    return CharacterStatsState(
      isGoodEnvironment: isGoodEnvironment ?? _isGoodEnvironment,
      isGoodHealth: isGoodHealth ?? _isGoodHealth,
      isGoodMental: isGoodMental ?? _isGoodMental,
      isGoodCash: isGoodCash ?? _isGoodCash,
    );
  }

  @override
  String toString() {
    return '[CharacterStatsState]\n'
        'isGoodEnvironment: $_isGoodEnvironment\n'
        'isGoodHealth: $_isGoodHealth\n'
        'isGoodMental: $_isGoodMental\n'
        'isGoodCash: $_isGoodCash';
  }
}
