import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/repositories/follow_repository.dart';
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
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  void onPressedFollowingButton(int index) {
    _followingStates[index] = _followingStates[index].copyWith(
      isFollowing: !_followingStates[index].isFollowing,
    );
  }

  void onPressedFollowerButton(int index) {
    _followerStates[index] = _followerStates[index].copyWith(
      isFollowing: !_followerStates[index].isFollowing,
    );
  }
}
