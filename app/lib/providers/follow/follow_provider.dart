abstract class FollowProvider {
  Future<List<dynamic>> getFollowings();
  Future<List<dynamic>> getFollowers();
  Future<List<dynamic>> getTopRankings();
  Future<List<dynamic>> getRankings();

  Future<void> postFollowing(String id);
  Future<void> deleteFollowing(String id);
}
