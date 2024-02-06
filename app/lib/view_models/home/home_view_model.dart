import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  late final RxInt _reducedCO2;
  late final RxBool _isLoadingAnalysis;

  int get reducedCO2 => _reducedCO2.value;
  bool get isLoadingAnalysis => _isLoadingAnalysis.value;

  @override
  void onInit() {
    super.onInit();

    _reducedCO2 = 12000.obs;
    _isLoadingAnalysis = false.obs;
  }

  void analysisSpeech() async {
    _isLoadingAnalysis.value = true;
    await Future.delayed(const Duration(seconds: 2));
    _isLoadingAnalysis.value = false;
  }
}
