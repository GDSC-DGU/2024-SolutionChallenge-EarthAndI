import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserSearchViewModel extends GetxController {
  late final TextEditingController searchController;
  late final RxString _searchWord = "".obs;
  late final _isKeyboardOpen = false.obs;

  String get searchWord => _searchWord.value;
  bool get isKeyboardOpen => _isKeyboardOpen.value;

  @override
  void onInit() {
    super.onInit();
    searchController = TextEditingController();
  }

  void searchFriend(String value) {
    _searchWord.value = value;
  }

  void onTapSetIsKeyboardOpen(bool value) {
    _isKeyboardOpen.value = value;
  }

  void onPressReset() {
    _searchWord.value = "";
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
