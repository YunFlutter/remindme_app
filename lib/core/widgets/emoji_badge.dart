import 'package:flutter/material.dart';

class EmojiBadge extends StatelessWidget {
  final String emoji;
  final Color backGroundColor;
  final void Function()? onTap;
  const EmojiBadge({
    super.key,
    required this.emoji,
    required this.backGroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backGroundColor,
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          borderRadius: BorderRadius.circular(100),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              emoji,
              style: TextStyle(fontFamily: 'Pretendard', fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }
}
