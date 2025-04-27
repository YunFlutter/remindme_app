import 'package:remind_me_app/core/result/result.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_step_model.dart';

abstract interface class RoutineRepository {
  Future<Result<void, String>> addRoutine(RoutineModel model);
  Future<Result<List<RoutineModel>, String>> getAllRoutines();
  Future<Result<void, String>> deleteRoutine(int index);
  Future<Result<void, String>> updateRoutine(int index, RoutineModel model);
  Future<Result<RoutineModel, String>> getRoutineById(String id);
  Future<Result<RoutineModel, String>> deleteStepFromRoutine({
    required int routineId,
    required int stepIndex,
  });
  Future<Result<RoutineModel, String>> addStepToRoutine({
    required int routineId,
    required RoutineStepModel newStep,
  });
}
