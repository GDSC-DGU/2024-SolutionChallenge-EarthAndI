import 'package:earth_and_i/utilities/static/app_routes.dart';
import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/setting/setting_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SettingScreen extends BaseScreen<SettingViewModel> {
  const SettingScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "설정",
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          settingRouter("사용자 인증", Routes.USERAUTH),
          settingRouter("언어", Routes.LANGUAGE),
          settingAlram(),
        ],
      ),
    );
  }

  Widget settingAlram() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //알림 활성화
          Obx(() => settingSection(
                "알림 활성화",
                toggleButton(),
              )),

          const SizedBox(
            height: 8,
          ),

          //알림 시간
          Obx(() => settingSection(
                "알림 시간",
                timePicker(),
              ))
        ],
      );

  Widget settingSection(String text, Widget button) => SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: FontSystem.KR16B.copyWith(
                    color: viewModel.isAlram
                        ? ColorSystem.black
                        : ColorSystem.grey.shade500),
              ),
              button
            ],
          ),
        ),
      );

  // 토글버튼
  Widget toggleButton() => InkWell(
      onTap: viewModel.onIsAlramSwitch,
      child: Container(
        width: 44,
        height: 22,
        decoration: BoxDecoration(
          color: viewModel.isAlram
              ? ColorSystem.green.shade500
              : ColorSystem.grey.shade500,
          borderRadius: BorderRadius.circular(22),
        ),
        child: AnimatedAlign(
          alignment:
              viewModel.isAlram ? Alignment.centerLeft : Alignment.centerRight,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          child: Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorSystem.grey.shade100,
            ),
          ),
        ),
      ));

  void onAlramTimeSet() {
    List<String> parts = viewModel.alramTime.split(':');
    int hourPart = int.parse(parts[0]);
    int minutePart = int.parse(parts[1]);
    TimeOfDay initialTime = TimeOfDay(hour: hourPart, minute: minutePart);

    showTimePicker(context: Get.context!, initialTime: initialTime)
        .then((selectedTime) {
      if (selectedTime != null && selectedTime != initialTime) {
        int hour = selectedTime.hour;
        int minute = selectedTime.minute;

        viewModel.setAlramTime(
            "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}");
      }
    });
  }

//현재시간 보여줌 + 시간 선택
  Widget timePicker() => InkWell(
        onTap: () {
          if (viewModel.isAlram) {
            onAlramTimeSet();
          }
        },
        child: Row(
          children: [
            Text(viewModel.alramTime,
                style: FontSystem.KR16R.copyWith(
                    color: viewModel.isAlram
                        ? ColorSystem.black
                        : ColorSystem.grey.shade500)),
            const SizedBox(
              width: 4,
            ),
            SvgPicture.asset(
              'assets/icons/right.svg',
              width: 16,
              colorFilter: ColorFilter.mode(
                  viewModel.isAlram
                      ? ColorSystem.black
                      : ColorSystem.grey.shade500,
                  BlendMode.srcATop),
            ),
          ],
        ),
      );
}

Widget settingRouter(String text, String route) => Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: ColorSystem.grey.shade200)),
      ),
      width: double.infinity,
      child: InkWell(
        onTap: () {
          Get.toNamed(route);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Text(
              text,
              style: FontSystem.KR16B,
            )),
      ),
    );
