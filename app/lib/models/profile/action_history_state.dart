import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

class ActionHistoryState {
  final String characterStatus;
  final DateTime createdAt;
  final double changeCapacity;
  final EAction type;
  final String question;
  final String answer;

  const ActionHistoryState({
    required this.type,
    required this.characterStatus,
    required this.createdAt,
    required this.changeCapacity,
    required this.question,
    required this.answer,
  });

  factory ActionHistoryState.fromData(ActionHistoryData data) {
    EUserStatus userStatus = data.userStatus;
    String characterStatus;
    String health = '1';
    String mental = '1';
    String cash = '1';

    if (data.changeCapacity > 0) {
      switch (userStatus) {
        case EUserStatus.health:
          health = '2';
          break;
        case EUserStatus.mental:
          mental = '2';
          break;
        case EUserStatus.cash:
          cash = '2';
          break;
      }
    }

    characterStatus = '${health}_${mental}_$cash';

    return ActionHistoryState(
      type: data.type,
      characterStatus: characterStatus,
      createdAt: data.createdAt,
      changeCapacity: data.changeCapacity,
      question: data.question,
      answer: data.answer,
    );
  }
}
