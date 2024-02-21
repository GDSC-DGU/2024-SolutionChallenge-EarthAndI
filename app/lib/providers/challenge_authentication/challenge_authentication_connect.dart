import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class ChallengeAuthenticationConnect extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    super.onInit();
    httpClient
      ..baseUrl = dotenv.env['CHALLENGE_AUTH_SERVER_HOST']
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 30)
      ..addRequestModifier<dynamic>((request) {
        DevOnLog.i("🛫 [${request.method}] ${request.url} | START");

        return request;
      })
      ..addResponseModifier((request, Response response) {
        if (response.status.hasError) {
          DevOnLog.i(
            "🚨 [${request.method}] ${request.url} | FAILED (${response.statusCode})",
          );
        } else {
          DevOnLog.i(
            "🛬 [${request.method}] ${request.url} | SUCCESS (${response.statusCode})",
          );

          DevOnLog.i(
            "🛬 [${request.method}] ${request.url} | BODY ${response.body}",
          );
        }

        return response;
      });
  }
}
