import 'package:earth_and_i/domains/type/e_challenge.dart';

abstract class UserLocalProvider {
  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */
  Future<void> onInit();
  Future<void> onReady();
  Future<void> dispose();

  bool getFirstRun();
  bool getSynced();

  Future<void> setFirstRun(bool isFirstRun);
  Future<void> setSynced(bool isSynced);

  /* ------------------------------------------------------------ */
  /* -------------------------Getter----------------------------- */
  /* ------------------------------------------------------------ */
  // System Information
  bool getNotificationActive();
  int getNotificationHour();
  int getNotificationMinute();

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
  EChallenge? getCurrentChallenge();

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  // System Information
  Future<void> setNotificationActive(bool isActive);
  Future<void> setNotificationHour(int hour);
  Future<void> setNotificationMinute(int minute);

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
  Future<void> setCurrentChallenge(EChallenge? challenge);
}
