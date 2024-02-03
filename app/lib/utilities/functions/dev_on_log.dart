import 'package:logger/logger.dart';

abstract class DevOnLog {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );

  static void i(dynamic message) {
    _logger.i(message);
  }

  static void d(dynamic message) {
    _logger.d(message);
  }

  static void e(dynamic message) {
    _logger.e(message);
  }
}
