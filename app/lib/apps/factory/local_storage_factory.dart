import 'package:earth_and_i/domains/dao/user_dao.dart';
import 'package:earth_and_i/utilities/functions/local_notification_util.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/utilities/functions/widget_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

abstract class LocalStorageFactory {
  static GetStorage? _instance;

  static UserDAO? _userDAO;
  static UserDAO get userDAO => _userDAO!;

  static Future<void> onInit() async {
    await GetStorage.init();
    await WidgetUtil.onInit();

    _instance = GetStorage();

    _userDAO = UserDAO(storage: _instance!);

    if (SecurityUtil.currentUser == null && !userDAO.isInitialized) {
      await _userDAO!.onInit(true);
    } else {
      await _userDAO!.onInit(false);
    }
  }

  static Future<void> onReady() async {
    if (userDAO.isInitialized) {
      WidgetUtil.setInformation(
        positiveDeltaCO2: userDAO.getTotalPositiveDeltaCO2(),
        negativeDeltaCO2: userDAO.getTotalNegativeDeltaCO2(),
        isHealthCondition: userDAO.getHealthCondition(),
        isMentalCondition: userDAO.getMentalCondition(),
        isCashCondition: userDAO.getCashCondition(),
      );
      return;
    }

    User? user = SecurityUtil.currentUser;

    // If user is not signed in, initialize with GUEST
    await userDAO.onReady(
      id: user?.uid.substring(0, 3) ?? 'GUEST',
      nickname: user?.displayName ?? 'GUEST',
    );

    // Set Alarm
    await LocalNotificationUtil.setScheduleNotification(
      isActive: userDAO.getAlarmActive(),
      hour: userDAO.getAlarmHour(),
      minute: userDAO.getAlarmMinute(),
    );

    // Set Widget
    WidgetUtil.setInformation(
      positiveDeltaCO2: userDAO.getTotalPositiveDeltaCO2(),
      negativeDeltaCO2: userDAO.getTotalNegativeDeltaCO2(),
      isHealthCondition: userDAO.getHealthCondition(),
      isMentalCondition: userDAO.getMentalCondition(),
      isCashCondition: userDAO.getCashCondition(),
    );
  }
}
