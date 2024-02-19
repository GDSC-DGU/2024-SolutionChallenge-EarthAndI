import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

abstract class LocalNotificationUtil {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationDetails _androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'earth_and_i_local_channel_id',
    'E & I',
    channelDescription: 'E & I Channel',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  static const NotificationDetails _platformChannelSpecifics =
      NotificationDetails(
    android: _androidPlatformChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ),
  );

  static Future<void> initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('ic_launcher');

    DarwinInitializationSettings initializationSettingsIOS =
        const DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _plugin.initialize(initializationSettings);
  }

  static void requestPermission() {
    _plugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()!
        .requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  static Future<void> setScheduleNotification({
    required bool isActive,
    required int hour,
    required int minute,
  }) async {
    if (isActive) {
      await _plugin.cancel(0);
      await _plugin.zonedSchedule(
        0,
        'E & I',
        '오늘은 어떤 변화가 있을까요?',
        _toDateTime(hour, minute),
        _platformChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } else {
      await _plugin.cancel(0);
    }
  }

  static TZDateTime _toDateTime(hour, minute) {
    // Current Time
    DateTime localNow = DateTime.now();
    DateTime localWhen =
        DateTime(localNow.year, localNow.month, localNow.day, hour, minute);

    // UTC Time
    TZDateTime now = TZDateTime.from(localNow, tz.local);
    TZDateTime when = TZDateTime.from(localWhen, tz.local);

    if (when.isBefore(now)) {
      return when.add(const Duration(days: 1));
    } else {
      return when;
    }
  }
}
