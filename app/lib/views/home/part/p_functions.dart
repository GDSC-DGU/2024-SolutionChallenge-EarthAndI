part of 'package:earth_and_i/views/home/home_screen.dart';

bool isSignIn() {
  // 로그인한 유저라면 true 반환
  if (Get.find<RootViewModel>().isSignIn) {
    return true;
  }

  // 로그인하지 않은 유저라면 모달을 띄우고 false 반환
  Get.dialog(
    Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: ColorSystem.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'sign_in_required'.tr,
              style: FontSystem.KR20B,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: ColorSystem.white,
                      side: BorderSide(
                        color: ColorSystem.grey,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'cancel'.tr,
                      style: FontSystem.KR16B.copyWith(
                        color: ColorSystem.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                      Get.toNamed(Routes.SIGN_IN);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: ColorSystem.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'confirm'.tr,
                      style: FontSystem.KR16B.copyWith(
                        color: ColorSystem.white,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );

  return false;
}
