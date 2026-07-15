import 'package:flutter/material.dart';

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 25);

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height - 50,
      size.width * 0.5,
      size.height - 25,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height,
      size.width,
      size.height - 25,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}