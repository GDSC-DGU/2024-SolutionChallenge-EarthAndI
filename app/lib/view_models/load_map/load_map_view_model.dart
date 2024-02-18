import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:get/get.dart';

class LoadMapViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ChallengeHistoryRepository _challengeHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<ChallengeHistoryState> _challengeHistoryState;
  late final Rx<EChallenge> _currentEChallenge;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  EChallenge get currentEChallenge => _currentEChallenge.value;
  List<ChallengeHistoryState> get challengeHistoryState =>
      _challengeHistoryState;

  List<ChallengeHistoryState> get currentChallengeHistoryState {
    return _challengeHistoryState
        .where((challenge) => !challenge.isCompleted)
        .toList();
  }

  List<ChallengeHistoryState> get completedChallengeHistoryState {
    return _challengeHistoryState
        .where((challenge) => challenge.isCompleted)
        .toList();
  }

  @override
  void onInit() async {
    super.onInit();

    // Dependency Injection
    _userRepository = Get.find<UserRepository>();
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();

    _currentEChallenge = _userRepository.readCurrentChallenge().obs;
    _challengeHistoryState = RxList<ChallengeHistoryState>([]);

    _challengeHistoryState.addAll(
      await _challengeHistoryRepository
          .readAllChallengeHistoryState(_currentEChallenge.value),
    );
  }
}
