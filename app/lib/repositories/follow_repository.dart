import 'package:earth_and_i/apps/factory/remote_storage_factory.dart';
import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/providers/follow/follow_provider.dart';
import 'package:get/get.dart';

class FollowRepository extends GetxService {
  late final FollowProvider _provider;

  @override
  void onInit() {
    super.onInit();

    _provider = RemoteStorageFactory.followProvider;
  }

  Future<int> readFollowingsCount() async {
    List<dynamic> followings = await _provider.getFollowings();

    return followings.length;
  }

  Future<int> readFollowersCount() async {
    List<dynamic> followers = await _provider.getFollowers();

    return followers.length;
  }

  Future<List<FollowState>> readFollowings() async {
    List<dynamic> followings = await _provider.getFollowings();

    return followings
        .map((following) => FollowState.fromMap(following))
        .toList();
  }

  Future<List<FollowState>> readFollowers() async {
    List<dynamic> followers = await _provider.getFollowers();

    return followers.map((follower) => FollowState.fromMap(follower)).toList();
  }

  void deleteFollowing(String id) {
    // _provider.deleteFollowing(id);
  }
}
