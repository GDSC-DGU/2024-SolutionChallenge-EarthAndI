import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/providers/user_local_provider.dart';
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

  Future<double> increaseTotalCarbonDiOxide(double value) async {
    await _localProvider
        .setTotalCarbonDiOxide(_localProvider.getTotalCarbonDiOxide() + value);

    return _localProvider.getTotalCarbonDiOxide();
  }
}
