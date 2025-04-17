import 'package:flutter/material.dart';

class EmojiButton {
  final String emoji;
  final String label;
  final Color color;

  const EmojiButton({
    required this.emoji,
    required this.label,
    required this.color,
  });
}

class BasicEmojiList {
  static const List<EmojiButton> emojiButtons = [
    EmojiButton(emoji: '\u{1F60A}', label: '기쁨', color: Color(0xFFA3C9FF)),
    EmojiButton(emoji: '\u{1F622}', label: '슬픔', color: Color(0xFFC6B8FF)),
    EmojiButton(emoji: '\u{1F621}', label: '분노', color: Color(0xFFFFB3B3)),
    EmojiButton(emoji: '\u{1F630}', label: '불안', color: Color(0xFFC8F2FF)),
    EmojiButton(emoji: '\u{1F60C}', label: '안정', color: Color(0xFFD5F4D0)),
    EmojiButton(emoji: '\u{1F929}', label: '신남', color: Color(0xFFFFC5D9)),
    EmojiButton(emoji: '\u{1F629}', label: '지침', color: Color(0xFFF0E2D2)),
    EmojiButton(
      emoji: '\u{1F635}\u{200D}\u{1F4AB}',
      label: '혼란',
      color: Color(0xFFD9D4F5),
    ),
  ];
}