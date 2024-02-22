import 'dart:convert';
import 'dart:io';

import 'package:earth_and_i/apps/database/local_database.dart';
import 'package:earth_and_i/domains/converter/e_type_converter.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/repositories/analysis_repository.dart';
import 'package:earth_and_i/repositories/challenge_history_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
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
  late final AnalysisRepository _analysisRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final PageController _pageController;
  late final RiveAnimationController _animationController;

  late final RxInt _currentPageIndex;
  late final Rxn<XFile?> _image;
  late final Rx<EChallenge> _eChallenge;
  late final RxnBool _isAnalysisResult;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  PageController get pageController => _pageController;
  RiveAnimationController get animationController => _animationController;

  XFile? get image => _image.value;
  EChallenge get eChallenge => _eChallenge.value;
  int get currentPageIndex => _currentPageIndex.value;
  bool? get isAnalysisResult => _isAnalysisResult.value;

  @override
  void onInit() async {
    super.onInit();
    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _challengeHistoryRepository = Get.find<ChallengeHistoryRepository>();
    _analysisRepository = Get.find<AnalysisRepository>();

    // Private Fields
    _pageController = PageController(initialPage: 0);
    _animationController = SimpleAnimation("LoadingAnimation", autoplay: true);

    _image = Rxn<XFile?>();
    _eChallenge = _userRepository.readCurrentChallenge().obs;
    _currentPageIndex = 0.obs;
    _isAnalysisResult = RxnBool();
  }

  @override
  void dispose() {
    super.dispose();
    _image.close();
    _pageController.dispose();
  }

  void getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      _image.value = image;
    }
  }

  /// Authentication Challenge
  void authenticationChallenge() async {
    // Move to the loading page
    _moveToPage(1);
    await Future.delayed(const Duration(milliseconds: 1));

    // Analysis the image By Server Communication
    // When Exception occurs, Move to the result page(_isAnalysisResult.value is not changed)
    final Map<String, dynamic> result;

    try {
      String base64Image = base64Encode(
        File(_image.value!.path).readAsBytesSync(),
      );
      result = await _analysisRepository.analysisChallenge(
          _eChallenge.value, base64Image);
    } catch (e) {
      _moveToPage(2);
      return;
    }

    // Update the challenge history, User's Current Challenge
    if (result["res"]) {
      // Update the challenge history
      await _challengeHistoryRepository.updateCompletedChallenge(
        ChallengeHistoryCompanion.insert(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          userStatus: ETypeConverter.challengeToUserStatus(eChallenge),
          type: _eChallenge.value,
          analysisContent: "",
          changeCapacity: 0,
        ),
      );

      // Update the user's current challenge
      await _userRepository
          .updateCurrentChallenge(EChallenge.values[eChallenge.index + 1]);

      // Fetch Data
      Get.find<LoadMapViewModel>().fetchCurrentEChallenge(
          EChallenge.values[_eChallenge.value.index + 1]);
      Get.find<RootViewModel>().fetchCurrentEChallenge(
          EChallenge.values[_eChallenge.value.index + 1]);
    }

    // Set the result And Move to the result page
    _isAnalysisResult.value = result["res"];
    _moveToPage(2);
  }

  /// Move to the page
  void _moveToPage(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
    _currentPageIndex.value = index;
  }
}
