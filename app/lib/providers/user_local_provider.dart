abstract class UserLocalProvider {
  Future<void> init();
  Future<void> deleteAll();

  String getId();
  String getNickname();
  int getHealthPositiveCnt();
  int getHealthNegativeCnt();
  int getCashPositiveCnt();
  int getCashNegativeCnt();
  int getMentalPositiveCnt();
  int getMentalNegativeCnt();
  double getTotalCarbonDiOxide();

  Future<void> setId(String id);
  Future<void> setNickname(String nickname);
  Future<void> setHealthPositiveCnt(int cnt);
  Future<void> setHealthNegativeCnt(int cnt);
  Future<void> setCashPositiveCnt(int cnt);
  Future<void> setCashNegativeCnt(int cnt);
  Future<void> setMentalPositiveCnt(int cnt);
  Future<void> setMentalNegativeCnt(int cnt);
  Future<void> setTotalCarbonDiOxide(double value);
}
