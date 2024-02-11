import 'package:earth_and_i/bindings/friend_binding.dart';
import 'package:earth_and_i/bindings/language_binding.dart';
import 'package:earth_and_i/bindings/root_binding.dart';
import 'package:earth_and_i/bindings/setting_binding.dart';
import 'package:earth_and_i/views/friend/friend_screen.dart';
import 'package:earth_and_i/views/language/language_screen.dart';
import 'package:earth_and_i/views/root/root_screen.dart';
import 'package:earth_and_i/views/setting/setting_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
  GetPage(
    name: Routes.SETTING,
    page: () => const SettingScreen(),
    binding: SettingBinding(),
  ),
  GetPage(
    name: Routes.LANGUAGE,
    page: () => const LanguageScreen(),
    binding: LanguageBinding(),
  ),
  GetPage(
    name: Routes.FRIEND,
    page: () => const FriendScreen(),
    binding: FriendBinding(),
  )
];
