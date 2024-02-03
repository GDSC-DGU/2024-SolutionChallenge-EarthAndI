import 'package:flutter/material.dart';

class InfinityLine extends StatelessWidget {
  final Color color;
  final double height;
  const InfinityLine({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      color: color,
    );
  }
}
