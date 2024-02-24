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
import 'package:earth_and_i/utilities/functions/log_util.dart';
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
  /*
  최초 실행이라면 디바이스에 로그인 정보가 있는지 확인한다. 만약 로그인 정보에 따라서 행위는 다음과 같다.
  있다면 FireStore에서 사용자 정보를 가져와서 초기화한다.(동기화가 됨)
  없다면 GUEST로 초기화한다.(동기화 안 됨)
   */
  UserLocalProvider localProvider = LocalStorageFactory.userLocalProvider;
  UserRemoteProvider remoteProvider = RemoteStorageFactory.userRemoteProvider;
  bool isFirstRun = localProvider.getFirstRun();

  if (isFirstRun) {
    if (SecurityUtil.isSignin) {
      await localProvider.onReady(
        id: SecurityUtil.currentUser!.uid.substring(0, 5),
        nickname: await RemoteStorageFactory.userRemoteProvider.getNickname(),
        totalNegativeDeltaCO2: await remoteProvider.getTotalNegativeDeltaCO2(),
        totalPositiveDeltaCO2: await remoteProvider.getTotalPositiveDeltaCO2(),
        healthCondition: await remoteProvider.getHealthCondition(),
        mentalCondition: await remoteProvider.getMentalCondition(),
        cashCondition: await remoteProvider.getCashCondition(),
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
      );
    }

    // Set Alarm
    await LocalNotificationUtil.setScheduleNotification(
      isActive: localProvider.getAlarmActive(),
      hour: localProvider.getAlarmHour(),
      minute: localProvider.getAlarmMinute(),
    );
  }

  /*
  Home Widget을 현재 정보로 초기화 한다.
   */
  WidgetUtil.setInformation(
    positiveDeltaCO2: localProvider.getTotalPositiveDeltaCO2(),
    negativeDeltaCO2: localProvider.getTotalNegativeDeltaCO2(),
    isHealthCondition: localProvider.getHealthCondition(),
    isMentalCondition: localProvider.getMentalCondition(),
    isCashCondition: localProvider.getCashCondition(),
  );
}
