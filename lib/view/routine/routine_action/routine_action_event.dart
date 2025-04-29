import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_action_event.freezed.dart';

@freezed
sealed class RoutineActionEvent with _$RoutineActionEvent {
  // --- 사용자가 발생시키는 인터랙션 이벤트들 ---

  /// 루틴 시작
  const factory RoutineActionEvent.startRoutine() = StartRoutine;

  /// 루틴 일시정지
  const factory RoutineActionEvent.pauseRoutine() = PauseRoutine;

  /// 루틴 다시 시작
  const factory RoutineActionEvent.resumeRoutine() = ResumeRoutine;

  /// 다음 스텝으로 이동
  const factory RoutineActionEvent.nextStep() = NextStep;

  /// 이전 스텝으로 이동
  const factory RoutineActionEvent.previousStep() = PreviousStep;

  const factory RoutineActionEvent.timerFinished({required String? audioPath}) =
      TimerFinished;
  const factory RoutineActionEvent.moveToNextStep() = MoveToNextStep;
}
