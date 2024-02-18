class UserBriefState {
  final String id;
  final String nickname;

  const UserBriefState({
    required this.id,
    required this.nickname,
  });

  UserBriefState copyWith({
    String? id,
    String? nickname,
  }) {
    return UserBriefState(
      id: id ?? this.id,
      nickname: nickname ?? this.nickname,
    );
  }

  factory UserBriefState.initial() {
    return const UserBriefState(
      id: '',
      nickname: '',
    );
  }
}
