class ChallengeHistoryState {
  final String longTitle;
  final String shortTitle;
  final String description;
  final String iconPath;
  final bool isCompleted;

  ChallengeHistoryState({
    required this.shortTitle,
    required this.longTitle,
    required this.description,
    required this.iconPath,
    required this.isCompleted,
  });

  factory ChallengeHistoryState.initial() {
    return ChallengeHistoryState(
      shortTitle: '챌린지 제목',
      longTitle: '챌린지 긴 제목',
      description: '챌린지 설명',
      iconPath: 'assets/icons/thumbnail.png',
      isCompleted: false,
    );
  }

  ChallengeHistoryState copyWith({
    String? shortTitle,
    String? longTitle,
    String? description,
    String? iconPath,
    bool? isCompleted,
  }) {
    return ChallengeHistoryState(
      shortTitle: shortTitle ?? this.shortTitle,
      longTitle: longTitle ?? this.longTitle,
      description: description ?? this.description,
      iconPath: iconPath ?? this.iconPath,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
