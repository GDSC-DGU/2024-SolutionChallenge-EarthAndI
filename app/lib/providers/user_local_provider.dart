import 'package:earth_and_i/domains/type/e_challenge.dart';

abstract class UserLocalProvider {
  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */
  // 초기 유저인지 확인하는 함수
  bool get isInitialized;

  Future<void> init({required String id, required String nickname});
  Future<void> deleteAll();

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
  int getHealthPositiveCnt();
  int getHealthNegativeCnt();
  int getCashPositiveCnt();
  int getCashNegativeCnt();
  int getMentalPositiveCnt();
  int getMentalNegativeCnt();
  double getTotalDeltaCO2();

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
  Future<void> setHealthPositiveCnt(int cnt);
  Future<void> setHealthNegativeCnt(int cnt);
  Future<void> setCashPositiveCnt(int cnt);
  Future<void> setCashNegativeCnt(int cnt);
  Future<void> setMentalPositiveCnt(int cnt);
  Future<void> setMentalNegativeCnt(int cnt);
  Future<void> setTotalDeltaCO2(double value);

  // Character State
  Future<void> setHealthCondition(bool isGood);
  Future<void> setMentalCondition(bool isGood);
  Future<void> setCashCondition(bool isGood);

  // Challenge State
  Future<void> setCurrentChallenge(EChallenge challenge);
}
