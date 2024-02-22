import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/providers/challenge_history_local_provider.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:get/get.dart';

class ChallengeHistoryRepository extends GetxService {
  late final ChallengeHistoryLocalProvider _localProvider;

  static final List<EChallenge> _challenges = [
    EChallenge.useEcoFriendlyProducts,
    EChallenge.deleteEmail,
    EChallenge.eatVegetarian,
    EChallenge.useColdWater,
    EChallenge.clearAllChallenge
  ];

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalDatabaseFactory.instance.challengeHistoryDao;
  }

  /* ----------------------------------------------------- */
  /* ----------------------------------------------------- */
  Future<List<ChallengeHistoryState>> readAllChallengeHistoryState(
      EChallenge currentEChallenge) async {
    List<ChallengeHistoryState> states = [];

    List<ChallengeHistoryData?> completedChallengeHistories =
        await _localProvider.getCompletedChallengeData();

    for (var history in completedChallengeHistories) {
      for (var challenge in _challenges) {
        if (challenge == history?.type) {
          states.add(ChallengeHistoryState(
              shortTitle: "${challenge}ShortTitle",
              longTitle: "${challenge}LongTitle",
              description: "${challenge}Description",
              iconPath: "${challenge}IconPath",
              isCompleted: true));
        }
      }
    }

    for (var challenge in _challenges) {
      if (challenge == currentEChallenge) {
        states.add(ChallengeHistoryState(
            shortTitle: "${currentEChallenge}ShortTitle",
            longTitle: "${currentEChallenge}LongTitle",
            description: "${currentEChallenge}Description",
            iconPath: "${currentEChallenge}IconPath",
            isCompleted: false));
      }
    }
    return states;
  }

  Future<ChallengeHistoryState> getCurrentChallengeState(
      EChallenge challenge) async {
    ChallengeHistoryState state = ChallengeHistoryState.initial();
    for (var challenge in _challenges) {
      if (challenge == challenge) {
        state = ChallengeHistoryState(
            shortTitle: "${challenge}ShortTitle",
            longTitle: "${challenge}LongTitle",
            description: "${challenge}Description",
            iconPath: "${challenge}IconPath",
            isCompleted: false);
      }
    }
    return state;
  }

  Future<ChallengeHistoryData> updateCompletedChallenge(
      ChallengeHistoryCompanion data) async {
    try {
      return await _localProvider.save(data);
    } on Exception catch (e) {
      DevOnLog.e(e);
      rethrow;
    }
  }
}
