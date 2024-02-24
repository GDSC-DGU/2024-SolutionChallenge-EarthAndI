import 'package:earth_and_i/view_models/sign_in/sign_in_view_model.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInViewModel>(() => SignInViewModel());
  }
}
