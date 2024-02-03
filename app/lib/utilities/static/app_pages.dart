import 'package:earth_and_i/bindings/root_binding.dart';
import 'package:earth_and_i/views/root/root_screen.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
  ),
];
