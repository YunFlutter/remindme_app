import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remind_me_app/core/constants/adjust_color_brightness.dart';
import 'package:remind_me_app/core/service/hex_to_color.dart';
import 'package:remind_me_app/core/service/icon_mapper.dart';
import 'package:remind_me_app/core/themes/app_text_styles.dart';
import 'package:remind_me_app/core/widgets/ghost_button.dart';
import 'package:remind_me_app/core/widgets/primary_button.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_state.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_event.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart'; // 모델 import
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:remind_me_app/view/routine/routine_action/show_routine_complete_dialog.dart';

class RoutineActionScreen extends StatelessWidget {
  final RoutineActionState state;
  final RoutineModel model;
  final void Function(RoutineActionEvent) onAction;
  final PageController pageController;
  final CountDownController timerController;

  const RoutineActionScreen({
    super.key,
    required this.state,
    required this.model,
    required this.onAction,
    required this.pageController,
    required this.timerController,
  });

  @override
  Widget build(BuildContext context) {
    final steps = model.steps;

    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            context.go('/home');
          },
          icon: LucideIconWidget(icon: LucideIcons.arrowLeft),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,

              itemCount: steps.length,
              itemBuilder: (context, index) {
                final step = steps[index];
                final title = step['title'] ?? '제목 없음';
                final duration = int.parse(step['time']) * 60;

                return Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: hexToColor(model.routineColor),
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(16),
                      child: LucideIconWidget(
                        icon: getLucideIconData(step["icon"]),
                        size: 48,
                      ),
                    ),
                    Text(
                      title,
                      style: AppTextStyles.headingXl(),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: CircularCountDownTimer(

                        duration: duration,
                        textFormat: CountdownTextFormat.MM_SS,
                        isReverse: true,
                        autoStart: false,
                        initialDuration: 0,
                        controller: timerController,
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 1.5,
                        ringColor: hexToColor(model.badgeColor),
                        fillColor: adjustColorBrightness(hexToColor(model.routineColor)),
                        backgroundColor: Colors.white,
                        strokeWidth: 12.0,
                        strokeCap: StrokeCap.round,
                        textStyle: const TextStyle(
                          fontSize: 48.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        onComplete: () {
                          onAction(RoutineActionEvent.timerFinished(audioPath: model.audioPath));
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!state.isStarted)
                  PrimaryButton(
                    buttonText: '시작하기',
                    buttonActive: !state.isStarted,
                    onTap: () {
                      onAction(const RoutineActionEvent.startRoutine());
                    },
                  ),
                if (state.isStarted)
                  GhostButton(
                    buttonText: state.isPaused ? '다시 시작하기' : '잠시 멈추기',
                    onTap: () {
                      if (state.isPaused) {
                        onAction(const RoutineActionEvent.resumeRoutine());
                      } else {
                        onAction(const RoutineActionEvent.pauseRoutine());
                      }
                    },
                  ),
                if (state.isStarted && state.currentStepIndex < steps.length - 1)
                  PrimaryButton(
                    buttonText: '다음 스탭으로',
                    buttonActive: state.isStarted,
                    onTap: () {
                      onAction(const RoutineActionEvent.nextStep());

                    },
                  ),
                if (state.currentStepIndex == steps.length -1)
                  PrimaryButton(
                    buttonText: '루틴 종료',
                    buttonActive: state.currentStepIndex == steps.length -1,
                    onTap: () {
                      showRoutineCompleteDialog(context,routineId: model.id.toString());
                    },
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}