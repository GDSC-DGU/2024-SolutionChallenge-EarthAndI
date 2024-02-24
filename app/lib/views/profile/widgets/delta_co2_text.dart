import 'package:earth_and_i/utilities/system/color_system.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DeltaCO2Text extends StatelessWidget {
  const DeltaCO2Text({
    super.key,
    required this.deltaCO2,
    required this.style,
    this.textAlign,
  });

  final double deltaCO2;
  final TextStyle style;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    Color color = ColorSystem.grey;
    String prefix = "";
    String suffix = " kg";

    if (deltaCO2 > 0) {
      color = ColorSystem.pink;
      prefix = "↑ ";
    } else if (deltaCO2 < 0) {
      color = ColorSystem.green;
      prefix = "↓ ";
    }

    return Text(
      "$prefix${NumberFormat('###,###,###,##0.0000').format(deltaCO2.abs())}$suffix",
      style: style.copyWith(color: color),
      textAlign: textAlign,
    );
  }
}
