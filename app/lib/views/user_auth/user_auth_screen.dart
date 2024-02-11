import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/user_auth/user_auth_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';

class UserAuthScreen extends BaseScreen<UserAuthViewModel> {
  const UserAuthScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return const PreferredSize(
      preferredSize: Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "사용자 인증",
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'userAuth',
          style: FontSystem.KR18R,
        ),
      ),
    );
  }
}
