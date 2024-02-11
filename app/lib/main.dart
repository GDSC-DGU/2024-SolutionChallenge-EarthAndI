import 'package:earth_and_i/apps/factory/local_database_factory.dart';
import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/apps/main_app.dart';
import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  // DateTime Formatting
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();

  // Permission
  await Permission.activityRecognition.request();

  // Database
  LocalStorageFactory.onInit();
  LocalDatabaseFactory.onInit();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}
