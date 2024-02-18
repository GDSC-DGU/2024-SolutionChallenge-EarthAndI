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

  String getTranslation() {
    // 각 스탯에 따라 이미지 경로 결정
    String prefix = 'character';

    String environment = isGoodEnvironment ? '1' : '2';
    String health = isGoodHealth ? '1' : '2';
    String mental = isGoodMental ? '1' : '2';
    String cash = isGoodCash ? '1' : '2';

    return '${prefix}_${environment}_${health}_${mental}_$cash';
  }

  @override
  String toString() {
    return '[CharacterStatsState]\n'
        'isGoodEnvironment: $isGoodEnvironment'
        '\nisGoodHealth: $isGoodHealth'
        '\nisGoodMental: $isGoodMental'
        '\nisGoodCash: $isGoodCash';
  }
}
