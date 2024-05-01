import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/repositories/follow/follow_repository.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:earth_and_i/view_models/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowViewModel extends GetxController
    with GetSingleTickerProviderStateMixin {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final FollowRepository _followRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final TabController _tabController;

  late final RxList<FollowState> _followingStates;
  late final RxList<FollowState> _followerStates;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  TabController get tabController => _tabController;

  List<FollowState> get followingStates => _followingStates;
  List<FollowState> get followerStates => _followerStates;

  @override
  void onInit() async {
    super.onInit();
    // DI Fields
    _followRepository = Get.find<FollowRepository>();

    // Private Fields
    _tabController = TabController(
        length: 2,
        vsync: this,
        initialIndex: Get.arguments["friendTabType"] == "following" ? 0 : 1);

    _followingStates = <FollowState>[].obs;
    _followerStates = <FollowState>[].obs;

    _followingStates.addAll(await _followRepository.readFollowings());
    _followerStates.addAll(await _followRepository.readFollowers());
  }

  @override
  void onClose() {
    super.onClose();
    Get.find<ProfileViewModel>().fetchUserBriefState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void onPressedFollowButton({
    required bool isFollowingTab,
    required int index,
  }) async {
    // 팔로잉 탭과 팔로워 탭을 구분하여 처리
    if (isFollowingTab) {
      await _followRepository.updateFollowing(
        _followingStates[index].id,
        !_followingStates[index].isFollowing,
      );
      _followingStates[index] = _followingStates[index].copyWith(
        isFollowing: !_followingStates[index].isFollowing,
      );

      final followerIndex = _followerStates.indexWhere(
        (element) => element.id == _followingStates[index].id,
      );

      if (followerIndex != -1) {
        _followerStates[followerIndex] =
            _followerStates[followerIndex].copyWith(
          isFollowing: !_followerStates[followerIndex].isFollowing,
        );
      }
    } else {
      await _followRepository.updateFollowing(
        _followerStates[index].id,
        !_followerStates[index].isFollowing,
      );
      _followerStates[index] = _followerStates[index].copyWith(
        isFollowing: !_followerStates[index].isFollowing,
      );

      final followingIndex = _followingStates.indexWhere(
        (element) => element.id == _followerStates[index].id,
      );

      if (followingIndex != -1) {
        _followingStates[followingIndex] =
            _followingStates[followingIndex].copyWith(
          isFollowing: !_followingStates[followingIndex].isFollowing,
        );
      } else {
        _followingStates.add(_followerStates[index]);
      }
    }
  }

  void onPressedFollowerButton(int index) {
    _followerStates[index] = _followerStates[index].copyWith(
      isFollowing: !_followerStates[index].isFollowing,
    );
  }

  void fetchFollowings(FollowState followState, bool isFollowing) async {
    LogUtil.i(
        "fetchFollowings, state: $followState, isFollowing: $isFollowing");
    if (isFollowing) {
      _followingStates.add(followState);
    } else {
      _followingStates.remove(followState);
    }

    final followerIndex = _followerStates.indexWhere(
      (element) => element.id == followState.id,
    );

    if (followerIndex != -1) {
      _followerStates[followerIndex] = _followerStates[followerIndex].copyWith(
        isFollowing: isFollowing,
      );
    }
  }
}
