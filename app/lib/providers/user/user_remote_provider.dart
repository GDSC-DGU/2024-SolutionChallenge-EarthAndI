abstract class UserRemoteProvider {
  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */

  /* ------------------------------------------------------------ */
  /* -------------------------Getter----------------------------- */
  /* ------------------------------------------------------------ */
  // User Brief Information
  Future<String> getId();
  Future<String> getNickname();

  // User Detail Information
  Future<double> getTotalPositiveDeltaCO2();
  Future<double> getTotalNegativeDeltaCO2();

  // Character State
  Future<bool> getHealthCondition();
  Future<bool> getMentalCondition();
  Future<bool> getCashCondition();

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
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
}
