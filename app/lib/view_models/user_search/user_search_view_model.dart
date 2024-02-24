import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/repositories/follow_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:earth_and_i/view_models/follow/follow_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSearchViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final FollowRepository _followRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final TextEditingController searchController;

  late final RxBool _isSearching;
  late final RxString _searchWord;
  late final RxList<FollowState> _searchStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isSearching => _isSearching.value;
  String get searchWord => _searchWord.value;
  List<FollowState> get searchStates => _searchStates;

  @override
  void onInit() {
    super.onInit();
    // DI Fields
    _userRepository = Get.find<UserRepository>();
    _followRepository = Get.find<FollowRepository>();

    // Private Fields
    searchController = TextEditingController();

    _isSearching = false.obs;
    _searchWord = "".obs;
    _searchStates = <FollowState>[].obs;
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void changeWord(String value) {
    _searchWord.value = value;
  }

  void onPressReset() {
    _searchWord.value = "";
  }

  void onPressSearch() async {
    if (searchWord.isEmpty) {
      LogUtil.i("검색어를 입력해주세요.");
      return;
    }

    _isSearching.value = true;

    _searchStates.clear();
    _searchStates.addAll(await _userRepository.readUsers(searchWord));

    _isSearching.value = false;
  }

  void onPressedFollowButton({
    required int index,
  }) async {
    await _followRepository.updateFollowing(
      _searchStates[index].id,
      !_searchStates[index].isFollowing,
    );
    _searchStates[index] = _searchStates[index].copyWith(
      isFollowing: !_searchStates[index].isFollowing,
    );

    Get.find<FollowViewModel>().fetchFollowings(
      _searchStates[index],
      _searchStates[index].isFollowing,
    );
  }
}
