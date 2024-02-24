class CharacterStatsState {
  final bool isEnvironmentCondition;
  final bool isHealthCondition;
  final bool isMentalCondition;
  final bool isCashCondition;

  CharacterStatsState({
    required this.isEnvironmentCondition,
    required this.isHealthCondition,
    required this.isMentalCondition,
    required this.isCashCondition,
  });

  CharacterStatsState copyWith({
    bool? isEnvironmentCondition,
    bool? isHealthCondition,
    bool? isMentalCondition,
    bool? isCashCondition,
  }) {
    return CharacterStatsState(
      isEnvironmentCondition:
          isEnvironmentCondition ?? this.isEnvironmentCondition,
      isHealthCondition: isHealthCondition ?? this.isHealthCondition,
      isMentalCondition: isMentalCondition ?? this.isMentalCondition,
      isCashCondition: isCashCondition ?? this.isCashCondition,
    );
  }

  String getTranslation() {
    // 각 스탯에 따라 이미지 경로 결정
    String prefix = 'character';

    String environment = isEnvironmentCondition ? '1' : '2';
    String health = isHealthCondition ? '1' : '2';
    String mental = isMentalCondition ? '1' : '2';
    String cash = isCashCondition ? '1' : '2';

    return '${prefix}_${environment}_${health}_${mental}_$cash';
  }

  @override
  String toString() {
    return '[CharacterStatsState]\n'
        'isGoodEnvironment: $isEnvironmentCondition'
        '\nisGoodHealth: $isHealthCondition'
        '\nisGoodMental: $isMentalCondition'
        '\nisGoodCash: $isCashCondition';
  }
}
