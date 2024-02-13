import 'package:earth_and_i/view_models/challenge_authentication/challenge_authentication_view_model.dart';
import 'package:get/get.dart';

class ChallengeAuthenticationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChallengeAuthenticationViewModel>(
        () => ChallengeAuthenticationViewModel());
  }
}
