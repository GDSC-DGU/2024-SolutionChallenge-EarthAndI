import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalStorageFactory {
  static FlutterSecureStorage? _instance;

  static FlutterSecureStorage get instance => _instance!;

  static void onInit() {
    _instance = const FlutterSecureStorage();
  }
}
