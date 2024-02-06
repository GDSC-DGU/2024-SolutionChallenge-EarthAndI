import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  late final RxInt _reducedCO2;

  int get reducedCO2 => _reducedCO2.value;

  @override
  void onInit() {
    super.onInit();

    _reducedCO2 = 12000.obs;
  }
}
