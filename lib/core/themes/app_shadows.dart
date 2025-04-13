import 'package:flutter/material.dart';

class AppShadows {
  static const BoxShadow light = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.06),
    offset: Offset(0, 2),
    blurRadius: 4,
  );

  static const BoxShadow medium = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.1),
    offset: Offset(0, 4),
    blurRadius: 10,
  );

  static const BoxShadow heavy = BoxShadow(
    color: Color.fromRGBO(0, 0, 0, 0.15),
    offset: Offset(0, 8),
    blurRadius: 20,
  );
}
