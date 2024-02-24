import 'package:drift/drift.dart';
import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/dao/challenge_history_dao.dart';
import 'package:earth_and_i/providers/challenge/challenge_history_local_provider.dart';

class ChallengeHistoryLocalProviderImpl extends ChallengeHistoryDao
    implements ChallengeHistoryLocalProvider {
  ChallengeHistoryLocalProviderImpl(super.db);

  /// Save [ChallengeHistoryData] to the database.
  /// When the same data is saved, the data is updated.
  @override
  Future<ChallengeHistoryData> save(
    ChallengeHistoryCompanion entity,
  ) async {
    int id = await into(challengeHistory).insertOnConflictUpdate(entity);

    return ChallengeHistoryData(
      id: id,
      createdAt: entity.createdAt.value,
      updatedAt: entity.updatedAt.value,
      userStatus: entity.userStatus.value,
      type: entity.type.value,
      analysisContent: entity.analysisContent.value,
      changeCapacity: entity.changeCapacity.value,
    );
  }

  @override
  Future<List<ChallengeHistoryData?>> findAllByOffset(int offset, int limit) {
    return (select(challengeHistory)
          ..orderBy([
            (t) =>
                OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc),
          ])
          ..limit(limit, offset: offset))
        .get();
  }
}
