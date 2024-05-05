import 'package:earth_and_i/domains/type/e_challenge.dart';

class ChallengeHistoryState {
  final EChallenge type;
  final bool isCompleted;
  final DateTime? completedAt;

  ChallengeHistoryState({
    required this.type,
    this.completedAt,
    required this.isCompleted,
  });

  ChallengeHistoryState copyWith({
    EChallenge? type,
    DateTime? completedAt,
    bool? isCompleted,
  }) {
    return ChallengeHistoryState(
      type: type ?? this.type,
      completedAt: completedAt ?? this.completedAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
