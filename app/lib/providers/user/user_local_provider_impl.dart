import 'package:earth_and_i/domains/type/e_challenge.dart';
import 'package:earth_and_i/providers/user/user_local_provider.dart';
import 'package:get_storage/get_storage.dart';

class UserLocalProviderImpl implements UserLocalProvider {
  UserLocalProviderImpl({
    required GetStorage storage,
  }) : _storage = storage;

  final GetStorage _storage;

  /* ------------------------------------------------------------ */
  /* ------------------------ Initialize ------------------------ */
  /* ------------------------------------------------------------ */
  @override
  Future<void> onInit() async {
    await _storage.writeIfNull(UserDAOExtension.isFirstRun, true);
    await _storage.writeIfNull(UserDAOExtension.isSynced, false);
  }

  /// Initialize the user data.
  @override
  Future<void> onReady({
    required String? id,
    required String? nickname,
    required double? totalPositiveDeltaCO2,
    required double? totalNegativeDeltaCO2,
    required bool? healthCondition,
    required bool? mentalCondition,
    required bool? cashCondition,
  }) async {
    // User Setting
    await _storage.writeIfNull(UserDAOExtension.alarmActive, true);
    await _storage.writeIfNull(UserDAOExtension.alarmHour, 8);
    await _storage.writeIfNull(UserDAOExtension.alarmMinute, 0);

    // User Brief Information
    await _storage.writeIfNull(
      UserDAOExtension.id,
      id ?? 'GUEST',
    );
    await _storage.writeIfNull(
      UserDAOExtension.nickname,
      nickname ?? 'GUEST',
    );

    // User Detail Information
    await _storage.writeIfNull(
      UserDAOExtension.totalPositiveDeltaCO2,
      totalPositiveDeltaCO2 ?? 0.0,
    );
    await _storage.writeIfNull(
      UserDAOExtension.totalNegativeDeltaCO2,
      totalNegativeDeltaCO2 ?? 0.0,
    );

    // Character State
    await _storage.writeIfNull(
      UserDAOExtension.healthCondition,
      healthCondition ?? true,
    );
    await _storage.writeIfNull(
      UserDAOExtension.mentalCondition,
      mentalCondition ?? true,
    );
    await _storage.writeIfNull(
      UserDAOExtension.cashCondition,
      cashCondition ?? true,
    );

    await _storage.writeIfNull(UserDAOExtension.currentChallenge,
        EChallenge.useEcoFriendlyProducts.toString());
  }

  @override
  bool getFirstRun() {
    return _storage.read(UserDAOExtension.isFirstRun)!;
  }

  @override
  bool getSynced() {
    return _storage.read(UserDAOExtension.isSynced)!;
  }

  @override
  Future<void> setFirstRun(bool isFirstRun) async {
    await _storage.write(UserDAOExtension.isFirstRun, isFirstRun);
  }

  @override
  Future<void> setSynced(bool isSynced) async {
    await _storage.write(UserDAOExtension.isSynced, isSynced);
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Getter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Get the user's alarm active state.
  @override
  bool getAlarmActive() {
    return _storage.read(UserDAOExtension.alarmActive) ?? false;
  }

  /// Get the user's alarm hour.
  @override
  int getAlarmHour() {
    return _storage.read(UserDAOExtension.alarmHour) ?? 8;
  }

  /// Get the user's alarm minute.
  @override
  int getAlarmMinute() {
    return _storage.read(UserDAOExtension.alarmMinute) ?? 0;
  }

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

  /// Get the user's total positive delta CO2.
  @override
  double getTotalPositiveDeltaCO2() {
    return _storage.read(UserDAOExtension.totalPositiveDeltaCO2) ?? 0.0;
  }

  /// Get the user's total negative delta CO2.
  @override
  double getTotalNegativeDeltaCO2() {
    return _storage.read(UserDAOExtension.totalNegativeDeltaCO2) ?? 0.0;
  }

  @override
  bool getHealthCondition() {
    return _storage.read(UserDAOExtension.healthCondition) ?? true;
  }

  /// Get the user's mental condition.
  @override
  bool getMentalCondition() {
    return _storage.read(UserDAOExtension.mentalCondition) ?? true;
  }

  /// Get the user's cash condition.
  @override
  bool getCashCondition() {
    return _storage.read(UserDAOExtension.cashCondition) ?? true;
  }

  /// Get the user's current challenge.
  @override
  EChallenge? getCurrentChallenge() {
    String? challenge = _storage.read(UserDAOExtension.currentChallenge);

    if (challenge == null) {
      return null;
    }

    return EChallenge.fromName(challenge);
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Set the user's alarm active state.
  @override
  Future<void> setAlarmActive(bool isActive) async {
    await _storage.write(UserDAOExtension.alarmActive, isActive);
  }

  /// Set the user's alarm hour.
  @override
  Future<void> setAlarmHour(int hour) async {
    await _storage.write(UserDAOExtension.alarmHour, hour);
  }

  /// Set the user's alarm minute.
  @override
  Future<void> setAlarmMinute(int minute) async {
    await _storage.write(UserDAOExtension.alarmMinute, minute);
  }

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

  /// Set the user's total positive delta CO2.
  @override
  Future<void> setTotalPositiveDeltaCO2(double value) async {
    await _storage.write(UserDAOExtension.totalPositiveDeltaCO2, value);
  }

  /// Set the user's total negative delta CO2.
  @override
  Future<void> setTotalNegativeDeltaCO2(double value) async {
    await _storage.write(UserDAOExtension.totalNegativeDeltaCO2, value);
  }

  /// Set the user's health condition.
  @override
  Future<void> setHealthCondition(bool isGood) async {
    await _storage.write(UserDAOExtension.healthCondition, isGood);
  }

  /// Set the user's mental condition.
  @override
  Future<void> setMentalCondition(bool isGood) async {
    await _storage.write(UserDAOExtension.mentalCondition, isGood);
  }

  /// Set the user's cash condition.
  @override
  Future<void> setCashCondition(bool isGood) async {
    await _storage.write(UserDAOExtension.cashCondition, isGood);
  }

  /// Set the user's current challenge.
  @override
  Future<void> setCurrentChallenge(EChallenge? challenge) async {
    if (challenge == null) {
      _storage.remove(UserDAOExtension.currentChallenge);
    } else {
      await _storage.write(
          UserDAOExtension.currentChallenge, challenge.toString());
    }
  }
}

extension UserDAOExtension on UserLocalProviderImpl {
  // Initialize Setting
  static const String isFirstRun = 'is_first_run';
  static const String isSynced = 'is_synced';

  // User Setting
  static const String alarmActive = 'alarm_active';
  static const String alarmHour = 'alarm_hour';
  static const String alarmMinute = 'alarm_minute';

  // User Brief Information
  static const String id = 'id';
  static const String nickname = 'nickname';

  // User Detail Information
  static const String totalPositiveDeltaCO2 = 'total_positive_delta_co2';
  static const String totalNegativeDeltaCO2 = 'total_negative_delta_co2';

  // Character State
  static const String healthCondition = 'health_condition';
  static const String mentalCondition = 'mental_condition';
  static const String cashCondition = 'cash_condition';

  // Challenge State
  static const String currentChallenge = 'current_challenge';
}
