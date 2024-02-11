import 'package:earth_and_i/apps/firebase/firebase_options.dart';
import 'package:earth_and_i/apps/main_app.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initializeDateFormatting();

  runApp(const MainApp());
}
