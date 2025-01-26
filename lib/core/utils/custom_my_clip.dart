import 'package:flutter/material.dart';

class MyCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.7);
    path.cubicTo(
      size.width / 4,
      1.7 * (size.height / 2),
      4 * (size.width / 6),
      size.height / 2,
      size.width,
      size.height * 0.65,
    );
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
