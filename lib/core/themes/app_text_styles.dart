import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle headingXl({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: color,
  );

  static TextStyle headingL({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle bodyM({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle bodyS({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: color,
  );

  static TextStyle caption({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: color,
  );
}
