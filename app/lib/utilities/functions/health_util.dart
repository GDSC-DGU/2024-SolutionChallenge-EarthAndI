import 'package:health/health.dart';

abstract class HealthUtil {
  static final HealthFactory _health =
      HealthFactory(useHealthConnectIfAvailable: true);
  static final List<HealthDataType> _typesToRead = [
    HealthDataType.STEPS,
  ];

  static Future<void> initialize() async {
    await _health.requestAuthorization(_typesToRead);
  }

  /// Get steps from startAt to endAt
  static Future<int> getSteps(DateTime startAt, DateTime endAt) async {
    bool request = await _health.requestAuthorization(_typesToRead);

    if (request) {
      return (await _health.getTotalStepsInInterval(startAt, endAt)) ?? 0;
    } else {
      return 0;
    }
  }
}
