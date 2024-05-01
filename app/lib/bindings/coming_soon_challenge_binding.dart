import 'package:earth_and_i/view_models/coming_soon_challenge/coming_soon_challenge_view_model.dart';
import 'package:get/get.dart';

class ComingSoonChallengeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ComingSoonChallengeViewModel>(
        () => ComingSoonChallengeViewModel());
  }
}
