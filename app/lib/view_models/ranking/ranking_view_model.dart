import 'package:earth_and_i/models/ranking/message_state.dart';
import 'package:earth_and_i/models/ranking/ranking_state.dart';
import 'package:earth_and_i/models/ranking/top_ranking_state.dart';
import 'package:earth_and_i/repositories/follow_repository.dart';
import 'package:earth_and_i/repositories/user_repository.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:get/get.dart';

class RankingViewModel extends GetxController {
  /* ------------------------------------------------------ */
  /* -------------------- DI Fields ----------------------- */
  /* ------------------------------------------------------ */
  late final UserRepository _userRepository;
  late final FollowRepository _followRepository;

  /* ------------------------------------------------------ */
  /* ----------------- Private Fields --------------------- */
  /* ------------------------------------------------------ */
  late final RxList<TopRankingState> _topRankingStates;
  late final RxList<RankingState> _rankingStates;
  late final Rx<MessageState> _messageState;

  /* ------------------------------------------------------ */
  /* ----------------- Public Fields ---------------------- */
  /* ------------------------------------------------------ */
  List<TopRankingState> get topRankingStates => _topRankingStates;
  List<RankingState> get rankingStates => _rankingStates;
  MessageState get messageState => _messageState.value;

  @override
  void onInit() {
    super.onInit();

    _userRepository = Get.find<UserRepository>();
    _followRepository = Get.find<FollowRepository>();

    _topRankingStates = List.generate(3, (_) => TopRankingState.empty()).obs;
    _rankingStates = [
      const RankingState(
        id: "ASD123ls",
        nickname: "HyungJoon",
        totalDeltaCO2: -1.392938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
      const RankingState(
        id: "gdtjjsfsf",
        nickname: "aserlsifjlsejflskdls",
        totalDeltaCO2: -1.292938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
      const RankingState(
        id: "aweggeads",
        nickname: "alsdkf",
        totalDeltaCO2: -1.192938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
      const RankingState(
        id: "asdfsd",
        nickname: "와 존나 잠와",
        totalDeltaCO2: -1.092938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
      const RankingState(
        id: "asgjkuy24",
        nickname: "호로로리ㅗㄹ농리ㅗ로로로",
        totalDeltaCO2: 1.392938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
      const RankingState(
        id: "asgjkuy24",
        nickname: "호로로리ㅗㄹ농리ㅗ로로로",
        totalDeltaCO2: 1.492938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
      const RankingState(
        id: "asgjkuy24",
        nickname: "호로로리ㅗㄹ농리ㅗ로로로",
        totalDeltaCO2: 88.592938,
        thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
      ),
    ].obs;
    _messageState = MessageState.empty().obs;

    // index 1은 Character가 있는 상태로 변경
    _topRankingStates[0] = const TopRankingState(
      id: "1",
      nickname: "HyungJoon",
      totalDeltaCO2: -21.392938,
      characterPath: "assets/images/analysis/1_1_1.svg",
      thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
    );
    _topRankingStates[1] = const TopRankingState(
      id: "1",
      nickname: "HyungJoonSon",
      totalDeltaCO2: -32.392938,
      characterPath: "assets/images/analysis/1_1_1.svg",
      thumbnailPath: "assets/images/thumbnail/1_1_1.svg",
    );
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
