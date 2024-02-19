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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  late final Rxn<XFile?> _image;
  late final Rx<EChallenge> _eChallenge;
  late final PageController _pageController;
  late final RxList<ChallengeHistoryState> _challengeHistoryState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  XFile? get image => _image.value;
  EChallenge get eChallenge => _eChallenge.value;
  PageController get pageController => _pageController;
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
    _challengeAuthenticationRepository =
        Get.find<ChallengeAuthenticationRepository>();
    _image = Rxn<XFile?>();
    _pageController = PageController(initialPage: 0);
    _eChallenge = _userRepository.readCurrentChallenge().obs;
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
      _pageController.animateToPage(2,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
    // 인증이 실패한 경우
    else {
      _pageController.animateToPage(3,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _image.close();
    _pageController.dispose();
  }
}
