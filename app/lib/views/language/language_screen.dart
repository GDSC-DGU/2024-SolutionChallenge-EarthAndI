import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/language/language_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';

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
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Language',
          style: FontSystem.KR18R,
        ),
      ),
    );
  }
}
