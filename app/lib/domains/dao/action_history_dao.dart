import 'package:drift/drift.dart';
import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/entity/action_history.dart';
import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/providers/action_history_local_provider.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';

part 'action_history_dao.g.dart';

@DriftAccessor(tables: [ActionHistory])
class ActionHistoryDao extends DatabaseAccessor<LocalDatabase>
    with _$ActionHistoryDaoMixin
    implements ActionHistoryLocalProvider {
  ActionHistoryDao(super.db);

  /// Save [ActionHistoryData] to the database.
  /// When the same data is saved, the data is updated.
  @override
  Future<ActionHistoryData> save(
    ActionHistoryCompanion entity,
  ) async {
    int index = await into(actionHistory).insertOnConflictUpdate(entity);

    return ActionHistoryData(
      id: index,
      createdAt: entity.createdAt.value,
      updatedAt: entity.updatedAt.value,
      type: entity.type.value,
      changeCapacity: entity.changeCapacity.value,
    );
  }

  @override
  Future<ActionHistoryData?> findOneByTypeAndDateRange(
    EAction type,
    DateTime startAt,
    DateTime endAt,
  ) async {
    return await (select(actionHistory)
          ..where((t) => t.type.equals(type.databaseValue))
          ..where((t) => t.createdAt.isBetweenValues(startAt, endAt))
          ..orderBy(
            [
              (t) => OrderingTerm(
                  expression: t.createdAt, mode: OrderingMode.desc),
            ],
          )
          ..limit(1))
        .getSingleOrNull();
  }
}
