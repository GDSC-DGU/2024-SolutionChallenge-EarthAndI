import 'package:earth_and_i/view_models/setting/setting_view_model.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingViewModel>(() => SettingViewModel());
  }
}
