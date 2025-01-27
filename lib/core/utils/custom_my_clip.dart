import 'package:flutter/material.dart';

class MyCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.6);
    path.cubicTo(
      size.width * 0.25,
      size.height * 0.8,
      size.width * 0.75,
      size.height * 0.4,
      size.width,
      size.height * 0.65,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
