import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';

abstract class ChallengeHistoryRepository {
  Future<List<ChallengeHistoryState>> readAllChallengeHistoryState();

  Future<ChallengeHistoryData> createOrUpdate(ChallengeHistoryCompanion data);

  Future<void> deleteAllChallengeHistories();
}
