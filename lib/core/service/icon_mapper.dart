import 'package:flutter/material.dart';
import 'package:remindme_app/core/constants/lucide_icon_data_with_keywords.dart';


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