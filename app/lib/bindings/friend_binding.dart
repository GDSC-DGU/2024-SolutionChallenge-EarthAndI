import 'package:earth_and_i/view_models/friend/friend_view_model.dart';
import 'package:get/get.dart';

class FriendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FriendViewModel>(() => FriendViewModel());
  }
}
