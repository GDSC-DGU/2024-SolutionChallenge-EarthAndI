class CharacterStatsState {
  final bool isGoodEnvironment;
  final bool isGoodHealth;
  final bool isGoodMental;
  final bool isGoodCash;

  CharacterStatsState({
    required this.isGoodEnvironment,
    required this.isGoodHealth,
    required this.isGoodMental,
    required this.isGoodCash,
  });

  CharacterStatsState copyWith({
    bool? isGoodEnvironment,
    bool? isGoodHealth,
    bool? isGoodMental,
    bool? isGoodCash,
  }) {
    return CharacterStatsState(
      isGoodEnvironment: isGoodEnvironment ?? this.isGoodEnvironment,
      isGoodHealth: isGoodHealth ?? this.isGoodHealth,
      isGoodMental: isGoodMental ?? this.isGoodMental,
      isGoodCash: isGoodCash ?? this.isGoodCash,
    );
  }

  @override
  String toString() {
    return 'CharacterStatsState{\nisGoodEnvironment: $isGoodEnvironment\nisGoodHealth: $isGoodHealth\nisGoodMental: $isGoodMental\nisGoodCash: $isGoodCash\n}';
  }
}
