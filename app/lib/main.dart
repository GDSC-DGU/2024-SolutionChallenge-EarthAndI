import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/apps/factory/remote_storage_factory.dart';
import 'package:earth_and_i/apps/main_app.dart';
import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:earth_and_i/bindings/init_binding.dart';
import 'package:earth_and_i/providers/user/user_local_provider.dart';
import 'package:earth_and_i/providers/user/user_remote_provider.dart';
import 'package:earth_and_i/utilities/functions/health_util.dart';
import 'package:earth_and_i/utilities/functions/notification_util.dart';
import 'package:earth_and_i/utilities/functions/widget_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:timezone/data/latest.dart' as tz;

void main() async {
  // Environment
  await onSystemInit();

  // App onReady
  await onSystemReady();

  InitBinding().dependencies();

  runApp(const MainApp());
}

Future<void> onSystemInit() async {
  // Environment
  await dotenv.load(fileName: "assets/config/.env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // DateTime Formatting
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  tz.initializeTimeZones();

  // Permission
  await Permission.activityRecognition.request();
  await HealthUtil.initialize();
  await NotificationUtil.initialize();
  await NotificationUtil.setupRemoteNotification();

  // Widget
  await WidgetUtil.onInit();
  await FlutterAppBadger.removeBadge();

  // Database
  LocalDatabaseFactory.onInit();
  await LocalStorageFactory.onInit();
  await RemoteStorageFactory.onInit();
}

Future<void> onSystemReady() async {
  UserLocalProvider localProvider = LocalStorageFactory.userLocalProvider;
  UserRemoteProvider remoteProvider = RemoteStorageFactory.userRemoteProvider;

  /*
  Here's how the app behaves when first launched:

  If there is login information remaining, it logs out.
  It initializes local data.
  It sets up local notifications.
   */
  bool isFirstRun = localProvider.getFirstRun();

  if (isFirstRun) {
    if (FirebaseAuth.instance.currentUser != null) {
      await remoteProvider.setDeviceToken("");
      await FirebaseAuth.instance.signOut();
    }

    await localProvider.onReady();

    await NotificationUtil.setScheduleLocalNotification(
      isActive: localProvider.getNotificationActive(),
      hour: localProvider.getNotificationHour(),
      minute: localProvider.getNotificationMinute(),
    );
  }

  /*
  It updates the data of the home widget regardless of whether it's the app's first launch or not.
   */
  WidgetUtil.setInformation(
    positiveDeltaCO2: localProvider.getTotalPositiveDeltaCO2(),
    negativeDeltaCO2: localProvider.getTotalNegativeDeltaCO2(),
    isHealthCondition: localProvider.getHealthCondition(),
    isMentalCondition: localProvider.getMentalCondition(),
    isCashCondition: localProvider.getCashCondition(),
  );
}
