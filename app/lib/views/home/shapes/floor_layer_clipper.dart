import 'package:flutter/material.dart';

class FloorLayerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start Point is 0, 50
    path.moveTo(0, 50);

    // left
    path.lineTo(0, size.height);

    // bottom
    path.lineTo(size.width, size.height);

    // right
    path.lineTo(size.width, 50);

    // top
    path.quadraticBezierTo(size.width / 2, 0, 0, 50);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
