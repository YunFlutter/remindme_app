import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmojiButton extends StatelessWidget {
  final String emoji;
  final Color backGroundColor;
  void Function()? onTap;
  EmojiButton({
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
            child: Text('$emoji', style: TextStyle(
              fontFamily: 'Pretendard',
              fontSize: 32
            ),),
          ),
        ),
      ),
    );
  }
}
