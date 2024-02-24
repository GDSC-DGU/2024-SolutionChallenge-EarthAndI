import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_and_i/providers/user/user_remote_provider.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';

class UserRemoteProviderImpl implements UserRemoteProvider {
  const UserRemoteProviderImpl({
    required FirebaseFirestore storage,
  }) : _storage = storage;

  final FirebaseFirestore _storage;

  /* ------------------------------------------------------------ */
  /* -------------------------- Getter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Get the user's notification active.
  @override
  Future<bool> getNotificationActive() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.isNotificationActive]);
  }

  /// Get the user's id.
  @override
  Future<String> getId() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.id]);
  }

  /// Get the user's nickname.
  @override
  Future<String> getNickname() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.nickname]);
  }

  /// Get the user's total positive delta CO2.
  @override
  Future<double> getTotalPositiveDeltaCO2() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    try {
      return await _storage.collection('users').doc(uid).get().then((value) =>
          double.parse(
              value.data()![URPExtension.totalPositiveDeltaCO2].toString()));
    } catch (e) {
      return 0.0;
    }
  }

  @override
  Future<double> getTotalNegativeDeltaCO2() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    try {
      Map<String, dynamic> data =
          (await _storage.collection('users').doc(uid).get()).data()!;

      return double.parse(data[URPExtension.totalNegativeDeltaCO2].toString());
    } catch (e) {
      return 0.0;
    }
  }

  /// Get the user's health condition.
  @override
  Future<bool> getHealthCondition() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    try {
      Map<String, dynamic> data =
          (await _storage.collection('users').doc(uid).get()).data()!;

      return data[URPExtension.healthCondition];
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> getMentalCondition() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.mentalCondition]);
  }

  /// Get the user's cash condition.
  @override
  Future<bool> getCashCondition() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![URPExtension.cashCondition]);
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Set the user's notification active.
  @override
  Future<void> setNotificationActive(bool isActive) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.isNotificationActive: isActive,
    });
  }

  /// Set the user's device token.
  @override
  Future<void> setDeviceToken(String token) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.deviceToken: token,
    });
  }

  /// Set the user's id.
  @override
  Future<void> setId(String id) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.id: id,
    });
  }

  /// Set the user's nickname.
  @override
  Future<void> setNickname(String nickname) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.nickname: nickname,
    });
  }

  /// Set the user's total positive delta CO2.
  @override
  Future<void> setTotalPositiveDeltaCO2(double deltaCO2) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.totalPositiveDeltaCO2: deltaCO2,
    });
  }

  /// Set the user's total negative delta CO2.
  @override
  Future<void> setTotalNegativeDeltaCO2(double deltaCO2) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.totalNegativeDeltaCO2: deltaCO2,
    });
  }

  /// Set the user's health condition.
  @override
  Future<void> setHealthCondition(bool isGood) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.healthCondition: isGood,
    });
  }

  /// Set the user's mental condition.
  @override
  Future<void> setMentalCondition(bool isGood) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.mentalCondition: isGood,
    });
  }

  /// Set the user's cash condition.
  @override
  Future<void> setCashCondition(bool isGood) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).update({
      URPExtension.cashCondition: isGood,
    });
  }

  /* ------------------------------------------------------------ */
  /* --------------------------- Read --------------------------- */
  /* ------------------------------------------------------------ */
  @override
  Future<List<dynamic>> getUsers(String searchWord) async {
    List<dynamic> result = await _storage
        .collection('users')
        .where('nickname', isGreaterThanOrEqualTo: searchWord)
        .where('nickname', isLessThan: '${searchWord}z')
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());

    String uid = SecurityUtil.auth.currentUser!.uid;
    return result.where((element) => element['id'] != uid).toList();
  }
}

extension URPExtension on UserRemoteProvider {
  // System Information
  static const String isNotificationActive = 'is_notification_active';
  static const String deviceToken = 'device_token';

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
}
