import 'dart:math' as math;

import 'package:flutter/material.dart';

class AnimatedNumCounterText extends StatelessWidget {
  const AnimatedNumCounterText({
    super.key,
    required this.value,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
    this.textStyle,
    this.prefix,
    this.suffix,
    this.wholeDigits = 1,
    this.fractionDigits = 4,
    this.thousandSeparator = ",",
    this.decimalSeparator = ".",
  });

  /// 이 카운터의 값입니다.
  /// 새 값이 지정되면 카운터가 자동으로 애니메이션화됩니다
  final num value;

  // 애니메이션의 지속 시간입니다.
  final Duration duration;

  // 애니메이션의 커브입니다.
  final Curve curve;

  // 텍스트 스타일입니다.
  final TextStyle? textStyle;

  // 소수점 뒤의 자리 수입니다.
  final int wholeDigits;

  // 소수점 앞의 자리 수입니다.
  final int fractionDigits;

  // Number가 앞에 붙일 기호입니다.
  final String? prefix;

  // Number 앞에 붙일 기호입니다.
  final String? suffix;

  // 소수점 앞의 3자리마다 삽일할 기호
  final String thousandSeparator;

  // 소수점 기호
  final String decimalSeparator;

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style.merge(textStyle);
    final TextPainter prototypeDigit = TextPainter(
      text: TextSpan(text: "1 ", style: textStyle),
      textDirection: TextDirection.ltr,
      // textScaleFactor: MediaQuery.of(context).textScaleFactor,
    )..layout();
    // Text Color
    final Color color = textStyle?.color ?? Colors.black;
    final int value = (this.value * math.pow(10, fractionDigits)).round();

    // Split the integer value into separate digits.
    List<int> digits = value == 0 ? [0] : [];
    int v = value.abs();
    while (v > 0) {
      digits.add(v);
      v = v ~/ 10;
    }
    while (digits.length < wholeDigits + fractionDigits) {
      digits.add(0); // padding leading zeroes
    }
    digits = digits.reversed.toList(growable: false);

    // Generate the widgets needed for digits before the decimal point.
    final integerWidgets = <Widget>[];
    for (int i = 0; i < digits.length - fractionDigits; i++) {
      final digit = _SingleDigitFlip(
        key: ValueKey(digits.length - i),
        value: digits[i].toDouble(),
        duration: duration,
        curve: curve,
        size: prototypeDigit.size,
        color: color,
      );
      integerWidgets.add(digit);
    }
    // Insert "thousand separator" widgets if needed.
    int counter = 0;
    for (int i = integerWidgets.length; i > 0; i--) {
      if (counter > 0 && counter % 3 == 0) {
        integerWidgets.insert(i, Text(thousandSeparator));
      }
      counter++;
    }

    return DefaultTextStyle.merge(
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefix != null) Text(prefix!),
          ClipRect(
            child: TweenAnimationBuilder(
              // Animate the negative sign (-) appear and disappearing
              duration: duration,
              tween: Tween(end: value != 0 ? 1.0 : 0.0),
              builder: (_, double v, __) => Center(
                widthFactor: v,
                child:
                    Opacity(opacity: v, child: Text(value > 0 ? "↑ " : "↓ ")),
              ),
            ),
          ),
          // Draw digits before the decimal point
          ...integerWidgets,
          // Draw the decimal point
          if (fractionDigits != 0) Text(decimalSeparator),
          // Draw digits after the decimal point
          for (int i = digits.length - fractionDigits; i < digits.length; i++)
            _SingleDigitFlip(
              key: ValueKey("decimal$i"),
              value: digits[i].toDouble(),
              duration: duration,
              curve: curve,
              size: prototypeDigit.size,
              color: color,
            ),
          if (suffix != null)
            Text(
              suffix!,
              textAlign: TextAlign.center,
            ),
        ],
      ),
    );
  }
}

class _SingleDigitFlip extends StatelessWidget {
  const _SingleDigitFlip({
    super.key,
    required this.value,
    required this.duration,
    required this.curve,
    required this.size,
    required this.color,
  });

  final double value;
  final Duration duration;
  final Curve curve;
  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(end: value),
      duration: duration,
      curve: curve,
      builder: (_, double value, __) {
        final whole = value ~/ 1;
        final decimal = value - whole;
        final w = size.width;
        final h = size.height;

        return Container(
          margin: const EdgeInsets.only(top: 8),
          child: SizedBox(
            width: w,
            height: h,
            child: Stack(
              children: <Widget>[
                _buildSingleDigit(
                  digit: whole % 10,
                  offset: h * decimal,
                  opacity: 1 - decimal,
                ),
                _buildSingleDigit(
                  digit: (whole + 1) % 10,
                  offset: h * decimal - h,
                  opacity: decimal,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSingleDigit({
    required int digit,
    required double offset,
    required double opacity,
  }) {
    // Try to avoid using the `Opacity` widget when possible, for performance.
    final Widget child;
    if (color.opacity == 1) {
      // If the text style does not involve transparency, we can modify
      // the text color directly.
      child = Text(
        '$digit',
        textAlign: TextAlign.center,
        style: TextStyle(color: color.withOpacity(opacity.clamp(0, 1))),
      );
    } else {
      // Otherwise, we have to use the `Opacity` widget (less performant).
      child = Opacity(
        opacity: opacity.clamp(0, 1),
        child: Text(
          '$digit',
          textAlign: TextAlign.center,
        ),
      );
    }
    return Positioned(
      left: 0,
      right: 0,
      bottom: offset,
      child: child,
    );
  }
}
