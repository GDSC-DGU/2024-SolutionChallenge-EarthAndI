class ChallengeHistoryState {
  final String _longTitle;
  final String _shortTitle;
  final String _description;
  final String _iconPath;
  final bool _isCompleted;

  String get longTitle => _longTitle;
  String get shortTitle => _shortTitle;
  String get description => _description;
  String get iconPath => _iconPath;
  bool get isCompleted => _isCompleted;

  ChallengeHistoryState({
    required String shortTitle,
    required String longTitle,
    required String description,
    required String iconPath,
    required bool isCompleted,
  })  : _shortTitle = shortTitle,
        _longTitle = longTitle,
        _description = description,
        _iconPath = iconPath,
        _isCompleted = isCompleted;

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
      shortTitle: shortTitle ?? _shortTitle,
      longTitle: longTitle ?? _longTitle,
      description: description ?? _description,
      iconPath: iconPath ?? _iconPath,
      isCompleted: isCompleted ?? _isCompleted,
    );
  }
}
