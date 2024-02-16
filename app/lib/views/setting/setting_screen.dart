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
          settingSection("사용자 인증", Routes.USERAUTH),
          settingSection("언어", Routes.LANGUAGE),
          Obx(() => settingAlram()),
        ],
      ),
    );
  }

  Widget settingSection(String text, String route) => Container(
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: ColorSystem.grey1)),
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

  Widget settingAlram() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //알림 활성화
          SizedBox(
            width: double.infinity,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "알림 활성화",
                      style: FontSystem.KR16B,
                    ),

                    //---토글버튼
                    toggleButton(viewModel.isAlram, viewModel.onIsAlramSwitch)
                  ],
                )),
          ),

          const SizedBox(
            height: 8,
          ),

          //알림 시간
          SizedBox(
            width: double.infinity,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("알림 시간",
                        style: FontSystem.KR16B.copyWith(
                            color: viewModel.isAlram
                                ? Colors.black
                                : const Color(0xFFACADB2))),

                    //--- 시간선택 버튼

                    InkWell(
                      onTap: () {
                        viewModel.isAlram ? viewModel.onAlramTimeSet() : {};
                      },
                      child: Row(
                        children: [
                          Text(viewModel.alramTime,
                              style: FontSystem.KR16R.copyWith(
                                  color: viewModel.isAlram
                                      ? Colors.black
                                      : const Color(0xFFACADB2))),
                          const SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            'assets/icons/right.svg',
                            width: 16,
                            colorFilter: ColorFilter.mode(
                                viewModel.isAlram
                                    ? Colors.black
                                    : const Color(0xFFACADB2),
                                BlendMode.srcATop),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ],
      );
}

Widget toggleButton(bool value, void Function() action) => InkWell(
    onTap: action,
    child: Container(
      width: 44,
      height: 22,
      decoration: BoxDecoration(
        color: value ? const Color(0xFF90CDBE) : const Color(0xFFACADB2),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        mainAxisAlignment:
            value ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white, // 하얀 동그라미
            ),
          ),
        ],
      ),
    ));
