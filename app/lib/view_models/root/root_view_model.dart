import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;

class RootViewModel extends GetxController {
  // Animation duration
  static const duration = Duration(milliseconds: 200);

  // Platform And SpeechToText Recognition
  late final bool isAndroid;

  late final RxInt _selectedIndex;
  late final RxBool _isEnableGreyBarrier;

  int get selectedIndex => _selectedIndex.value;
  bool get isEnableGreyBarrier => _isEnableGreyBarrier.value;

  @override
  void onInit() async {
    super.onInit();

    isAndroid =
        (foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS);

    _selectedIndex = 1.obs;
    _isEnableGreyBarrier = false.obs;
  }

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  void changeMicState() {
    _isEnableGreyBarrier.value = !_isEnableGreyBarrier.value;
  }
}
