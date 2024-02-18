import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/setting/setting_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/views/setting/widgets/custom_time_picker.dart';
import 'package:earth_and_i/views/setting/widgets/section_item.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:earth_and_i/widgets/line/infinity_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

part 'package:earth_and_i/views/setting/part/p_on_tap_functions.dart';

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
        authenticationSection(),
        paddingInfinityLine(),
        languageSection(),
        paddingInfinityLine(),
        alRamActiveSection(),
        paddingInfinityLine(),
        alRamTimeSection(),
      ],
    );
  }

  Widget paddingInfinityLine() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: InfinityLine(height: 1, color: ColorSystem.grey[200]),
      );

  Widget authenticationSection() => Obx(
        () => viewModel.isSignin
            ? SectionItem(
                onTap: onTapSignOut,
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
                    arguments: {"beforeScreen": Routes.SETTING},
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

  Widget languageSection() => SectionItem(
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

  Widget alRamActiveSection() => SectionItem(
        children: [
          Text(
            "alarm_active".tr,
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

  Widget alRamTimeSection() => Obx(
        () => SectionItem(
          onTap: viewModel.alarmState.isActive ? onTapAlarmTime : null,
          children: [
            Text(
              "alarm_time".tr,
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
}
