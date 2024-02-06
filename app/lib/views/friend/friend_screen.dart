import 'package:earth_and_i/utilities/functions/dev_on_log.dart';
import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/view_models/friend/friend_view_model.dart';
import 'package:earth_and_i/views/base/base_screen.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:earth_and_i/widgets/appbar/default_back_appbar.dart';
import 'package:flutter/material.dart';

class FriendScreen extends BaseScreen<FriendViewModel> {
  const FriendScreen({super.key});

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: DefaultBackAppBar(
        title: "친구",
        actions: [
          CustomIconButton(
              assetPath: "assets/icons/plus.svg",
              onPressed: () {
                DevOnLog.i("친구 추가 바텀 시트 온!!");
              })
        ],
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          'Friend Screen',
          style: FontSystem.KR18R,
        ),
      ),
    );
  }
}
