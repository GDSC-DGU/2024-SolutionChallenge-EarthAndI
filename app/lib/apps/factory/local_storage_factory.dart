import 'package:earth_and_i/providers/user/user_local_provider.dart';
import 'package:earth_and_i/providers/user/user_local_provider_impl.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalStorageFactory {
  static GetStorage? _instance;

  static UserLocalProvider? _userLocalProvider;
  static UserLocalProvider get userLocalProvider => _userLocalProvider!;

  static Future<void> onInit() async {
    await GetStorage.init();

    _instance = GetStorage();
    _userLocalProvider = UserLocalProviderImpl(storage: _instance!);

    userLocalProvider.onInit();
  }
}
