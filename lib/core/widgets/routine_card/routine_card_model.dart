import 'package:flutter/cupertino.dart';
import 'package:remind_me_app/core/constants/adjust_color_brightness.dart';
import 'package:remind_me_app/core/service/hex_to_color.dart';

class RoutineCardModel {
  final int index;
  final IconData icons;
  final Color badgeColor;
  final Color badgeBackGroundColor;
  final String routineTitle;
  final String routineTime;
  final bool isCompletedToday; // ⭐ 완료 여부 추가
  final VoidCallback? onTap;

  RoutineCardModel({
    required this.index,
    required this.icons,
    required String badgeColor,
    required String badgeBackGroundColor,
    required this.routineTitle,
    required this.routineTime,
    required this.isCompletedToday, // ⭐ 필수 추가
    this.onTap,
  })  : badgeColor = hexToColor(badgeColor),
        badgeBackGroundColor = hexToColor(badgeBackGroundColor);
}