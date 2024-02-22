import 'package:earth_and_i/apps/database/local_database.dart';

abstract class ChallengeHistoryLocalProvider {
  Future<ChallengeHistoryData> save(ChallengeHistoryCompanion data);

  Future<List<ChallengeHistoryData?>> getCompletedChallengeData();
}
