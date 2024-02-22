// ignore_for_file: recursive_getters

part of 'package:earth_and_i/views/setting/setting_screen.dart';

extension _OnTapFunctions on SettingScreen {
  SettingViewModel get viewModel => controller;

  void onTapSignOut() {
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
                'sign_out_required'.tr,
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
                        viewModel.signOut().then((value) {
                          if (value) {
                            Get.back();
                            Get.snackbar(
                              'sign_out_success'.tr,
                              'sign_out_success_long'.tr,
                              snackPosition: SnackPosition.TOP,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              duration: const Duration(seconds: 2),
                              backgroundColor:
                                  ColorSystem.grey.withOpacity(0.3),
                            );
                          } else {
                            Get.snackbar(
                              'sign_out_failed'.tr,
                              'sign_out_failed_long'.tr,
                              snackPosition: SnackPosition.TOP,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              duration: const Duration(seconds: 2),
                              backgroundColor:
                                  ColorSystem.grey.withOpacity(0.3),
                            );
                          }
                        });
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
  }

  void onTapAlarmTime() {
    Get.dialog(
      Dialog(
        child: Container(
          constraints: BoxConstraints(
            minHeight: Get.height * 0.4,
            maxHeight: Get.height * 0.5,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorSystem.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                '${"alarm_time".tr} ${"setting".tr}',
                style: FontSystem.KR20B,
              ),
              Expanded(
                child: CustomTimePicker(
                  hour: viewModel.alarmState.hour,
                  minute: viewModel.alarmState.minute,
                  onCancel: () {
                    Get.back();
                  },
                  onConfirm: (hour, minute) {
                    viewModel.changeAlarmTime(hour, minute);
                    Get.back();
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
