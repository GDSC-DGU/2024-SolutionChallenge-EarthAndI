import 'package:earth_and_i/apps/factory/remote_storage_factory.dart';
import 'package:earth_and_i/models/ranking/ranking_state.dart';
import 'package:earth_and_i/models/ranking/top_ranking_state.dart';
import 'package:earth_and_i/providers/follow/follow_provider.dart';
import 'package:earth_and_i/repositories/friend_repository.dart';
import 'package:get/get.dart';

class FriendRepositoryImpl extends GetxService implements FriendRepository {
  late final FollowProvider _provider;

  @override
  void onInit() {
    super.onInit();

    _provider = RemoteStorageFactory.followProvider;
  }

  @override
  Future<List<TopRankingState>> readTopRankings() async {
    List<dynamic> users = await _provider.getTopRankings();

    List<TopRankingState> topRankingStates =
        users.map((user) => TopRankingState.fromJson(user)).toList();

    while (topRankingStates.length < 3) {
      topRankingStates.add(TopRankingState.empty());
    }

    topRankingStates = [
      topRankingStates[1],
      topRankingStates[0],
      topRankingStates[2],
    ];

    return topRankingStates;
  }

  @override
  Future<List<RankingState>> readRankings() async {
    List<dynamic> users = await _provider.getRankings();

    return users.map((user) => RankingState.fromJson(user)).toList();
  }
}
