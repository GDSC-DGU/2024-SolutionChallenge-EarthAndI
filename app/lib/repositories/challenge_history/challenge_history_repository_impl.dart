import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/providers/challenge/challenge_history_local_provider.dart';
import 'package:earth_and_i/repositories/challenge_history/challenge_history_repository.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:get/get.dart';

class ChallengeHistoryRepositoryImpl extends GetxService
    implements ChallengeHistoryRepository {
  late final ChallengeHistoryLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalDatabaseFactory.instance.challengeHistoryDao;
  }

  /* ----------------------------------------------------- */
  /* ----------------------------------------------------- */
  @override
  Future<List<ChallengeHistoryState>> readAllChallengeHistoryState() async {
    List<ChallengeHistoryData?> challengeHistories =
        await _localProvider.findAllByOffset(0, 10);

    return challengeHistories
        .map((e) => ChallengeHistoryState(
              type: e!.type,
              isCompleted: true,
              completedAt: e.createdAt,
            ))
        .toList();
  }

  @override
  Future<ChallengeHistoryData> createOrUpdate(
      ChallengeHistoryCompanion data) async {
    try {
      return await _localProvider.save(data);
    } on Exception catch (e) {
      LogUtil.e(e);
      rethrow;
    }
  }

  Future<void> deleteAllChallengeHistories() async {
    await _localProvider.deleteAll();
  }
}
