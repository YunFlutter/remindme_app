import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_action_state.freezed.dart';

@freezed
abstract class RoutineActionState with _$RoutineActionState {
  const factory RoutineActionState({
    @Default(false) bool isStarted,
    @Default(false) bool isPaused,
    @Default(0) int currentStepIndex,
  }) = _RoutineActionState;
}