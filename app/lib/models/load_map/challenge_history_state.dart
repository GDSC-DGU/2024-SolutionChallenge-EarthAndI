import 'package:earth_and_i/domains/type/e_challenge.dart';

class ChallengeHistoryState {
  final EChallenge challenge;
  final bool isCompleted;
  final DateTime? completedAt;

  ChallengeHistoryState({
    required this.challenge,
    required this.completedAt,
    required this.isCompleted,
  });

  ChallengeHistoryState copyWith({
    EChallenge? challenge,
    DateTime? completedAt,
    bool? isCompleted,
  }) {
    return ChallengeHistoryState(
      challenge: challenge ?? this.challenge,
      completedAt: completedAt ?? this.completedAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
