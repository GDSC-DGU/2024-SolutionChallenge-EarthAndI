import 'package:earth_and_i/bindings/init_binding.dart';
import 'package:earth_and_i/utilities/static/app_pages.dart';
import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/translation/app_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    FlutterNativeSplash.remove();

    return GetMaterialApp(
      // App Title
      title: "Earth & I",

      translations: AppTranslations(),
      locale: Get.deviceLocale,
      supportedLocales: const [
        Locale('ko', 'KR'),
        Locale('en', 'UK'),
      ],
      fallbackLocale: const Locale('en', 'UK'),

      // Theme
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        colorSchemeSeed: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFf6f6f8),
      ),
      initialRoute: Routes.ROOT,
      initialBinding: InitBinding(),
      getPages: appPages,
    );
  }
}
