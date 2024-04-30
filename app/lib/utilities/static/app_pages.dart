import 'package:earth_and_i/bindings/coming_soon_challenge_binding.dart';
import 'package:earth_and_i/bindings/friend_binding.dart';
import 'package:earth_and_i/bindings/root_binding.dart';
import 'package:earth_and_i/bindings/setting_binding.dart';
import 'package:earth_and_i/bindings/sign_in_binding.dart';
import 'package:earth_and_i/bindings/user_search_binding.dart';
import 'package:earth_and_i/middlewares/on_boarding_middleware.dart';
import 'package:earth_and_i/views/coming_soon_challenge/coming_soon_challenge_screen.dart';
import 'package:earth_and_i/views/follow/follow_screen.dart';
import 'package:earth_and_i/views/on_boarding/on_boarding_screen.dart';
import 'package:earth_and_i/views/root/root_screen.dart';
import 'package:earth_and_i/views/setting/setting_screen.dart';
import 'package:earth_and_i/views/sign_in/sign_in_screen.dart';
import 'package:earth_and_i/views/challenge_authentication/challenge_authentication_screen.dart';
import 'package:earth_and_i/bindings/challenge_authentication_binding.dart';
import 'package:earth_and_i/views/user_search/user_search_screen.dart';

import 'package:get/get.dart';

import 'app_routes.dart';

List<GetPage> appPages = [
  GetPage(
    name: Routes.ROOT,
    page: () => const RootScreen(),
    binding: RootBinding(),
    middlewares: [
      OnBoardingMiddleware(),
    ],
  ),
  GetPage(
    name: Routes.ON_BOARDING,
    page: () => const OnBoardingScreen(),
  ),
  GetPage(
    name: Routes.SIGN_IN,
    page: () => const SignInScreen(),
    binding: SignInBinding(),
  ),
  GetPage(
    name: Routes.SETTING,
    page: () => const SettingScreen(),
    binding: SettingBinding(),
  ),
  GetPage(
    name: Routes.FOLLOW,
    page: () => const FollowScreen(),
    binding: FriendBinding(),
  ),
  GetPage(
    name: Routes.USER_SEARCH,
    page: () => const UserSearchScreen(),
    binding: UserSearchBinding(),
  ),
  GetPage(
    name: Routes.CHALLENGE_AUTHENTICATION,
    page: () => const ChallengeAuthenticationScreen(),
    binding: ChallengeAuthenticationBinding(),
  ),
  GetPage(
    name: Routes.COMING_SOON_CHALLENGE,
    page: () => const ComingSoonChallengeScreen(),
    binding: ComingSoonChallengeBinding(),
  )
];
