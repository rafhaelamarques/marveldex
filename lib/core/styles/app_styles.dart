import 'package:flutter/material.dart';

abstract class AppStyles {
  // Colors
  static const Color darkRed = Color.fromRGBO(128, 0, 0, 1);
  static const Color midRed = Color.fromRGBO(164, 1, 30, 1);
  static const Color lightRed = Color.fromRGBO(255, 0, 0, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color grey = Color.fromRGBO(128, 128, 128, 1);
  static const Color darkGrey = Color.fromRGBO(84, 83, 83, 1);
  static const Color black = Color.fromRGBO(0, 0, 0, 1);
  static const Color green = Color.fromRGBO(0, 128, 0, 1);
  static const Color orange = Color.fromRGBO(255, 165, 0, 1);
  static const Color shimmerBaseColor = Color.fromARGB(134, 235, 235, 235);
  static const Color shimmerHighlightColor = Color.fromARGB(113, 185, 185, 185);

  // Text Styles
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
}
