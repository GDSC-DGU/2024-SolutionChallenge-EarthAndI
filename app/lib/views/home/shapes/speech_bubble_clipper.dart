import 'package:flutter/material.dart';

class SpeechBubbleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double term = size.height * 0.1;
    Path path = Path();

    // Start Point is 0, 50
    path.moveTo(0, term);

    // left
    path.lineTo(0, size.height - term - 10);

    // left bottom
    path.quadraticBezierTo(0, size.height - 10, term, size.height - 10);

    // bottom
    path.lineTo(size.width / 2 - 10, size.height - 10);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width / 2 + 10, size.height - 10);
    path.lineTo(size.width - term, size.height - 10);

    // right bottom
    path.quadraticBezierTo(
        size.width, size.height - 10, size.width, size.height - term - 10);

    // right
    path.lineTo(size.width, term);

    // right top
    path.quadraticBezierTo(size.width, 0, size.width - term, 0);

    // top
    path.lineTo(term, 0);

    // left top
    path.quadraticBezierTo(0, 0, 0, term);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
