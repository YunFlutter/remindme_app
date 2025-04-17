import 'package:flutter/cupertino.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class RoutineCardModel {
  final IconData icons;
  final Color badgeColor;
  final Color badgeBackGroundColor;
  final String routineTitle;
  final String routineTime;
  final VoidCallback? onTap;

  const RoutineCardModel({
    required this.icons,
    required this.badgeColor,
    required this.badgeBackGroundColor,
    required this.routineTitle,
    required this.routineTime,
    this.onTap,
  });
}
