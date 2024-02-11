import 'package:earth_and_i/view_models/user_auth/user_auth_view_model.dart';
import 'package:get/get.dart';

class UserAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserAuthViewModel>(() => UserAuthViewModel());
  }
}
