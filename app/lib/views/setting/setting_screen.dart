import 'package:earth_and_i/utilities/functions/log_util.dart';
import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/setting/setting_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/setting/widgets/custom_time_picker_dialog.dart';
import 'package:earth_and_i/views/setting/widgets/section_item.dart';
import 'package:earth_and_i/views/setting/widgets/sign_out_dialog.dart';
import 'package:earth_and_i/views/setting/widgets/withdrawal_dialog.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingScreen extends BaseScreen<SettingViewModel> {
  const SettingScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "setting".tr,
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _languageSection(),
        _paddingInfinityLine(),
        _notificationActiveSection(),
        _paddingInfinityLine(),
        _notificationTimeSection(),
        _paddingInfinityLine(),
        _authenticationSection(),
        _paddingInfinityLine(),
        _withdrawalSection(),
      ],
    );
  }

  Widget _paddingInfinityLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InfinityLine(height: 1, color: ColorSystem.grey[200]),
      );

  Widget _languageSection() => SectionItem(
        children: [
          Text(
            "language".tr,
            style: FontSystem.KR16B,
          ),
          const Spacer(),
          Obx(
            () => Text(
              viewModel.languageName.tr,
              style: FontSystem.KR16R.copyWith(color: ColorSystem.grey[700]),
            ),
          ),
        ],
      );

  Widget _notificationActiveSection() => SectionItem(
        children: [
          Text(
            "notification_active".tr,
            style: FontSystem.KR16B,
          ),
          const Spacer(),
          SizedBox(
            width: 44,
            height: 24,
            child: Obx(
              () => Switch(
                value: viewModel.alarmState.isActive,
                onChanged: (value) {
                  viewModel.onIsAlarmSwitch();
                },
                activeColor: ColorSystem.white,
                activeTrackColor: ColorSystem.green,
                inactiveThumbColor: ColorSystem.white,
                inactiveTrackColor: ColorSystem.grey,
                trackOutlineColor:
                    MaterialStateProperty.all(ColorSystem.transparent),
              ),
            ),
          ),
        ],
      );

  Widget _notificationTimeSection() => Obx(
        () => SectionItem(
          onTap: () {
            Get.dialog(CustomTimePickerDialog(
              hour: viewModel.alarmState.hour,
              minute: viewModel.alarmState.minute,
              onCancel: () {
                Get.back();
              },
              onConfirm: (hour, minute) {
                viewModel.changeAlarmTime(hour, minute);
                Get.back();
              },
            ));
          },
          children: [
            Text(
              "notification_time".tr,
              style: viewModel.alarmState.isActive
                  ? FontSystem.KR16B
                  : FontSystem.KR16R.copyWith(color: ColorSystem.grey[400]),
            ),
            const Spacer(),
            Text(
              // 00 : 00 형태로 표시
              "${viewModel.alarmState.hour.toString().padLeft(2, '0')}:${viewModel.alarmState.minute.toString().padLeft(2, '0')}",
              style: viewModel.alarmState.isActive
                  ? FontSystem.KR16R.copyWith(color: ColorSystem.grey[700])
                  : FontSystem.KR16R.copyWith(color: ColorSystem.grey[400]),
            ),
            const SizedBox(
              width: 4,
            ),
            SvgPicture.asset(
              'assets/icons/right.svg',
              width: 16,
              colorFilter: viewModel.alarmState.isActive
                  ? null
                  : ColorFilter.mode(ColorSystem.grey[400]!, BlendMode.srcIn),
            ),
          ],
        ),
      );

  Widget _authenticationSection() => Obx(
        () => viewModel.isSignIn
            ? SectionItem(
                onTap: () {
                  Get.dialog(
                    SignOutDialog(
                      onConfirm: () {
                        viewModel.signOut().then((value) {
                          if (value) {
                            Get.back();
                            _showSnackBar(
                              'sign_out_success'.tr,
                              'sign_out_success_long'.tr,
                            );
                          } else {
                            _showSnackBar(
                              'sign_out_failed'.tr,
                              'sign_out_failed_long'.tr,
                            );
                          }
                        });
                      },
                      onCancel: () {
                        Get.back();
                      },
                    ),
                  );
                },
                children: [
                  Text(
                    "sign_out".tr,
                    style: FontSystem.KR16B.copyWith(color: ColorSystem.pink),
                  ),
                ],
              )
            : SectionItem(
                onTap: () {
                  Get.toNamed(
                    Routes.SIGN_IN,
                    arguments: {"beforeRoute": Routes.SETTING},
                  );
                },
                children: [
                  Text(
                    "sign_in".tr,
                    style: FontSystem.KR16B.copyWith(color: ColorSystem.green),
                  ),
                ],
              ),
      );

  Widget _withdrawalSection() => Obx(
        () => viewModel.isSignIn
            ? SectionItem(
                onTap: () {
                  Get.dialog(
                    WithdrawalDialog(
                      onConfirm: () {
                        viewModel.withdrawal().then((value) {
                          if (value) {
                            Get.back();
                            _showSnackBar(
                              'withdrawal_success'.tr,
                              'withdrawal_success_long'.tr,
                            );
                          } else {
                            _showSnackBar(
                              'withdrawal_failed'.tr,
                              'withdrawal_failed_long'.tr,
                            );
                          }
                        });
                      },
                      onCancel: () {
                        Get.back();
                      },
                    ),
                  );
                },
                children: [
                  Text(
                    "withdrawal".tr,
                    style: FontSystem.KR16B.copyWith(color: ColorSystem.pink),
                  ),
                ],
              )
            : const SizedBox(),
      );

  void _showSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: const Duration(seconds: 2),
      backgroundColor: ColorSystem.grey.withOpacity(0.3),
    );
  }
}
