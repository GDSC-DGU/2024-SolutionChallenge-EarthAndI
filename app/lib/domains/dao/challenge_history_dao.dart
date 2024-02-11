import 'package:drift/drift.dart';
import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/entity/challenge_history.dart';

part 'challenge_history_dao.g.dart';

@DriftAccessor(tables: [ChallengeHistory])
class ChallengeHistoryDao extends DatabaseAccessor<LocalDatabase>
    with _$ChallengeHistoryDaoMixin {
  ChallengeHistoryDao(super.db);

  /// Save [ChallengeHistoryData] to the database.
  /// When the same data is saved, the data is updated.
  Future<ChallengeHistoryData> save(
    ChallengeHistoryData entity,
  ) async {
    int id = await into(challengeHistory).insertOnConflictUpdate(entity);

    return entity.copyWith(id: id);
  }
}
