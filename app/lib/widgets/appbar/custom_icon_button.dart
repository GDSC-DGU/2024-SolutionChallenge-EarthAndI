import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onPressed;

  const CustomIconButton({
    super.key,
    required this.assetPath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      icon: SvgPicture.asset(
        assetPath,
        width: 24,
        height: 24,
      ),
      onPressed: onPressed,
    );
  }
}
