import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:earth_and_i/apps/main_app.dart';
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}
