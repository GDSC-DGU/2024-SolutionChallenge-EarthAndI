import 'package:drift/drift.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';

class ChallengeHistory extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get createdAt => dateTime().named('created_at')();
  DateTimeColumn get updatedAt => dateTime().named('updated_at')();
  TextColumn get type => textEnum<EChallenge>().named('type')();
  IntColumn get changeCapacity => integer().named('change_capacity')();
}
