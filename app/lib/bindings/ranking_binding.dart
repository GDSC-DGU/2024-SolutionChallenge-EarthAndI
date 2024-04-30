import 'package:earth_and_i/view_models/ranking/ranking_view_model.dart';
import 'package:get/get.dart';

class RankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingViewModel>(() => RankingViewModel());
  }
}
