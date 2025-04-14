import 'package:flutter/material.dart';

class AppTextStyles {
  // --------------------------
  // ✨ Heading
  // --------------------------
  static TextStyle headingXl({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.3, // LineHeight: Automatic → 1.3 추천
    letterSpacing: 0,
    color: color,
  );

  static TextStyle headingL({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 20,
    fontWeight: FontWeight.w600, // SemiBold
    height: 1.3,
    letterSpacing: 0,
    color: color,
  );

  // --------------------------
  // ✏️ Body
  // --------------------------
  static TextStyle bodyM({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: 0,
    color: color,
  );

  static TextStyle bodyS({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.4,
    letterSpacing: 0,
    color: color,
  );

  static TextStyle buttonText({Color color = Colors.white}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.3,
    letterSpacing: 0,
    color: color,
  );

  // --------------------------
  // 📍 Caption
  // --------------------------
  static TextStyle caption({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    fontWeight: FontWeight.w300, // Light
    height: 1.3,
    letterSpacing: 0,
    color: color,
  );

  // --------------------------
  // 🧭 Navigation Text
  // --------------------------
  static TextStyle navSelected({Color color = Colors.black}) => TextStyle(
    fontFamily: 'Pretendard',
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.3,
    letterSpacing: 0,
    color: color,
  );

  static TextStyle navUnselected({Color color = const Color(0xFFAAAAAA)}) =>
      TextStyle(
        fontFamily: 'Pretendard',
        fontSize: 12,
        fontWeight: FontWeight.normal,
        height: 1.3,
        letterSpacing: 0,
        color: color,
      );
}
