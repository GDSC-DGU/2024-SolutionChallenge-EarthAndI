import 'package:earth_and_i/models/ranking/ranking_state.dart';
import 'package:earth_and_i/models/ranking/top_ranking_state.dart';

abstract class FriendRepository {
  Future<List<TopRankingState>> readTopRankings();
  Future<List<RankingState>> readRankings();
}
