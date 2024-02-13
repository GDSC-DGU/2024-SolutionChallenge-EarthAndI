import 'package:drift/drift.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

class ChallengeHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  TextColumn get userStatus => textEnum<EUserStatus>().named('user_status')();
  TextColumn get type => textEnum<EChallenge>().named('type')();
  TextColumn get analysisContent => text().named('analysis_content')();
  RealColumn get changeCapacity => real().named('change_capacity')();
}
