part of 'package:earth_and_i/views/home/home_screen.dart';

bool isSignIn() {
  // 로그인한 유저라면 true 반환
  if (Get.find<RootViewModel>().isSignIn) {
    return true;
  }

  // 로그인하지 않은 유저라면 모달을 띄우고 false 반환
  Get.dialog(
    const SignInDialog(),
  );

  return false;
}
