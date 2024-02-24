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

  late final Rxn<ChallengeHistoryState> _currentChallengeState;
  late final RxList<ChallengeHistoryState> _challengeHistoryStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  RiveAnimationController get animationController => _animationController;

  ChallengeHistoryState? get currentChallengeState =>
      _currentChallengeState.value;
  List<ChallengeHistoryState> get challengeHistoryStates =>
      _challengeHistoryStates;

  @override
  void onInit() async {
    super.onInit();

    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();

    // Private Fields
    _animationController = SimpleAnimation("LoadingAnimation", autoplay: true);

    _currentChallengeState = Rxn<ChallengeHistoryState>();
    _challengeHistoryStates = RxList<ChallengeHistoryState>([]);

    // Load Data
    fetchCurrentChallenge();
    fetchChallengeHistories();
  }

  @override
  void dispose() {
    super.dispose();

    _animationController.dispose();
  }

  Future<void> fetchCurrentChallenge() async {
    EChallenge? challenge = _userRepository.readCurrentChallenge();

    if (challenge != null) {
      _currentChallengeState.value = ChallengeHistoryState(
        type: challenge,
        completedAt: null,
        isCompleted: false,
      );
    } else {
      _currentChallengeState.value = null;
    }
  }

  Future<void> fetchChallengeHistories() async {
    _challengeHistoryStates.clear();
    _challengeHistoryStates.addAll(
      await _challengeHistoryRepository.readAllChallengeHistoryState(),
    );
  }
}
