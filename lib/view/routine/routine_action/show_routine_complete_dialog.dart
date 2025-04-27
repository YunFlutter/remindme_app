import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remind_me_app/core/widgets/primary_button.dart';
import 'package:remind_me_app/domain/use_case/routine/complete_routine_use_case.dart';

void showRoutineCompleteDialog(
  BuildContext context, {
  required String routineId,
}) {
  final completeRoutineUseCase = CompleteRoutineUseCase();
  showDialog(
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
            const Text('🎉', style: TextStyle(fontSize: 64)),
            const SizedBox(height: 16),
            const Text(
              '루틴 완료!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              '멋지게 루틴을 완료했어요!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              buttonText: '확인',
              buttonActive: true,
              onTap: () async {
                await completeRoutineUseCase.execute(routineId: routineId).then(
                  (value) {
                    Navigator.of(context).pop();
                    context.go('/home');
                  },
                );
              },
            ),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pop(); // 모달 닫기
            //     },
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.blueAccent,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       padding: const EdgeInsets.symmetric(vertical: 16),
            //     ),
            //     child: const Text(
            //       '확인',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ),
            // ),
          ],
        ),
      );
    },
  );
}
