import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_and_i/providers/user/user_remote_provider.dart';

class UserRemoteProviderImpl implements UserRemoteProvider {
  const UserRemoteProviderImpl({
    required FirebaseFirestore storage,
  }) : _storage = storage;

  final FirebaseFirestore _storage;

  /* ------------------------------------------------------------ */
  /* -------------------------- Getter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Get the user's nickname.
  @override
  String getNickname() {
    // TODO: implement getNickname
    throw UnimplementedError();
  }

  /// Get the user's total positive delta CO2.
  @override
  double getTotalPositiveDeltaCO2() {
    // TODO: implement getTotalPositiveDeltaCO2
    throw UnimplementedError();
  }

  @override
  double getTotalNegativeDeltaCO2() {
    // TODO: implement getTotalNegativeDeltaCO2
    throw UnimplementedError();
  }

  /// Get the user's health condition.
  @override
  bool getHealthCondition() {
    // TODO: implement getHealthCondition
    throw UnimplementedError();
  }

  @override
  bool getMentalCondition() {
    // TODO: implement getMentalCondition
    throw UnimplementedError();
  }

  /// Get the user's cash condition.
  @override
  bool getCashCondition() {
    // TODO: implement getCashCondition
    throw UnimplementedError();
  }

  /* ------------------------------------------------------------ */
  /* -------------------------- Setter -------------------------- */
  /* ------------------------------------------------------------ */
  /// Set the user's nickname.
  @override
  Future<void> setNickname(String nickname) {
    // TODO: implement setNickname
    throw UnimplementedError();
  }

  /// Set the user's total positive delta CO2.
  @override
  Future<void> setTotalPositiveDeltaCO2(double deltaCO2) {
    // TODO: implement setTotalPositiveDeltaCO2
    throw UnimplementedError();
  }

  /// Set the user's total negative delta CO2.
  @override
  Future<void> setTotalNegativeDeltaCO2(double deltaCO2) {
    // TODO: implement setTotalNegativeDeltaCO2
    throw UnimplementedError();
  }

  /// Set the user's health condition.
  @override
  Future<void> setHealthCondition(bool isGood) {
    // TODO: implement setHealthCondition
    throw UnimplementedError();
  }

  /// Set the user's mental condition.
  @override
  Future<void> setMentalCondition(bool isGood) {
    // TODO: implement setMentalCondition
    throw UnimplementedError();
  }

  /// Set the user's cash condition.
  @override
  Future<void> setCashCondition(bool isGood) {
    // TODO: implement setCashCondition
    throw UnimplementedError();
  }
}
