import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_step_model.dart';

part 'routine_detail_action.freezed.dart';

@freezed
sealed class RoutineDetailAction with _$RoutineDetailAction {
  const factory RoutineDetailAction.pageInit({required RoutineModel model}) = pageInit;
  const factory RoutineDetailAction.removeRoutine({required int routineId}) = removeRoutine;
  const factory RoutineDetailAction.removeRoutineStep({
    required int routineId,
    required int stepIndex,
  }) = removeRoutineStep;
  const factory RoutineDetailAction.addRoutineStep({
    required int routineId,
    required RoutineStepModel newStep,
  }) = addRoutineStep;
  const factory RoutineDetailAction.updateRoutineStep({
    required int stepIndex,
    required RoutineStepModel updatedStep,
  }) = updateRoutineStep;

  const factory RoutineDetailAction.toggleVibrateMode({
    required int routineId,
    required bool isVibrateMode,
  }) = toggleVibrateMode;

  const factory RoutineDetailAction.toggleAlarm({
    required int routineId,
    required bool isAlarm,
  }) = toggleAlarm;
}