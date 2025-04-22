import 'package:hive_ce/hive.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/data/data_model/routine/routine_data_model.dart';
import 'package:remindme_app/data/mapper/routine/routine_mapper.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';

class RoutineRepositoryImpl implements RoutineRepository {
  final Box<RoutineDataModel> routineBox;

  const RoutineRepositoryImpl({required this.routineBox});

  @override
  Future<Result<void, String>> addRoutine(RoutineModel model) async {
    try {
      final data = RoutineMapper.toDataModel(model);
      await routineBox.add(data);
      return Result.success(null);
    } catch (e) {
      return Result.error('루틴 저장 중 오류: $e');
    }
  }

  @override
  Future<Result<void, String>> deleteRoutine(int index) async {
    try {
      await routineBox.delete(index);
      return Result.success(null);
    } catch (e) {
      return Result.error('루틴 삭제 중 오류 : $e');
    }
  }

  @override
  Future<Result<List<RoutineModel>, String>> getAllRoutines() async {
    try {
      final all = routineBox.values.map(RoutineMapper.toDomainModel).toList();
      return Result.success(all);
    } catch (e) {
      return Result.error('루틴 불러오기 실패: $e');
    }
  }

  @override
  Future<Result<void, String>> updateRoutine(
    int index,
    RoutineModel model,
  ) async {
    try {
      final updated = RoutineMapper.toDataModel(model);
      await routineBox.putAt(index, updated);
      return const Result.success(null);
    } catch (e) {
      return Result.error('루틴 수정 실패: $e');
    }
  }
}
