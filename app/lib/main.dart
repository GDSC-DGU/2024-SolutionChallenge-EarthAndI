import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/apps/factory/remote_storage_factory.dart';
import 'package:earth_and_i/apps/main_app.dart';
import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:earth_and_i/bindings/init_binding.dart';
import 'package:earth_and_i/providers/user/user_local_provider.dart';
import 'package:earth_and_i/providers/user/user_remote_provider.dart';
import 'package:earth_and_i/utilities/functions/health_util.dart';
import 'package:earth_and_i/utilities/functions/local_notification_util.dart';
import 'package:earth_and_i/utilities/functions/security_util.dart';
import 'package:earth_and_i/utilities/functions/widget_util.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
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
  await LocalNotificationUtil.initialize();

  // Widget
  await WidgetUtil.onInit();

  // Database
  LocalDatabaseFactory.onInit();
  await LocalStorageFactory.onInit();
  await RemoteStorageFactory.onInit();
}

Future<void> onSystemReady() async {
  UserLocalProvider localProvider = LocalStorageFactory.userLocalProvider;
  UserRemoteProvider remoteProvider = RemoteStorageFactory.userRemoteProvider;

  /*
  If it's the first run, it checks if there's login information on the device.
  Additionally, it sets up the alarms.
  Depending on the login information, the actions are as follows:

  If there is, it retrieves user information from Firestore and initializes.
  If not, it initializes as GUEST. (No synchronization occurs)
   */
  bool isFirstRun = localProvider.getFirstRun();

  if (isFirstRun) {
    if (SecurityUtil.isSignin) {
      await localProvider.onReady(
        id: await remoteProvider.getId(),
        nickname: await remoteProvider.getNickname(),
        totalNegativeDeltaCO2: await remoteProvider.getTotalNegativeDeltaCO2(),
        totalPositiveDeltaCO2: await remoteProvider.getTotalPositiveDeltaCO2(),
        healthCondition: await remoteProvider.getHealthCondition(),
        mentalCondition: await remoteProvider.getMentalCondition(),
        cashCondition: await remoteProvider.getCashCondition(),
        isNotificationActive: await remoteProvider.getNotificationActive(),
      );

      await localProvider.setFirstRun(false);
      await localProvider.setSynced(true);
    } else {
      await localProvider.onReady(
        id: null,
        nickname: null,
        totalNegativeDeltaCO2: null,
        totalPositiveDeltaCO2: null,
        healthCondition: false,
        mentalCondition: null,
        cashCondition: null,
        isNotificationActive: null,
      );
    }

    await LocalNotificationUtil.setScheduleNotification(
      isActive: localProvider.getNotificationActive(),
      hour: localProvider.getNotificationHour(),
      minute: localProvider.getNotificationMinute(),
    );
  }

  /*
  Initialize the Home Widget with current information.
   */
  WidgetUtil.setInformation(
    positiveDeltaCO2: localProvider.getTotalPositiveDeltaCO2(),
    negativeDeltaCO2: localProvider.getTotalNegativeDeltaCO2(),
    isHealthCondition: localProvider.getHealthCondition(),
    isMentalCondition: localProvider.getMentalCondition(),
    isCashCondition: localProvider.getCashCondition(),
  );
}
