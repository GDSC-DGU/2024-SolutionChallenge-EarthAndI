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
  /// Get the user's id.
  @override
  Future<String> getId() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![UserRemoteProviderExtension.id]);
  }

  /// Get the user's nickname.
  @override
  Future<String> getNickname() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage
        .collection('users')
        .doc(uid)
        .get()
        .then((value) => value.data()![UserRemoteProviderExtension.nickname]);
  }

  /// Get the user's total positive delta CO2.
  @override
  Future<double> getTotalPositiveDeltaCO2() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage.collection('users').doc(uid).get().then((value) =>
        value.data()![UserRemoteProviderExtension.totalPositiveDeltaCO2]);
  }

  @override
  Future<double> getTotalNegativeDeltaCO2() {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).get().then((value) =>
        value.data()![UserRemoteProviderExtension.totalNegativeDeltaCO2]);
  }

  /// Get the user's health condition.
  @override
  Future<bool> getHealthCondition() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage.collection('users').doc(uid).get().then(
        (value) => value.data()![UserRemoteProviderExtension.healthCondition]);
  }

  @override
  Future<bool> getMentalCondition() {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).get().then(
        (value) => value.data()![UserRemoteProviderExtension.mentalCondition]);
  }

  /// Get the user's cash condition.
  @override
  Future<bool> getCashCondition() async {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return await _storage.collection('users').doc(uid).get().then(
        (value) => value.data()![UserRemoteProviderExtension.cashCondition]);
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Set the user's id.
  @override
  Future<void> setId(String id) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.id: id,
    });
  }

  /// Set the user's nickname.
  @override
  Future<void> setNickname(String nickname) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.nickname: nickname,
    });
  }

  /// Set the user's total positive delta CO2.
  @override
  Future<void> setTotalPositiveDeltaCO2(double deltaCO2) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.totalPositiveDeltaCO2: deltaCO2,
    });
  }

  /// Set the user's total negative delta CO2.
  @override
  Future<void> setTotalNegativeDeltaCO2(double deltaCO2) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.totalNegativeDeltaCO2: deltaCO2,
    });
  }

  /// Set the user's health condition.
  @override
  Future<void> setHealthCondition(bool isGood) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.healthCondition: isGood,
    });
  }

  /// Set the user's mental condition.
  @override
  Future<void> setMentalCondition(bool isGood) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.mentalCondition: isGood,
    });
  }

  /// Set the user's cash condition.
  @override
  Future<void> setCashCondition(bool isGood) {
    String uid = SecurityUtil.auth.currentUser!.uid;

    return _storage.collection('users').doc(uid).set({
      UserRemoteProviderExtension.cashCondition: isGood,
    });
  }
}

extension UserRemoteProviderExtension on UserRemoteProvider {
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
