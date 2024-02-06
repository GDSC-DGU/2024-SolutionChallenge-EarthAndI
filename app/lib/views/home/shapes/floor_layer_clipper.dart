import 'package:flutter/material.dart';

class FloorLayerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start Point is 0, 50
    path.moveTo(0, 50);

    // Rectangle is 0, 50 -> 0, size.height -> size.width, size.height -> size.width, 50
    path.lineTo(0, 50);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 50);

    // Quadratic Bezier is size.width, 50 -> size.width / 2, 0 -> 0, 50
    path.quadraticBezierTo(size.width / 2, 0, 0, 50);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
