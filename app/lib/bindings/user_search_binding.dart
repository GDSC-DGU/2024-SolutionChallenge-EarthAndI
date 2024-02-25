import 'package:earth_and_i/view_models/user_search/user_search_view_model.dart';
import 'package:get/get.dart';

class UserSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserSearchViewModel>(UserSearchViewModel());
  }
}
