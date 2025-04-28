import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me_app/core/widgets/ghost_button.dart';
import 'package:remind_me_app/core/widgets/primary_button.dart';
import 'package:remind_me_app/domain/use_case/routine/complete_routine_use_case.dart';

Future<bool> showAppOutDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false, // 밖 터치해서 닫히지 않게
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('🥲', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            const Text(
              '정말 나가시겠어요?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '조금만 더 머물러도 괜찮아요.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            GhostButton(
              buttonText: '나가기',
              onTap: () async {
                Navigator.of(context).pop(true);
              },
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              buttonText: '돌아가기',
              buttonActive: true,
              onTap: () async {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        ),
      );
    },
  );
  return result ?? false;
}
