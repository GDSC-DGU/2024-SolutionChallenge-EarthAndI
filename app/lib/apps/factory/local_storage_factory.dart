import 'dart:io';

import 'package:earth_and_i/domains/dao/user_dao.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalStorageFactory {
  static GetStorage? _instance;

  static UserDAO? _userDAO;
  static UserDAO get userDAO => _userDAO!;

  static Future<void> onInit() async {
    await GetStorage.init();
    _instance = GetStorage();

    _userDAO = UserDAO(storage: _instance!);
  }

  static void deleteData() async {
    await _userDAO!.deleteAll();
    exit(0);
  }
}
