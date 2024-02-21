import 'package:earth_and_i/apps/factory/local_storage_factory.dart';
import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    DevOnLog.i('OnBoardingMiddleware redirect: $route');
    if (LocalStorageFactory.userDAO.isFirstTime) {
      return const RouteSettings(name: Routes.ON_BOARDING);
    }

    return null;
  }
}