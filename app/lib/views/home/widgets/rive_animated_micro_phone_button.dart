import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveAnimatedMicroPhoneButton extends StatefulWidget {
  const RiveAnimatedMicroPhoneButton({
    super.key,
    required this.width,
    required this.height,
    required this.riveFileName,
    required this.animationName,
    this.onTap,
  });

  final double width;
  final double height;

  final String riveFileName;
  final String animationName;
  final Function()? onTap;

  @override
  State<RiveAnimatedMicroPhoneButton> createState() =>
      _RiveAnimatedMicroPhoneButtonState();
}

class _RiveAnimatedMicroPhoneButtonState
    extends State<RiveAnimatedMicroPhoneButton> {
  late final RiveAnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController =
        SimpleAnimation(widget.animationName, autoplay: false);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }

        setState(() {
          _animationController.isActive = !_animationController.isActive;
        });
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            RiveAnimation.asset(
              widget.riveFileName,
              fit: BoxFit.cover,
              alignment: Alignment.center,
              controllers: [
                _animationController,
              ],
            ),
            Center(
              child: Icon(
                _animationController.isActive ? Icons.stop : Icons.mic_rounded,
                size: 40.0,
                color: ColorSystem.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
