import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/language/language_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LanguageScreen extends BaseScreen<LanguageViewModel> {
  const LanguageScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "언어",
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
          languageSection("영어"),
          languageSection("한국어"),
        ],
      ),
    );
  }

  Widget languageSection(
    String language,
  ) =>
      Container(
        decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: ColorSystem.grey1)),
        ),
        width: double.infinity,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    language,
                    style: FontSystem.KR16B,
                  ),
                ),
                if (language == "한국어")
                  SvgPicture.asset(
                    'assets/icons/check.svg',
                    width: 20,
                  )
              ],
            )),
      );
}
