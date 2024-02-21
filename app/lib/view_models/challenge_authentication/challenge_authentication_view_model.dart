import 'dart:convert';
import 'dart:io';

import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/converter/e_type_converter.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';
import 'package:earth_and_i/repositories/challenge_authentication_repository.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:earth_and_i/view_models/root/root_view_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rive/rive.dart';

class ChallengeAuthenticationViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final ChallengeHistoryRepository _challengeHistoryRepository;
  late final ChallengeAuthenticationRepository
      _challengeAuthenticationRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final PageController _pageController;
  late final RiveAnimationController _animationController;

  late final Rxn<XFile?> _image;
  late final Rx<EChallenge> _eChallenge;
  late final RxInt _currentPageIndex;
  late final RxBool _isAnalysisResult;
  late final RxList<ChallengeHistoryState> _challengeHistoryState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PageController get pageController => _pageController;
  RiveAnimationController get animationController => _animationController;

  XFile? get image => _image.value;
  EChallenge get eChallenge => _eChallenge.value;
  int get currentPageIndex => _currentPageIndex.value;
  bool get isAnalysisResult => _isAnalysisResult.value;
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
    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();
    _challengeAuthenticationRepository =
        Get.find<ChallengeAuthenticationRepository>();

    // Private Fields
    _pageController = PageController(initialPage: 0);
    _animationController = SimpleAnimation("LoadingAnimation", autoplay: true);

    _image = Rxn<XFile?>();
    _eChallenge = _userRepository.readCurrentChallenge().obs;
    _currentPageIndex = 0.obs;
    _isAnalysisResult = false.obs;
    _challengeHistoryState = RxList<ChallengeHistoryState>([]);

    _challengeHistoryState.addAll(
      await _challengeHistoryRepository
          .readAllChallengeHistoryState(_eChallenge.value),
    );
  }

  void getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image.value = image;
    }
  }

  void resetImageAndPage() {
    _image.value = null;
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  String convertImageToBase64(XFile image) {
    // Convert image to base64
    final bytes = File(image.path).readAsBytesSync();

    return base64Encode(bytes);
  }

  Future<void> authChallenge(XFile image) async {
    // Move to the loading page
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _currentPageIndex.value = 1;

    String base64Image = convertImageToBase64(image);
    Map<String, dynamic> result = await _challengeAuthenticationRepository
        .challengeAuthAction(_eChallenge.value, base64Image);
    DevOnLog.d(result);

    // 만약 result["res"] 가 True면 DB 저장하고 인증 성공 페이지
    if (result["res"] == "True") {
      await _challengeHistoryRepository
          .updateCompletedChallenge(ChallengeHistoryCompanion.insert(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        userStatus: ETypeConverter.challengeToUserStatus(eChallenge),
        type: _eChallenge.value,
        analysisContent: "",
        changeCapacity: 0,
      ));

      await _userRepository
          .updateCurrentChallenge(EChallenge.values[eChallenge.index + 1]);
      _isAnalysisResult.value = true;
      Get.find<LoadMapViewModel>().fetchCurrentEChallenge(
          EChallenge.values[_eChallenge.value.index + 1]);
      Get.find<RootViewModel>().fetchCurrentEChallenge(
          EChallenge.values[_eChallenge.value.index + 1]);
    }
    // 인증이 실패한 경우
    else {
      _isAnalysisResult.value = false;
    }

    // Move to the result page
    _pageController.animateToPage(2,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _currentPageIndex.value = 2;
  }

  @override
  void dispose() {
    super.dispose();
    _image.close();
    _pageController.dispose();
  }
}
