import 'package:drift/native.dart';
import 'package:earth_and_i/domains/dao/action_history_dao.dart';
import 'package:earth_and_i/domains/dao/challenge_history_dao.dart';
import 'package:earth_and_i/domains/entity/action_history.dart';
import 'package:earth_and_i/domains/entity/challenge_history.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'dart:io';

part 'local_database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

@DriftDatabase(
  tables: [
    ActionHistory,
    ChallengeHistory,
  ],
  daos: [
    ActionHistoryDao,
    ChallengeHistoryDao,
  ],
)
class LocalDatabase extends _$LocalDatabase {
  LocalDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
