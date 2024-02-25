class UserBriefState {
  final String id;
  final String nickname;
  final int followingCount;
  final int followerCount;

  const UserBriefState({
    required this.id,
    required this.nickname,
    required this.followingCount,
    required this.followerCount,
  });

  UserBriefState copyWith({
    String? id,
    String? nickname,
    int? followingCount,
    int? followerCount,
  }) {
    return UserBriefState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
      followingCount: followingCount ?? this.followingCount,
      followerCount: followerCount ?? this.followerCount,
    );
  }

  factory UserBriefState.initial() {
    return const UserBriefState(
      id: '',
      nickname: '',
      followingCount: 0,
      followerCount: 0,
    );
  }
}
