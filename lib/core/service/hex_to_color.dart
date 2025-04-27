import 'package:flutter/material.dart';

Color hexToColor(String hexCode) {
  final cleanedHex = hexCode.replaceAll('#', '');

  // #RGB 형식 지원
  if (cleanedHex.length == 3) {
    final r = cleanedHex[0] * 2;
    final g = cleanedHex[1] * 2;
    final b = cleanedHex[2] * 2;
    return Color(int.parse('FF$r$g$b', radix: 16));
  }

  // #RRGGBB 형식
  if (cleanedHex.length == 6) {
    return Color(int.parse('FF$cleanedHex', radix: 16));
  }

  // #AARRGGBB 형식
  if (cleanedHex.length == 8) {
    return Color(int.parse(cleanedHex, radix: 16));
  }

  throw FormatException("올바르지 않은 색상 코드 형식입니다: $hexCode");
}