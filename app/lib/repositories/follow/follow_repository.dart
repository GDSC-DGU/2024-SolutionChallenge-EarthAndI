import 'package:earth_and_i/models/follow/follow_state.dart';

abstract class FollowRepository {
  Future<int> readFollowingsCount();
  Future<int> readFollowersCount();
  Future<List<FollowState>> readFollowings();
  Future<List<FollowState>> readFollowers();
  Future<void> updateFollowing(String id, bool isCreated);
}
