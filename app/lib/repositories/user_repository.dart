import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/apps/factory/remote_storage_factory.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/profile/user_brief_state.dart';
import 'package:earth_and_i/models/setting/alarm_state.dart';
import 'package:earth_and_i/models/home/character_state.dart';
import 'package:earth_and_i/providers/user/user_local_provider.dart';
import 'package:earth_and_i/providers/user/user_remote_provider.dart';
import 'package:earth_and_i/utilities/functions/local_notification_util.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  late final UserLocalProvider _localProvider;
  late final UserRemoteProvider _remoteProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalStorageFactory.userLocalProvider;
    _remoteProvider = RemoteStorageFactory.userRemoteProvider;
  }

  /* ------------------------------------------------------------ */
  /* --------------------------- Read --------------------------- */
  /* ------------------------------------------------------------ */
  double readTotalPositiveDeltaCO2() {
    return _localProvider.getTotalPositiveDeltaCO2();
  }

  double readTotalNegativeDeltaCO2() {
    return _localProvider.getTotalNegativeDeltaCO2();
  }

  UserBriefState readUserBriefState() {
    return UserBriefState(
      id: _localProvider.getId(),
      nickname: _localProvider.getNickname(),
    );
  }

  NotificationState readNotificationState() {
    return NotificationState(
      isActive: _localProvider.getNotificationActive(),
      hour: _localProvider.getNotificationHour(),
      minute: _localProvider.getNotificationMinute(),
    );
  }

  EChallenge? readCurrentChallenge() {
    return _localProvider.getCurrentChallenge();
  }

  CharacterStatsState readCharacterStatsState() {
    return CharacterStatsState(
      isEnvironmentCondition: _localProvider.getTotalPositiveDeltaCO2().abs() >=
          _localProvider.getTotalNegativeDeltaCO2(),
      isHealthCondition: _localProvider.getHealthCondition(),
      isMentalCondition: _localProvider.getMentalCondition(),
      isCashCondition: _localProvider.getCashCondition(),
    );
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Update -------------------------- */
  /* ------------------------------------------------------------ */
  Future<void> updateUserNotificationSetting({
    bool? isActive,
    int? hour,
    int? minute,
  }) async {
    // Local
    if (isActive != null) {
      await _localProvider.setNotificationActive(isActive);
    }
    if (hour != null && minute != null) {
      await _localProvider.setNotificationHour(hour);
      await _localProvider.setNotificationMinute(minute);
    }

    // Remote
    if (SecurityUtil.isSignin && isActive != null) {
      await _remoteProvider.setNotificationActive(
        _localProvider.getNotificationActive(),
      );
    }

    await LocalNotificationUtil.setScheduleNotification(
      isActive: _localProvider.getNotificationActive(),
      hour: _localProvider.getNotificationHour(),
      minute: _localProvider.getNotificationMinute(),
    );
  }

  Future<void> updateUserBriefInformation({
    required String id,
    required String nickname,
  }) async {
    String nicknameWithoutSpace = nickname.replaceAll(' ', '');
    await _localProvider.setId(id);

    // 공백을 없애고 최대 15자로 제한
    await _localProvider.setNickname(
      nicknameWithoutSpace
        ..substring(
          0,
          nicknameWithoutSpace.length > 15 ? 15 : nicknameWithoutSpace.length,
        ),
    );
  }

  Future<void> updateTotalPositiveDeltaCO2(
    double changedDeltaCO2,
  ) async {
    // Local
    await _localProvider.setTotalPositiveDeltaCO2(
      _localProvider.getTotalPositiveDeltaCO2() + changedDeltaCO2,
    );

    // Remote
    if (SecurityUtil.isSignin) {
      await _remoteProvider.setTotalPositiveDeltaCO2(
        _localProvider.getTotalPositiveDeltaCO2(),
      );
    }
  }

  Future<void> updateTotalNegativeDeltaCO2(
    double changedDeltaCO2,
  ) async {
    // Local
    await _localProvider.setTotalNegativeDeltaCO2(
      _localProvider.getTotalNegativeDeltaCO2() + changedDeltaCO2,
    );

    // Remote
    if (SecurityUtil.isSignin) {
      await _remoteProvider.setTotalNegativeDeltaCO2(
        _localProvider.getTotalNegativeDeltaCO2(),
      );
    }
  }

  Future<void> updateCharacterStats(
    EUserStatus? userStatus,
    bool? isGood,
  ) async {
    // Local
    if (userStatus != null) {
      switch (userStatus) {
        case EUserStatus.health:
          await _localProvider.setHealthCondition(isGood!);
        case EUserStatus.mental:
          await _localProvider.setMentalCondition(isGood!);
        case EUserStatus.cash:
          await _localProvider.setCashCondition(isGood!);
        default:
          throw Exception('Invalid user status');
      }
    }

    // Remote
    if (SecurityUtil.isSignin) {
      if (userStatus != null) {
        switch (userStatus) {
          case EUserStatus.health:
            await _remoteProvider.setHealthCondition(isGood!);
          case EUserStatus.mental:
            await _remoteProvider.setMentalCondition(isGood!);
          case EUserStatus.cash:
            await _remoteProvider.setCashCondition(isGood!);
          default:
            throw Exception('Invalid user status');
        }
      }
    }
  }

  Future<void> updateCurrentChallenge(EChallenge? challenge) async {
    await _localProvider.setCurrentChallenge(challenge);
  }
}
