import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:earth_and_i/widgets/appbar/custom_icon_button.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  const DefaultAppBar({
    super.key,
    required this.title,
    this.actions = const <CustomIconButton>[],
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: FontSystem.KR20B,
      ),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      centerTitle: false,
      actions: actions,
    );
  }
}
