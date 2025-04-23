import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';

part 'routine_detail_action.freezed.dart';

@freezed
sealed class RoutineDetailAction with _$RoutineDetailAction {
  const factory RoutineDetailAction.toggleTodayComplete({
    required int index,
    required RoutineModel routine,
  }) = ToggleTodayComplete;

  const factory RoutineDetailAction.deleteRoutine({required int index}) =
      DeleteRoutine;

  const factory RoutineDetailAction.editRoutine({
    required int index,
    required RoutineModel routine,
  }) = EditRoutine;
}
