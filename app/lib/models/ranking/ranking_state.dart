class RankingState {
  final String id;
  final String nickname;
  final double totalDeltaCO2;
  final String thumbnailPath;

  const RankingState({
    required this.id,
    required this.nickname,
    required this.totalDeltaCO2,
    required this.thumbnailPath,
  });

  RankingState copyWith({
    String? id,
    String? nickname,
    double? totalDeltaCO2,
    String? thumbnailPath,
  }) {
    return RankingState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      totalDeltaCO2: totalDeltaCO2 ?? this.totalDeltaCO2,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  factory RankingState.empty() {
    return const RankingState(
      id: '',
      nickname: '',
      totalDeltaCO2: 0,
      thumbnailPath: '',
    );
  }

  factory RankingState.fromJson(Map<String, dynamic> map) {
    String id = map['id'];
    String nickname = map['nickname'];

    double totalPositiveDeltaCO2 =
        double.parse(map['total_positive_delta_co2'].toString());
    double totalNegativeDeltaCO2 =
        double.parse(map['total_negative_delta_co2'].toString());

    int healthCondition = map['health_condition'] as bool ? 1 : 2;
    int mentalCondition = map['mental_condition'] as bool ? 1 : 2;
    int cashCondition = map['cash_condition'] as bool ? 1 : 2;

    return RankingState(
      id: id,
      nickname: nickname,
      totalDeltaCO2: totalPositiveDeltaCO2 + totalNegativeDeltaCO2,
      thumbnailPath:
          'assets/images/thumbnail/${healthCondition}_${mentalCondition}_$cashCondition.svg',
    );
  }
}
