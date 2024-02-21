import 'package:earth_and_i/domains/type/e_challenge.dart';

abstract class UserLocalProvider {
  /* ------------------------------------------------------------ */
  /* -------------------------Getter----------------------------- */
  /* ------------------------------------------------------------ */
  // User Setting
  bool getAlarmActive();
  int getAlarmHour();
  int getAlarmMinute();

  // User Brief Information
  String getId();
  String getNickname();

  // User Detail Information
  double getTotalPositiveDeltaCO2();
  double getTotalNegativeDeltaCO2();

  // Character State
  bool getHealthCondition();
  bool getMentalCondition();
  bool getCashCondition();

  // Challenge State
  EChallenge getCurrentChallenge();

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  // User Setting
  Future<void> setAlarmActive(bool isActive);
  Future<void> setAlarmHour(int hour);
  Future<void> setAlarmMinute(int minute);

  // User Brief Information
  Future<void> setId(String id);
  Future<void> setNickname(String nickname);

  // User Detail Information
  Future<void> setTotalPositiveDeltaCO2(double deltaCO2);
  Future<void> setTotalNegativeDeltaCO2(double deltaCO2);

  // Character State
  Future<void> setHealthCondition(bool isGood);
  Future<void> setMentalCondition(bool isGood);
  Future<void> setCashCondition(bool isGood);

  // Challenge State
  Future<void> setCurrentChallenge(EChallenge challenge);
}
