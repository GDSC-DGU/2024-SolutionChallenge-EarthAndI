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
          Obx(() => settingAlram()),
        ],
      ),
    );
  }

  Widget settingAlram() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //알림 활성화
          settingSection("알림 활성화",
              toggleButton(viewModel.isAlram, viewModel.onIsAlramSwitch), true),

          const SizedBox(
            height: 8,
          ),

          //알림 시간
          settingSection(
              "알림 시간",
              timePicker(viewModel.alramTime, viewModel.isAlram,
                  viewModel.onAlramTimeSet),
              viewModel.isAlram)
        ],
      );
}

Widget settingSection(String text, Widget button, bool active) => SizedBox(
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text,
                  style: FontSystem.KR16B.copyWith(
                      color: active
                          ? ColorSystem.black
                          : ColorSystem.grey.shade500)),
              button
            ],
          )),
    );

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

// 토글버튼
Widget toggleButton(bool value, void Function() action) => InkWell(
    onTap: action,
    child: Container(
      width: 44,
      height: 22,
      decoration: BoxDecoration(
        color: value ? ColorSystem.green.shade500 : ColorSystem.grey.shade500,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment:
            value ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorSystem.white,
            ),
          ),
        ],
      ),
    ));

//현재시간 보여줌 + 시간 선택
Widget timePicker(String initialTime, bool active, void Function() action) =>
    InkWell(
      onTap: () {
        if (active) {
          action();
        }
      },
      child: Row(
        children: [
          Text(initialTime,
              style: FontSystem.KR16R.copyWith(
                  color: active ? ColorSystem.black : const Color(0xFFACADB2))),
          const SizedBox(
            width: 4,
          ),
          SvgPicture.asset(
            'assets/icons/right.svg',
            width: 16,
            colorFilter: ColorFilter.mode(
                active ? ColorSystem.black : const Color(0xFFACADB2),
                BlendMode.srcATop),
          ),
        ],
      ),
    );
