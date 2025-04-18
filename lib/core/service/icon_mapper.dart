import 'package:flutter/material.dart';
import 'package:remindme_app/core/constants/lucide_icon_data_with_keywords.dart';

String iconToJson(IconData icon) {
  return icon.toString(); // IconData(U+xxxxx)
}

IconData iconFromJson(String iconString) {
  return lucideIconData.firstWhere(
        (item) => item['icon'].toString() == iconString,
    orElse: () => lucideIconData.first,
  )['icon'];
}