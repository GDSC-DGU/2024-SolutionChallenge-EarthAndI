abstract class UserRemoteProvider {
  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */

  /* ------------------------------------------------------------ */
  /* -------------------------Getter----------------------------- */
  /* ------------------------------------------------------------ */
  // User Brief Information
  String getNickname();

  // User Detail Information
  double getTotalPositiveDeltaCO2();
  double getTotalNegativeDeltaCO2();

  // Character State
  bool getHealthCondition();
  bool getMentalCondition();
  bool getCashCondition();

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  // User Brief Information
  Future<void> setNickname(String nickname);

  // User Detail Information
  Future<void> setTotalPositiveDeltaCO2(double deltaCO2);
  Future<void> setTotalNegativeDeltaCO2(double deltaCO2);

  // Character State
  Future<void> setHealthCondition(bool isGood);
  Future<void> setMentalCondition(bool isGood);
  Future<void> setCashCondition(bool isGood);
}
