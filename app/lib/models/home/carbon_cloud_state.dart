import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

class CarbonCloudState {
  final EAction action;
  final int groupIndex;
  final bool isLeftPos;

  String get shortQuestion => "${action.getContent(groupIndex)}_short";
  String get longQuestion => "${action.getContent(groupIndex)}_long";
  String get exampleAnswer => "${action.getContent(groupIndex)}_example_answer";

  CarbonCloudState({
    required this.action,
    required this.groupIndex,
    required this.isLeftPos,
  });

  CarbonCloudState copyWith({
    EAction? action,
    int? groupIndex,
    bool? isLeftPos,
  }) {
    return CarbonCloudState(
      action: action ?? this.action,
      groupIndex: groupIndex ?? this.groupIndex,
      isLeftPos: isLeftPos ?? this.isLeftPos,
    );
  }

  @override
  String toString() {
    return '[CarbonCloudState]\n'
        'action: $action\n'
        'groupIndex: $groupIndex\n'
        'isLeftPos: $isLeftPos\n';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CarbonCloudState &&
        other.action == action &&
        other.groupIndex == groupIndex &&
        other.isLeftPos == isLeftPos;
  }

  @override
  int get hashCode {
    return action.hashCode ^ groupIndex.hashCode ^ isLeftPos.hashCode;
  }
}
