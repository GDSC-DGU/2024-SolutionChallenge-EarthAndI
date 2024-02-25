class FollowState {
  final String id;
  final String nickname;
  final bool isFollowing;
  final double totalDeltaCO2;
  final String thumbnailPath;

  const FollowState({
    required this.id,
    required this.nickname,
    required this.isFollowing,
    required this.totalDeltaCO2,
    required this.thumbnailPath,
  });

  FollowState copyWith({
    String? id,
    String? nickname,
    bool? isFollowing,
    double? totalDeltaCO2,
    String? thumbnailPath,
  }) {
    return FollowState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      isFollowing: isFollowing ?? this.isFollowing,
      totalDeltaCO2: totalDeltaCO2 ?? this.totalDeltaCO2,
      thumbnailPath: thumbnailPath ?? this.thumbnailPath,
    );
  }

  factory FollowState.fromJson(Map<String, dynamic> map) {
    String id = map['id'];
    String nickname = map['nickname'];

    double totalPositiveDeltaCO2 =
        double.parse(map['total_positive_delta_co2'].toString());
    double totalNegativeDeltaCO2 =
        double.parse(map['total_negative_delta_co2'].toString());

    int healthCondition = map['health_condition'] as bool ? 1 : 2;
    int mentalCondition = map['mental_condition'] as bool ? 1 : 2;
    int cashCondition = map['cash_condition'] as bool ? 1 : 2;

    return FollowState(
      id: id,
      nickname: nickname,
      isFollowing: map['is_following'],
      totalDeltaCO2: totalPositiveDeltaCO2 + totalNegativeDeltaCO2,
      thumbnailPath:
          "assets/images/thumbnail/${healthCondition}_${mentalCondition}_$cashCondition.svg",
    );
  }

  @override
  String toString() {
    return 'FollowState(id: $id, nickname: $nickname, isFollowing: $isFollowing, totalDeltaCO2: $totalDeltaCO2, thumbnailPath: $thumbnailPath)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FollowState && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
