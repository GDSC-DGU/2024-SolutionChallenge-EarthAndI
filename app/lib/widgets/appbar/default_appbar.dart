import 'package:earth_and_i/utilities/system/font_system.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  final String title;
  const DefaultAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: FontSystem.KR20B,
      ),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      centerTitle: false,
    );
  }
}
