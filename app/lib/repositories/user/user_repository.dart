import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/follow/follow_state.dart';
import 'package:earth_and_i/models/home/character_state.dart';
import 'package:earth_and_i/models/profile/user_brief_state.dart';
import 'package:earth_and_i/models/setting/alarm_state.dart';

abstract class UserRepository {
  /* ------------------------------------------------------------ */
  /* --------------------------- Read --------------------------- */
  /* ------------------------------------------------------------ */
  double readTotalPositiveDeltaCO2();
  double readTotalNegativeDeltaCO2();
  UserBriefState readUserBriefState();
  NotificationState readNotificationState();
  EChallenge? readCurrentChallenge();
  CharacterStatsState readCharacterStatsState();

  /* ------------------------------------------------------------ */
  /* -------------------------- Update -------------------------- */
  /* ------------------------------------------------------------ */
  Future<void> updateUserNotificationSetting({
    bool? isActive,
    int? hour,
    int? minute,
  });

  Future<void> updateUserInformation({
    required bool isSignIn,
  });

  Future<void> updateTotalPositiveDeltaCO2(
    double changedDeltaCO2,
  );

  Future<void> updateTotalNegativeDeltaCO2(
    double changedDeltaCO2,
  );

  Future<void> updateCharacterStats(
    EUserStatus? userStatus,
    bool? isGood,
  );

  Future<void> updateCurrentChallenge(EChallenge? challenge);

  double _calculateSavedTotalDeltaCO2(
    double localDeltaCO2,
    double remoteDeltaCO2,
  );

  Future<List<FollowState>> readUsers(String searchWord);

  Future<void> deleteUser();
}
