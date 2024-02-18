import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:get/get.dart';

class RootViewModel extends GetxController {
  // Animation duration
  static const duration = Duration(milliseconds: 200);

  late final ChallengeHistoryRepository _challengeHistoryRepository;
  late final UserRepository _userRepository;

  // Platform And DateTime
  late final bool isAndroid;

  // Observable Variables
  late final RxBool _isSignIn;
  late Rx<DateTime> _currentAt;
  late final RxInt _selectedIndex;
  late final RxBool _isEnableGreyBarrier;

  bool get isSignIn => _isSignIn.value;
  DateTime get currentAt => _currentAt.value;

  late final Rx<EChallenge> _currentEChallenge;
  late final ChallengeHistoryState _challengeHistoryState;

  int get selectedIndex => _selectedIndex.value;
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  EChallenge get currentEChallenge => _currentEChallenge.value;
  ChallengeHistoryState get challengeHistoryState => _challengeHistoryState;

  @override
  void onInit() async {
    super.onInit();

    // Dependency Injection
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();
    _userRepository = Get.find<UserRepository>();

    // Platform And DateTime Initialize
    isAndroid = GetPlatform.isAndroid;
    _currentAt = DateTime.now().obs;
    _isSignIn = (FirebaseAuth.instance.currentUser != null).obs;

    // Observable Initialize
    _selectedIndex = 1.obs;
    _isEnableGreyBarrier = false.obs;

    _currentEChallenge = _userRepository.readCurrentChallenge().obs;

    _challengeHistoryState = await _challengeHistoryRepository
        .getCurrentChallengeState(_currentEChallenge.value);
  }

  void changeIndex(int index) async {
    _selectedIndex.value = index;
    _currentAt.value = DateTime.now();
  }

  void changeMicState() {
    _isEnableGreyBarrier.value = !_isEnableGreyBarrier.value;
  }

  void fetchSignInState() {
    _isSignIn.value = FirebaseAuth.instance.currentUser != null;
  }
}
