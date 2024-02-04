import 'package:flutter/material.dart';

class CustomBottomNavigationBarShape extends ShapeBorder {
  const CustomBottomNavigationBarShape();

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path.combine(
      PathOperation.difference,
      Path()
        ..addRRect(RRect.fromRectAndRadius(rect, const Radius.circular(0)))
        ..close(),
      Path()
        ..addOval(Rect.fromCenter(
            center: rect.center.translate(0, -rect.height / 2),
            height: 80.0,
            width: 80.0))
        ..close(),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) => this;
}
