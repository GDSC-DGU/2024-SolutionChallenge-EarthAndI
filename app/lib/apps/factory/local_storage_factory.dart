import 'dart:io';

import 'package:earth_and_i/domains/dao/user_dao.dart';
import 'package:earth_and_i/utilities/functions/local_notification_util.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  static Future<void> onReady() async {
    if (userDAO.isInitialized) {
      return;
    }

    User? user = SecurityUtil.currentUser;

    await userDAO.init(
      id: user?.uid.substring(0, 3) ?? 'GUEST',
      nickname: user?.displayName ?? 'GUEST',
    );

    bool isActive = userDAO.getAlarmActive();
    int hour = userDAO.getAlarmHour();
    int minute = userDAO.getAlarmMinute();

    await LocalNotificationUtil.setScheduleNotification(
      isActive: isActive,
      hour: hour,
      minute: minute,
    );
  }

  static void deleteData() async {
    await userDAO.deleteAll();
    exit(0);
  }
}
