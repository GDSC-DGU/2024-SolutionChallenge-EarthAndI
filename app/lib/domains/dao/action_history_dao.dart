import 'package:drift/drift.dart';
import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/entity/action_history.dart';

part 'action_history_dao.g.dart';

@DriftAccessor(tables: [ActionHistory])
class ActionHistoryDao extends DatabaseAccessor<LocalDatabase>
    with _$ActionHistoryDaoMixin {
  ActionHistoryDao(super.db);

  /// Save [ActionHistoryData] to the database.
  /// When the same data is saved, the data is updated.
  Future<ActionHistoryData> save(
    ActionHistoryData entity,
  ) async {
    int index = await into(actionHistory).insertOnConflictUpdate(entity);

    return entity.copyWith(id: index);
  }
}
