import 'package:drift/drift.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

/// ActionHistory Table
/// 1. id: Auto Increment ID
/// 2. createdAt: Created At
/// 3. updatedAt: Updated At
/// 4. userStatus: User Status(Health, Mental, Cash)
/// 5. type: Action Type(EAction)
/// 6. question: Question
/// 7. answer: Answer
/// 8. changeCapacity: Change Capacity
class ActionHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  TextColumn get userStatus => textEnum<EUserStatus>().named('user_status')();
  TextColumn get type => textEnum<EAction>().named('type')();
  TextColumn get question => text().named('question')();
  TextColumn get answer => text().named('answer')();
  RealColumn get changeCapacity => real().named('change_capacity')();
}
