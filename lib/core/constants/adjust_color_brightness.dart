import 'package:flutter/material.dart';

Color adjustColorBrightness(Color color) {
  final luminance = color.computeLuminance();

  final hsl = HSLColor.fromColor(color);

  // 진한 색이면 → 파스텔톤 (lightness ↑, saturation ↓)
  if (luminance < 0.4) {
    return hsl
        .withLightness((hsl.lightness + 0.3).clamp(0.0, 1.0))
        .withSaturation((hsl.saturation - 0.3).clamp(0.0, 1.0))
        .toColor();
  }
  // 연한 색이면 → 원색 느낌 (lightness ↓, saturation ↑)
  else {
    return hsl
        .withLightness((hsl.lightness - 0.2).clamp(0.0, 1.0))
        .withSaturation((hsl.saturation + 0.2).clamp(0.0, 1.0))
        .toColor();
  }
}


Color getContrastingTextColor(Color backgroundColor) {
  // 밝기 계산 (standard formula)
  double brightness = (backgroundColor.red * 299 +
      backgroundColor.green * 587 +
      backgroundColor.blue * 114) /
      1000;

  // 밝기가 128보다 크면 어두운 색 (검정), 아니면 밝은 색 (흰색)
  return brightness > 128 ? Colors.black : Colors.white;
}