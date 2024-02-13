import 'package:earth_and_i/domains/type/e_challenge.dart';

abstract class UserLocalProvider {
  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */
  Future<void> init();
  Future<void> deleteAll();

  /* ------------------------------------------------------------ */
  /* -------------------------Getter----------------------------- */
  /* ------------------------------------------------------------ */
  // User Information
  String getId();
  String getNickname();
  int getHealthPositiveCnt();
  int getHealthNegativeCnt();
  int getCashPositiveCnt();
  int getCashNegativeCnt();
  int getMentalPositiveCnt();
  int getMentalNegativeCnt();
  double getTotalCarbonDiOxide();

  // Character State
  bool getHealthCondition();
  bool getMentalCondition();
  bool getCashCondition();

  // Challenge State
  EChallenge getCurrentChallenge();

  /* ------------------------------------------------------------ */
  /* -------------------------- Getter -------------------------- */
  /* ------------------------------------------------------------ */
  // User Information
  Future<void> setId(String id);
  Future<void> setNickname(String nickname);
  Future<void> setHealthPositiveCnt(int cnt);
  Future<void> setHealthNegativeCnt(int cnt);
  Future<void> setCashPositiveCnt(int cnt);
  Future<void> setCashNegativeCnt(int cnt);
  Future<void> setMentalPositiveCnt(int cnt);
  Future<void> setMentalNegativeCnt(int cnt);
  Future<void> setTotalCarbonDiOxide(double value);

  // Character State
  Future<void> setHealthCondition(bool isGood);
  Future<void> setMentalCondition(bool isGood);
  Future<void> setCashCondition(bool isGood);

  // Challenge State
  Future<void> setCurrentChallenge(EChallenge challenge);
}
