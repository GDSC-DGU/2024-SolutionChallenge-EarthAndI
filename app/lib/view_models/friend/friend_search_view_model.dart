import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FriendSearchViewModel extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString _searchWord = "".obs;
  late final _isKeyboardOpen = false.obs;

  String get searchWord => _searchWord.value;
  bool get isKeyboardOpen => _isKeyboardOpen.value;

  void searchFriend(String value) {
    _searchWord.value = value;
  }

  void onTapSetIsKeyboardOpen(bool value) {
    _isKeyboardOpen.value = value;
  }

  void onPressReset() {
    _searchWord.value = "";
  }
}
