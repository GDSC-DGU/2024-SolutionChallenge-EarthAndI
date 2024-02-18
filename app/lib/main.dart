import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/apps/main_app.dart';
import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:earth_and_i/utilities/functions/health_util.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  // DotEnv
  await dotenv.load(fileName: "assets/config/.env");

  // DateTime Formatting
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  // Permission
  await Permission.activityRecognition.request();
  await HealthUtil.initialize();

  // Database
  LocalDatabaseFactory.onInit();
  await LocalStorageFactory.onInit();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // LocalStorageFactory.deleteData();

  runApp(const MainApp());
}
