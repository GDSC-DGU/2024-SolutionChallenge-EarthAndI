abstract class FollowProvider {
  Future<List<dynamic>> getFollowings();
  Future<List<dynamic>> getFollowers();

  Future<void> postFollowing(String id);
  Future<void> deleteFollowing(String id);
}
