import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class LoadMapViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ChallengeHistoryRepository _challengeHistoryRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RiveAnimationController _animationController;

  late final RxList<ChallengeHistoryState> _challengeHistoryStates;
  late final Rx<EChallenge> _currentEChallenge;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  RiveAnimationController get animationController => _animationController;

  EChallenge get currentEChallenge => _currentEChallenge.value;
  List<ChallengeHistoryState> get challengeHistoryStates =>
      _challengeHistoryStates;

  List<ChallengeHistoryState> get currentChallengeHistoryState {
    return _challengeHistoryStates
        .where((challenge) => !challenge.isCompleted)
        .toList();
  }

  List<ChallengeHistoryState> get completedChallengeHistoryState {
    return _challengeHistoryStates
        .where((challenge) => challenge.isCompleted)
        .toList();
  }

  @override
  void onInit() async {
    super.onInit();

    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();

    // Private Fields
    _animationController = SimpleAnimation("LoadingAnimation", autoplay: true);

    _currentEChallenge = _userRepository.readCurrentChallenge().obs;
    _challengeHistoryStates = RxList<ChallengeHistoryState>([]);

    _challengeHistoryStates.addAll(
      await _challengeHistoryRepository
          .readAllChallengeHistoryState(_currentEChallenge.value),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  Future<void> fetchCurrentEChallenge(EChallenge challenge) async {
    _currentEChallenge.value = _userRepository.readCurrentChallenge();
    _challengeHistoryStates.clear();
    _challengeHistoryStates.addAll(
      await _challengeHistoryRepository.readAllChallengeHistoryState(challenge),
    );
  }
}
