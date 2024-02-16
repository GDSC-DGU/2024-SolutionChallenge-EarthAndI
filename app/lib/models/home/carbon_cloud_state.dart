import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

class CarbonCloudState {
  final String _shortQuestion;
  final String _longQuestion;
  final String _exampleAnswer;
  final EUserStatus _userStatus;
  final EAction _action;
  final bool _isLeftPos;

  String get shortQuestion => _shortQuestion;
  String get longQuestion => _longQuestion;
  String get exampleAnswer => _exampleAnswer;
  EUserStatus get userStatus => _userStatus;
  EAction get action => _action;
  bool get isLeftPos => _isLeftPos;

  CarbonCloudState({
    required String shortQuestion,
    required String longQuestion,
    required String exampleAnswer,
    required EUserStatus userStatus,
    required EAction action,
    required bool isLeftPos,
  })  : _shortQuestion = shortQuestion,
        _longQuestion = longQuestion,
        _exampleAnswer = exampleAnswer,
        _userStatus = userStatus,
        _action = action,
        _isLeftPos = isLeftPos;

  CarbonCloudState copyWith({
    String? shortQuestion,
    String? longQuestion,
    String? exampleAnswer,
    EUserStatus? userStatus,
    EAction? action,
    bool? isLeftPos,
  }) {
    return CarbonCloudState(
      shortQuestion: shortQuestion ?? _shortQuestion,
      longQuestion: longQuestion ?? _longQuestion,
      exampleAnswer: exampleAnswer ?? _exampleAnswer,
      userStatus: userStatus ?? _userStatus,
      action: action ?? _action,
      isLeftPos: isLeftPos ?? _isLeftPos,
    );
  }

  @override
  String toString() {
    return '[CarbonCloudState]\n'
        'shortQuestion: $_shortQuestion\n'
        'longQuestion: $_longQuestion\n'
        'exampleAnswer: $_exampleAnswer\n'
        'userStatus: $_userStatus\n'
        'action: $_action\n'
        'isLeftPos: $_isLeftPos';
  }
}
