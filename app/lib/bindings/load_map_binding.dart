import 'package:earth_and_i/view_models/load_map/load_map_view_model.dart';
import 'package:get/get.dart';

class LoadMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadMapViewModel>(() => LoadMapViewModel());
  }
}
