import 'package:flutter/cupertino.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/constants/adjust_color_brightness.dart';

class RoutineCardModel {
  final IconData icons;
  final Color badgeColor;
  final Color badgeBackGroundColor;
  final String routineTitle;
  final String routineTime;
  final VoidCallback? onTap;

  RoutineCardModel({
    required this.icons,
    required String badgeColor,
    required String badgeBackGroundColor,
    required this.routineTitle,
    required this.routineTime,
    this.onTap,
  })  : badgeColor = adjustColorBrightness(_hexToColor(badgeColor)),
        badgeBackGroundColor = _hexToColor(badgeBackGroundColor);

  static Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}