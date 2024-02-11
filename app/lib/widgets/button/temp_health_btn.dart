import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class TempHealthBtn extends StatelessWidget {
  const TempHealthBtn({super.key});

  static final HealthFactory _health =
      HealthFactory(useHealthConnectIfAvailable: true);
  static final List<HealthDataType> _typesToRead = [
    HealthDataType.STEPS,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        bool request = await _health.requestAuthorization(_typesToRead);
        DevOnLog.d('request: $request');

        // 금일 00시 00분 00초 변수, 23시 59분 59초 변수
        DateTime now = DateTime.now();
        DateTime midnight = DateTime(now.year, now.month, now.day);
        DateTime lastNight = DateTime(now.year, now.month, now.day, 23, 59, 59);

        int sum =
            (await _health.getTotalStepsInInterval(midnight, lastNight)) ?? 0;

        DevOnLog.i('sum: $sum');
      },
      color: Colors.blue,
      child: const Text('Home Screen', style: FontSystem.KR18M),
    );
  }
}
