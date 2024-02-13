import 'package:earth_and_i/providers/user_local_provider.dart';
import 'package:get_storage/get_storage.dart';

class UserDAO implements UserLocalProvider {
  UserDAO({
    required GetStorage storage,
  }) : _storage = storage;

  final GetStorage _storage;

  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */
  /// Initialize the user data.
  @override
  Future<void> init() async {
    await _storage.writeIfNull(UserDAOExtension.id, 'GUEST');
    await _storage.writeIfNull(UserDAOExtension.nickname, 'GUEST');
    await _storage.writeIfNull(UserDAOExtension.healthPositiveCnt, 0);
    await _storage.writeIfNull(UserDAOExtension.healthNegativeCnt, 0);
    await _storage.writeIfNull(UserDAOExtension.mentalPositiveCnt, 0);
    await _storage.writeIfNull(UserDAOExtension.mentalNegativeCnt, 0);
    await _storage.writeIfNull(UserDAOExtension.cashPositiveCnt, 0);
    await _storage.writeIfNull(UserDAOExtension.cashNegativeCnt, 0);
    await _storage.writeIfNull(UserDAOExtension.totalCarbonDiOxide, 0.0);
  }

  @override
  Future<void> deleteAll() async {
    await _storage.erase();
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Getter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Get the user's id.
  @override
  String getId() {
    return _storage.read(UserDAOExtension.id) ?? 'GUEST';
  }

  /// Get the user's nickname.
  @override
  String getNickname() {
    return _storage.read(UserDAOExtension.nickname) ?? 'GUEST';
  }

  /// Get the user's health positive count.
  @override
  int getHealthPositiveCnt() {
    return _storage.read(UserDAOExtension.healthPositiveCnt) ?? 0;
  }

  /// Get the user's health negative count.
  @override
  int getHealthNegativeCnt() {
    return _storage.read(UserDAOExtension.healthNegativeCnt) ?? 0;
  }

  /// Get the user's mental positive count.
  @override
  int getMentalPositiveCnt() {
    return _storage.read(UserDAOExtension.mentalPositiveCnt) ?? 0;
  }

  /// Get the user's mental negative count.
  @override
  int getMentalNegativeCnt() {
    return _storage.read(UserDAOExtension.mentalNegativeCnt) ?? 0;
  }

  /// Get the user's cache positive count.
  @override
  int getCashPositiveCnt() {
    return _storage.read(UserDAOExtension.cashPositiveCnt) ?? 0;
  }

  /// Get the user's cache negative count.
  @override
  int getCashNegativeCnt() {
    return _storage.read(UserDAOExtension.cashNegativeCnt) ?? 0;
  }

  /// Get the user's total carbon dioxide.
  @override
  double getTotalCarbonDiOxide() {
    return _storage.read(UserDAOExtension.totalCarbonDiOxide) ?? 0.0;
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Set the user's id.
  @override
  Future<void> setId(String id) async {
    await _storage.write(UserDAOExtension.id, id);
  }

  /// Set the user's nickname.
  @override
  Future<void> setNickname(String nickname) async {
    await _storage.write(UserDAOExtension.nickname, nickname);
  }

  /// Set the user's health positive count.
  @override
  Future<void> setHealthPositiveCnt(int cnt) async {
    await _storage.write(UserDAOExtension.healthPositiveCnt, cnt);
  }

  /// Set the user's health negative count.
  @override
  Future<void> setHealthNegativeCnt(int cnt) async {
    await _storage.write(UserDAOExtension.healthNegativeCnt, cnt);
  }

  /// Set the user's mental positive count.
  @override
  Future<void> setMentalPositiveCnt(int cnt) async {
    await _storage.write(UserDAOExtension.mentalPositiveCnt, cnt);
  }

  /// Set the user's mental negative count.
  @override
  Future<void> setMentalNegativeCnt(int cnt) async {
    await _storage.write(UserDAOExtension.mentalNegativeCnt, cnt);
  }

  /// Set the user's cache positive count.
  @override
  Future<void> setCashPositiveCnt(int cnt) async {
    await _storage.write(UserDAOExtension.cashPositiveCnt, cnt);
  }

  /// Set the user's cache negative count.
  @override
  Future<void> setCashNegativeCnt(int cnt) async {
    await _storage.write(UserDAOExtension.cashNegativeCnt, cnt);
  }

  /// Set the user's total carbon dioxide.
  @override
  Future<void> setTotalCarbonDiOxide(double value) async {
    await _storage.write(UserDAOExtension.totalCarbonDiOxide, value);
  }
}

extension UserDAOExtension on UserDAO {
  static const String id = 'id';
  static const String nickname = 'nickname';
  static const String healthPositiveCnt = 'health_positive_cnt';
  static const String healthNegativeCnt = 'health_negative_cnt';
  static const String cashPositiveCnt = 'cash_positive_cnt';
  static const String cashNegativeCnt = 'cash_negative_cnt';
  static const String mentalPositiveCnt = 'mental_positive_cnt';
  static const String mentalNegativeCnt = 'mental_negative_cnt';
  static const String totalCarbonDiOxide = 'total_carbon_dioxide';
}
