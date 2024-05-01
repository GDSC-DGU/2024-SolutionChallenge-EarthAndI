import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/models/load_map/challenge_history_state.dart';

List<ChallengeHistoryState> getComingSoonChallengeStates() {
  return [
    ChallengeHistoryState(
      type: EChallenge.useEcoFriendlyProducts,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.deleteEmail,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.eatVegetarian,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.useColdWater,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.usePublicTransport,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.useReusableContainer,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.unplugDevices,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.rideBike,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.buyLocalProducts,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.recycle,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.useLED,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.useEnergyEfficiency,
      isCompleted: false,
    ),
    ChallengeHistoryState(
      type: EChallenge.climateControl,
      isCompleted: false,
    )
  ];
}
