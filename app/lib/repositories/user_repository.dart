import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/models/home/character_state.dart';
import 'package:earth_and_i/models/profile/daily_carbon_state.dart';
import 'package:earth_and_i/providers/user_local_provider.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  late final UserLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalStorageFactory.userDAO;
  }

  Future<void> load() async {
    await _localProvider.init();
  }

  double readTotalDeltaCO2() {
    return _localProvider.getTotalDeltaCO2();
  }

  String readNickname() {
    return _localProvider.getNickname();
  }

  EChallenge readCurrentChallenge() {
    return _localProvider.getCurrentChallenge();
  }

  DailyCarbonState readDailyCarbonState() {
    return DailyCarbonState(
      healthPositiveCnt: _localProvider.getHealthPositiveCnt(),
      healthNegativeCnt: _localProvider.getHealthNegativeCnt(),
      mentalPositiveCnt: _localProvider.getMentalPositiveCnt(),
      mentalNegativeCnt: _localProvider.getMentalNegativeCnt(),
      cashPositiveCnt: _localProvider.getCashPositiveCnt(),
      cashNegativeCnt: _localProvider.getCashNegativeCnt(),
    );
  }

  CharacterStatsState readCharacterStatsState() {
    return CharacterStatsState(
      isGoodEnvironment: _localProvider.getTotalDeltaCO2() <= 0,
      isGoodHealth: _localProvider.getHealthCondition(),
      isGoodMental: _localProvider.getMentalCondition(),
      isGoodCash: _localProvider.getCashCondition(),
    );
  }

  Future<double> updateTotalDeltaCO2(
    double changedDeltaCO2,
  ) async {
    double currentDeltaCO2 = _localProvider.getTotalDeltaCO2();
    await _localProvider.setTotalDeltaCO2(currentDeltaCO2 + changedDeltaCO2);

    DevOnLog.i(
        'After Update, Total Delta CO2: ${_localProvider.getTotalDeltaCO2()}');

    return _localProvider.getTotalDeltaCO2();
  }

  Future<void> updateUserInformationCount(
    EUserStatus userStatus,
    bool isPositive,
  ) async {
    Function getCount;
    switch (userStatus) {
      case EUserStatus.health:
        if (isPositive) {
          await _localProvider
              .setHealthPositiveCnt(_localProvider.getHealthPositiveCnt() + 1);
          getCount = _localProvider.getHealthPositiveCnt;
        } else {
          await _localProvider
              .setHealthNegativeCnt(_localProvider.getHealthNegativeCnt() + 1);
          getCount = _localProvider.getHealthNegativeCnt;
        }
      case EUserStatus.mental:
        if (isPositive) {
          await _localProvider
              .setMentalPositiveCnt(_localProvider.getMentalPositiveCnt() + 1);
          getCount = _localProvider.getMentalPositiveCnt;
        } else {
          await _localProvider
              .setMentalNegativeCnt(_localProvider.getMentalNegativeCnt() + 1);
          getCount = _localProvider.getMentalNegativeCnt;
        }
      case EUserStatus.cash:
        if (isPositive) {
          await _localProvider
              .setCashPositiveCnt(_localProvider.getCashPositiveCnt() + 1);
          getCount = _localProvider.getCashPositiveCnt;
        } else {
          await _localProvider
              .setCashNegativeCnt(_localProvider.getCashNegativeCnt() + 1);
          getCount = _localProvider.getCashNegativeCnt;
        }
      default:
        throw Exception('Invalid user status');
    }

    DevOnLog.i(
        'Update $userStatus ${isPositive ? 'Positive' : 'Negative'} Count: ${getCount()}');
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
      isGoodEnvironment: _localProvider.getTotalDeltaCO2() < 0,
      isGoodHealth: _localProvider.getHealthCondition(),
      isGoodMental: _localProvider.getMentalCondition(),
      isGoodCash: _localProvider.getCashCondition(),
    );
  }

  Future<EChallenge> updateCurrentChallenge(EChallenge challenge) async {
    await _localProvider.setCurrentChallenge(challenge);
    return _localProvider.getCurrentChallenge();
  }
}
