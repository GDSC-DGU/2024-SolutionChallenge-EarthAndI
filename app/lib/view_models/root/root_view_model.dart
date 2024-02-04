import 'package:get/get.dart';
import 'package:flutter/foundation.dart' as foundation;

class RootViewModel extends GetxController {
  // Animation duration
  static const duration = Duration(milliseconds: 300);

  // Platform
  late final bool isAndroid;

  late final RxInt _selectedIndex;
  late final RxBool _isExpanded;

  int get selectedIndex => _selectedIndex.value;
  bool get isExpanded => _isExpanded.value;

  @override
  void onInit() {
    super.onInit();

    isAndroid =
        (foundation.defaultTargetPlatform == foundation.TargetPlatform.iOS);

    _selectedIndex = 1.obs;
    _isExpanded = false.obs;
  }

  void changeIndex(int index) {
    _selectedIndex.value = index;
  }

  void onTapFloatingActionButton() {
    _isExpanded.value = !_isExpanded.value;
  }
}
