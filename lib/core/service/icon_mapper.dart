import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

IconData iconData(String name) {
  switch (name) {
    case 'sun':
      return Icons.wb_sunny;
    case 'coffee':
      return Icons.coffee;
    case 'alarm':
      return Icons.alarm;
    default:
      return Icons.help;
  }
}

IconData getLucideIconData(String iconName) {
  const iconMap = {
    'sun': LucideIcons.sun,
    'coffee': LucideIcons.coffee,
    'alarm': LucideIcons.alarmClock,
    'book': LucideIcons.book,
    'check-circle': LucideIcons.circleCheck,
    'brush': LucideIcons.brush,
    'dumbbell': LucideIcons.dumbbell,
    'moon': LucideIcons.moon,
    'utensils': LucideIcons.utensils,
    'notebook': LucideIcons.notebook,
  };

  return iconMap[iconName] ?? LucideIcons.circleHelp; // fallback 아이콘
}
