import 'package:earth_and_i/models/ranking/message_state.dart';
import 'package:earth_and_i/models/ranking/ranking_state.dart';
import 'package:earth_and_i/models/ranking/top_ranking_state.dart';
import 'package:earth_and_i/repositories/friend_repository.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:get/get.dart';

class RankingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final FriendRepository _friendRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxBool _isLoadingTopRanking;
  late final RxBool _isLoadingRanking;
  late final RxList<TopRankingState> _topRankingStates;
  late final RxList<RankingState> _rankingStates;
  late final Rx<MessageState> _messageState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  bool get isLoadingTopRanking => _isLoadingTopRanking.value;
  bool get isLoadingRanking => _isLoadingRanking.value;
  List<TopRankingState> get topRankingStates => _topRankingStates;
  List<RankingState> get rankingStates => _rankingStates;
  MessageState get messageState => _messageState.value;

  @override
  void onInit() async {
    super.onInit();

    _friendRepository = Get.find<FriendRepository>();

    _isLoadingTopRanking = true.obs;
    _isLoadingRanking = true.obs;

    _topRankingStates = List.generate(3, (_) => TopRankingState.empty()).obs;
    _rankingStates = <RankingState>[].obs;
    _messageState = MessageState.empty().obs;
  }

  @override
  void onReady() {
    super.onReady();

    fetchTopRankingStates();
    fetchRankingStates();
  }

  void fetchTopRankingStates() async {
    _isLoadingTopRanking.value = true;
    _topRankingStates.value = await _friendRepository.readTopRankings();
    _isLoadingTopRanking.value = false;
  }

  void fetchRankingStates() async {
    _isLoadingRanking.value = true;
    _rankingStates.value = await _friendRepository.readRankings();
    _isLoadingRanking.value = false;
  }

  void clearMessageState() {
    _messageState.value = MessageState.empty();
  }

  void fetchMessageState(bool isTopRanking, int index) {
    if (isTopRanking) {
      _messageState.value = MessageState(
        id: _topRankingStates[index].id!,
        nickname: _topRankingStates[index].nickname,
        thumbnailPath: _topRankingStates[index].thumbnailPath,
      );
    } else {
      _messageState.value = MessageState(
        id: _rankingStates[index].id,
        nickname: _rankingStates[index].nickname,
        thumbnailPath: _rankingStates[index].thumbnailPath,
      );
    }
  }

  void fetchMessageInMessageState(String message) {
    _messageState.value = _messageState.value.copyWith(message: message);
  }

  void sendMessage() {
    LogUtil.i("send message: ${_messageState.value.message}");
  }
}
