import 'package:remindme_app/core/constants/result/result.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';

abstract interface class RoutineRepository {
  Future<Result<void, String>> addRoutine(RoutineModel model);
  Future<Result<List<RoutineModel>, String>> getAllRoutines();
  Future<Result<void, String>> deleteRoutine(int index);
  Future<Result<void, String>> updateRoutine(int index, RoutineModel model);
}