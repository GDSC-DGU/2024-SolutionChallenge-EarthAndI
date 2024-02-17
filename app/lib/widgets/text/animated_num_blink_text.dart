import 'package:flutter/material.dart';

class AnimatedNumBlinkText extends StatefulWidget {
  const AnimatedNumBlinkText({
    super.key,
    required this.value,
    required this.duration,
    this.textStyle,
  });

  final String value;
  final TextStyle? textStyle;
  final Duration duration;

  @override
  State<AnimatedNumBlinkText> createState() => _AnimatedNumBlinkTextState();
}

class _AnimatedNumBlinkTextState extends State<AnimatedNumBlinkText>
    with SingleTickerProviderStateMixin {
  late int _count;
  late String _value;
  late TextStyle? _textStyle;

  late final AnimationController _animationController;

  @override
  void initState() {
    _count = 0;
    _value = widget.value;
    _textStyle = widget.textStyle;

    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (_count < 2) {
          _animationController.forward();
          setState(() {
            _count++;
          });
        } else {
          setState(() {
            _count = 0;
          });
          _animationController.stop();
        }
      }
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant AnimatedNumBlinkText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _value = widget.value;
      _textStyle = widget.textStyle;

      _count = 0;
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_value == '0' || _value == '0.0' || _value == '0.00') {
      return const SizedBox();
    }
    return FadeTransition(
      opacity: _animationController,
      child: Text(
        _value,
        style: _textStyle,
      ),
    );
  }
}
