import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

class CarbonCloudState {
  final String text;
  final EUserStatus userStatus;
  final EAction action;
  final bool isLeftPos;

  CarbonCloudState({
    required this.text,
    required this.userStatus,
    required this.action,
    required this.isLeftPos,
  });

  CarbonCloudState copyWith({
    String? text,
    EUserStatus? userStatus,
    EAction? action,
    bool? isLeftPos,
  }) {
    return CarbonCloudState(
      text: text ?? this.text,
      userStatus: userStatus ?? this.userStatus,
      action: action ?? this.action,
      isLeftPos: isLeftPos ?? this.isLeftPos,
    );
  }
}
