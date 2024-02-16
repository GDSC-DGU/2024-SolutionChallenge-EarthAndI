import 'package:flutter/material.dart';

class AnimatedNumBlink extends StatefulWidget {
  const AnimatedNumBlink({
    super.key,
    required this.value,
    required this.duration,
    this.textStyle,
  });

  final String value;
  final TextStyle? textStyle;
  final Duration duration;

  @override
  State<AnimatedNumBlink> createState() => _AnimatedNumBlinkState();
}

class _AnimatedNumBlinkState extends State<AnimatedNumBlink>
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

    // 3번 반복하면 애니메이션 종료
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
  void didUpdateWidget(covariant AnimatedNumBlink oldWidget) {
    super.didUpdateWidget(oldWidget);
    _count = 0;
    _animationController.forward();

    if (oldWidget.value != widget.value) {
      _value = widget.value;
      _textStyle = widget.textStyle;
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
