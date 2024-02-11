import 'package:earth_and_i/apps/database/local_database.dart';

abstract class LocalDatabaseFactory {
  static LocalDatabase? _instance;

  static LocalDatabase get instance => _instance!;

  static void onInit() {
    _instance = LocalDatabase();
  }
}
