import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class BaseConnect extends GetConnect {
  @protected
  String get hostUrl;

  @override
  void onInit() {
    super.onInit();
    super.onInit();
    httpClient
      ..baseUrl = hostUrl
      ..defaultContentType = "application/json"
      ..timeout = const Duration(seconds: 30)
      ..addRequestModifier<dynamic>((request) {
        LogUtil.i("🛫 [${request.method}] ${request.url} | START");

        return request;
      })
      ..addResponseModifier((request, Response response) {
        if (response.status.hasError) {
          LogUtil.i(
            "🚨 [${request.method}] ${request.url} | FAILED (${response.statusCode})",
          );
        } else {
          LogUtil.i(
            "🛬 [${request.method}] ${request.url} | SUCCESS (${response.statusCode})",
          );

          LogUtil.i(
            "🛬 [${request.method}] ${request.url} | BODY ${response.body}",
          );
        }

        return response;
      });
  }
}
