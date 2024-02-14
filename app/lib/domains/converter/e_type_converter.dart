import 'package:earth_and_i/domains/type/e_action.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';

abstract class ETypeConverter {
  /* ----------------------------------------------------- */
  /* ---------------------- EAction ---------------------- */
  /* ----------------------------------------------------- */

  /// Convert [EUserStatus] to [EAction].
  static List<EAction> userStatusToActions(EUserStatus status) {
    switch (status) {
      case EUserStatus.health:
        return [
          EAction.steps,
          EAction.stairs,
          EAction.meal,
        ];

      case EUserStatus.mental:
        return [
          EAction.data,
          EAction.sns,
          EAction.recycle,
        ];

      case EUserStatus.cash:
        return [
          EAction.standbyPower,
          EAction.waterUsage,
          EAction.optimalTemperature,
          EAction.tumbler,
          EAction.publicTransportation,
        ];

      default:
        throw Exception('Invalid status: $status');
    }
  }

  /// Convert [EAction] to [EUserStatus].
  static EUserStatus actionToUserStatus(EAction action) {
    switch (action) {
      case EAction.steps:
      case EAction.stairs:
      case EAction.meal:
        return EUserStatus.health;

      case EAction.data:
      case EAction.sns:
      case EAction.recycle:
        return EUserStatus.mental;

      case EAction.standbyPower:
      case EAction.waterUsage:
      case EAction.optimalTemperature:
      case EAction.tumbler:
      case EAction.publicTransportation:
        return EUserStatus.cash;

      default:
        throw Exception('Invalid action: $action');
    }
  }

  /* ----------------------------------------------------- */
  /* --------------------- EChallenge -------------------- */
  /* ----------------------------------------------------- */

  /// Convert [EUserStatus] to [EChallenge].
  static List<EChallenge> userStatusToChallenges(EUserStatus status) {
    switch (status) {
      case EUserStatus.health:
        return [];

      case EUserStatus.mental:
        return [
          EChallenge.deleteEmail,
          EChallenge.useEcoFriendlyProducts,
        ];

      case EUserStatus.cash:
        return [
          EChallenge.useColdWater,
        ];

      default:
        throw Exception('Invalid status: $status');
    }
  }

  /// Convert [EChallenge] to [EUserStatus].
  static EUserStatus challengeToUserStatus(EChallenge challenge) {
    switch (challenge) {
      case EChallenge.deleteEmail:
      case EChallenge.useEcoFriendlyProducts:
        return EUserStatus.mental;

      case EChallenge.useColdWater:
        return EUserStatus.cash;

      default:
        throw Exception('Invalid challenge: $challenge');
    }
  }
}
