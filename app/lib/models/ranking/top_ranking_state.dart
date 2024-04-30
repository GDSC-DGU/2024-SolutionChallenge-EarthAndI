class TopRankingState {
  final String? id;
  final String nickname;
  final double totalDeltaCO2;
  final String thumbnailPath;
  final String characterPath;

  const TopRankingState({
    this.id,
    required this.nickname,
    required this.totalDeltaCO2,
    required this.thumbnailPath,
    required this.characterPath,
  });

  TopRankingState copyWith({
    String? id,
    String? nickname,
    double? totalDeltaCO2,
    String? thumbnailPath,
    String? characterPath,
  }) {
    return TopRankingState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      totalDeltaCO2: totalDeltaCO2 ?? this.totalDeltaCO2,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
      characterPath: characterPath ?? this.characterPath,
    );
  }

  factory TopRankingState.empty() {
    return const TopRankingState(
      id: null,
      nickname: '',
      totalDeltaCO2: 0,
      thumbnailPath: '',
      characterPath: '',
    );
  }

  factory TopRankingState.fromMap(Map<String, dynamic> map) {
    String id = map['id'];
    String nickname = map['nickname'];

    double totalPositiveDeltaCO2 =
        double.parse(map['total_positive_delta_co2'].toString());
    double totalNegativeDeltaCO2 =
        double.parse(map['total_negative_delta_co2'].toString());

    int healthCondition = map['health_condition'] as bool ? 1 : 2;
    int mentalCondition = map['mental_condition'] as bool ? 1 : 2;
    int cashCondition = map['cash_condition'] as bool ? 1 : 2;

    return TopRankingState(
      id: id,
      nickname: nickname,
      totalDeltaCO2: totalPositiveDeltaCO2 + totalNegativeDeltaCO2,
      thumbnailPath:
          "assets/images/thumbnail/${healthCondition}_${mentalCondition}_$cashCondition.svg",
      characterPath:
          "assets/images/analysis/${healthCondition}_${mentalCondition}_$cashCondition.svg",
    );
  }
}
