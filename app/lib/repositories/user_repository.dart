import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:earth_and_i/providers/user_local_provider.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:get/get.dart';

class UserRepository extends GetxService {
  late final UserLocalProvider _localProvider;

  @override
  void onInit() {
    super.onInit();
    _localProvider = LocalStorageFactory.userDAO;
  }

  Future<void> load() async {
    await _localProvider.init();
  }

  double getTotalCarbonDiOxide() {
    return _localProvider.getTotalCarbonDiOxide();
  }

  Future<double> changeTotalCarbonDiOxide(
    EUserStatus? userStatus,
    double value,
  ) async {
    await _localProvider
        .setTotalCarbonDiOxide(_localProvider.getTotalCarbonDiOxide() + value);

    switch (userStatus) {
      case EUserStatus.health:
        if (value >= 0) {
          await _localProvider
              .setHealthPositiveCnt(_localProvider.getHealthPositiveCnt() + 1);
          DevOnLog.i(
              'Health Positive Count: ${_localProvider.getHealthPositiveCnt()}');
        } else {
          await _localProvider
              .setHealthNegativeCnt(_localProvider.getHealthNegativeCnt() + 1);
          DevOnLog.i(
              'Health Negative Count: ${_localProvider.getHealthNegativeCnt()}');
        }
      case EUserStatus.mental:
        if (value >= 0) {
          await _localProvider
              .setMentalPositiveCnt(_localProvider.getMentalPositiveCnt() + 1);
          DevOnLog.i(
              'Mental Positive Count: ${_localProvider.getMentalPositiveCnt()}');
        } else {
          await _localProvider
              .setMentalNegativeCnt(_localProvider.getMentalNegativeCnt() + 1);
          DevOnLog.i(
              'Mental Negative Count: ${_localProvider.getMentalNegativeCnt()}');
        }
      case EUserStatus.cash:
        if (value >= 0) {
          await _localProvider
              .setCashPositiveCnt(_localProvider.getCashPositiveCnt() + 1);
          DevOnLog.i(
              'Cache Positive Count: ${_localProvider.getCashPositiveCnt()}');
        } else {
          await _localProvider
              .setCashNegativeCnt(_localProvider.getCashNegativeCnt() + 1);
          DevOnLog.i(
              'Cache Negative Count: ${_localProvider.getCashNegativeCnt()}');
        }
      case null:
        DevOnLog.i('Non Update User Status');
      default:
        throw Exception('Invalid user status');
    }
    DevOnLog.i(
        'Total Carbon DiOxide: ${_localProvider.getTotalCarbonDiOxide()}');

    return _localProvider.getTotalCarbonDiOxide();
  }
}
