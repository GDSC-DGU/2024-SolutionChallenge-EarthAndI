import 'package:earth_and_i/view_models/language/language_view_model.dart';
import 'package:get/get.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageViewModel>(() => LanguageViewModel());
  }
}
