import 'package:earth_and_i/view_models/follow/follow_view_model.dart';
import 'package:get/get.dart';

class FriendBinding extends Bindings {
  @override
  void dependencies() {
    // Parents View Model
    Get.lazyPut<FollowViewModel>(() => FollowViewModel());

    // // Children View Model
    // Get.put(FriendSearchViewModel());
  }
}
