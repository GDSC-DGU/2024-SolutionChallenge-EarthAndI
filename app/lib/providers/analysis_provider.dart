import 'dart:math';

import 'package:earth_and_i/domains/type/e_user_status.dart';
import 'package:get/get.dart';

class AnalysisProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
  }

  Future<Map<String, dynamic>> analysisSpeechText(
    EUserStatus userStatus,
    String speechText,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    bool isGood = Random().nextBool();
    double output = Random().nextDouble() * 10.0;

    Map<String, dynamic> result = {
      "answer": "현재 AI의 분석 결과입니다.",
      "carbon": {
        "output": output,
        "reduce": isGood ? "good" : "bad",
      },
      "character": {
        userStatus.toString(): isGood ? "good" : "bad",
      }
    };

    return result;
  }
}
