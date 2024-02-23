import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/profile/user_brief_state.dart';
import 'package:earth_and_i/models/setting/alarm_state.dart';
import 'package:earth_and_i/models/home/character_state.dart';
import 'package:earth_and_i/providers/user/user_local_provider.dart';
import 'package:earth_and_i/utilities/functions/local_notification_util.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  late final UserLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalStorageFactory.userDAO;
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

  AlarmState readAlarmState() {
    return AlarmState(
      isActive: _localProvider.getAlarmActive(),
      hour: _localProvider.getAlarmHour(),
      minute: _localProvider.getAlarmMinute(),
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
  Future<AlarmState> updateUserSetting({
    bool? isActive,
    int? hour,
    int? minute,
  }) async {
    if (isActive != null) {
      await _localProvider.setAlarmActive(isActive);
    }
    if (hour != null && minute != null) {
      await _localProvider.setAlarmHour(hour);
      await _localProvider.setAlarmMinute(minute);
    }

    await LocalNotificationUtil.setScheduleNotification(
      isActive: _localProvider.getAlarmActive(),
      hour: _localProvider.getAlarmHour(),
      minute: _localProvider.getAlarmMinute(),
    );

    return AlarmState(
      isActive: _localProvider.getAlarmActive(),
      hour: _localProvider.getAlarmHour(),
      minute: _localProvider.getAlarmMinute(),
    );
  }

  Future<void> updateUserBriefInformation({
    required String id,
    required String nickname,
  }) async {
    await _localProvider.setId(id);
    await _localProvider.setNickname(nickname);
  }

  Future<double> updateTotalPositiveDeltaCO2(
    double changedDeltaCO2,
  ) async {
    await _localProvider.setTotalPositiveDeltaCO2(
        _localProvider.getTotalPositiveDeltaCO2() + changedDeltaCO2);

    return _localProvider.getTotalPositiveDeltaCO2();
  }

  Future<double> updateTotalNegativeDeltaCO2(
    double changedDeltaCO2,
  ) async {
    await _localProvider.setTotalNegativeDeltaCO2(
        _localProvider.getTotalNegativeDeltaCO2() + changedDeltaCO2);

    return _localProvider.getTotalNegativeDeltaCO2();
  }

  Future<CharacterStatsState> updateCharacterStats(
    EUserStatus? userStatus,
    bool? isGood,
  ) async {
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

    return CharacterStatsState(
      isEnvironmentCondition: _localProvider.getTotalPositiveDeltaCO2().abs() >=
          _localProvider.getTotalNegativeDeltaCO2(),
      isHealthCondition: _localProvider.getHealthCondition(),
      isMentalCondition: _localProvider.getMentalCondition(),
      isCashCondition: _localProvider.getCashCondition(),
    );
  }

  Future<EChallenge?> updateCurrentChallenge(EChallenge? challenge) async {
    await _localProvider.setCurrentChallenge(challenge);
    return _localProvider.getCurrentChallenge();
  }
}
