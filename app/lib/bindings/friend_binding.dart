import 'package:earth_and_i/view_models/friend/friend_search_view_model.dart';
import 'package:earth_and_i/view_models/friend/friend_view_model.dart';
import 'package:get/get.dart';

class FriendBinding extends Bindings {
  @override
  void dependencies() {
    // Parents View Model
    Get.lazyPut<FriendViewModel>(() => FriendViewModel());

    // Children View Model
    Get.put(FriendSearchViewModel());
  }
}
