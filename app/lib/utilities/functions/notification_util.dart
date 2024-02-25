import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

abstract class NotificationUtil {
  static final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  static bool isFlutterLocalNotificationsInitialized = false;

  static const AndroidNotificationDetails
      _androidPlatformLocalChannelSpecifics = AndroidNotificationDetails(
    'earth_and_i_local_channel_id',
    'E & I',
    channelDescription: 'E & I Channel',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  static const AndroidNotificationDetails
      _androidPlatformRemoteChannelSpecifics = AndroidNotificationDetails(
    'earth_and_i_remote_channel_id',
    'E & I',
    channelDescription: 'E & I Channel',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  static const NotificationDetails _platformLocalChannelSpecifics =
      NotificationDetails(
    android: _androidPlatformLocalChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ),
  );

  static const NotificationDetails _platformRemoteChannelSpecifics =
      NotificationDetails(
    android: _androidPlatformRemoteChannelSpecifics,
    iOS: DarwinNotificationDetails(
      badgeNumber: 1,
    ),
  );

  static Future<void> initialize() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('mipmap/ic_launcher');

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

  static Future<void> setupRemoteNotification() async {
    if (isFlutterLocalNotificationsInitialized) return;

    AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    await _plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // iOS foreground notification 권한
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // IOS background 권한 체킹 , 요청
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // 토큰 요청
    String? _fcmToken = await FirebaseMessaging.instance.getToken();
    print("FCM Token: $_fcmToken");

    // 셋팅flag 설정
    isFlutterLocalNotificationsInitialized = true;
  }

  static Future<void> setScheduleLocalNotification({
    required bool isActive,
    required int hour,
    required int minute,
  }) async {
    if (isActive) {
      await _plugin.cancel(0);
      await _plugin.zonedSchedule(
        0,
        'E & I',
        'local_notification_content'.tr,
        _toDateTime(hour, minute),
        _platformLocalChannelSpecifics,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } else {
      await _plugin.cancel(0);
    }
  }

  @pragma('vm:entry-point')
  static Future<void> onBackgroundHandler(
    RemoteMessage message,
  ) async {
    LogUtil.i('onBackgroundHandler : $message');
  }

  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null) {
      // 웹이 아니면서 안드로이드이고, 알림이 있는경우
      _plugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        _platformRemoteChannelSpecifics,
      );
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
