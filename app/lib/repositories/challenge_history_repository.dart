import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/providers/challenge/challenge_history_local_provider.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:get/get.dart';

class ChallengeHistoryRepository extends GetxService {
  late final ChallengeHistoryLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalDatabaseFactory.instance.challengeHistoryDao;
  }

  /* ----------------------------------------------------- */
  /* ----------------------------------------------------- */
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

  Future<ChallengeHistoryData> createOrUpdate(
      ChallengeHistoryCompanion data) async {
    try {
      return await _localProvider.save(data);
    } on Exception catch (e) {
      LogUtil.e(e);
      rethrow;
    }
  }
}
