import 'package:earth_and_i/apps/factory/remote_storage_factory.dart';
import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/providers/follow/follow_provider.dart';
import 'package:earth_and_i/repositories/follow/follow_repository.dart';
import 'package:get/get.dart';

class FollowRepositoryImpl extends GetxService implements FollowRepository {
  late final FollowProvider _provider;

  @override
  void onInit() {
    super.onInit();

    _provider = RemoteStorageFactory.followProvider;
  }

  @override
  Future<int> readFollowingsCount() async {
    List<dynamic> followings = await _provider.getFollowings();

    return followings.length;
  }

  @override
  Future<int> readFollowersCount() async {
    List<dynamic> followers = await _provider.getFollowers();

    return followers.length;
  }

  @override
  Future<List<FollowState>> readFollowings() async {
    List<dynamic> followings = await _provider.getFollowings();

    return followings
        .map((following) => FollowState.fromJson(following))
        .toList();
  }

  @override
  Future<List<FollowState>> readFollowers() async {
    List<dynamic> followers = await _provider.getFollowers();

    return followers.map((follower) => FollowState.fromJson(follower)).toList();
  }

  @override
  Future<void> updateFollowing(String id, bool isCreated) {
    if (isCreated) {
      return _provider.postFollowing(id);
    } else {
      return _provider.deleteFollowing(id);
    }
  }
}
