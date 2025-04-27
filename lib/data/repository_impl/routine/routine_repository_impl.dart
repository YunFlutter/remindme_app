import 'package:hive_ce/hive.dart';
import 'package:remind_me_app/core/result/result.dart';
import 'package:remind_me_app/data/data_model/routine/routine_data_model.dart';
import 'package:remind_me_app/data/mapper/routine/routine_mapper.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_step_model.dart';
import 'package:remind_me_app/domain/repository/routine/routine_repository.dart';

class RoutineRepositoryImpl implements RoutineRepository {
  final Box<RoutineDataModel> _box;

  const RoutineRepositoryImpl({required Box<RoutineDataModel> box})
    : _box = box;

  int _getNextId() {
    if (_box.isEmpty) return 0;
    final keys = _box.keys.whereType<int>().toList();
    keys.sort();
    return keys.last + 1;
  }

  @override
  Future<Result<void, String>> addRoutine(RoutineModel model) async {
    try {
      final int id = model.id < 0 ? _getNextId() : model.id;

      final dataModel = routineToDataModel(model.copyWith(id: id));

      await _box.put(id, dataModel);
      return Result.success(null);
    } catch (e) {
      return Result.error('루틴 저장 실패: $e');
    }
  }

  // 루틴 전체 조회
  @override
  Future<Result<List<RoutineModel>, String>> getAllRoutines() async {
    try {
      final list = _box.values.toList();
      list.sort((a, b) => a.id.compareTo(b.id));

      final routines = list.map(dataModelToRoutine).toList();
      return Result.success(routines);
    } catch (e) {
      return Result.error('루틴 불러오기 실패: $e');
    }
  }

  // 루틴 수정
  @override
  Future<Result<void, String>> updateRoutine(
    int index,
    RoutineModel model,
  ) async {
    try {
      if (!_box.containsKey(index)) {
        return Result.error('해당 인덱스의 루틴이 존재하지 않습니다.');
      }

      final updated = routineToDataModel(model.copyWith(id: index));
      await _box.put(index, updated);
      return Result.success(null);
    } catch (e) {
      return Result.error('루틴 수정 실패: $e');
    }
  }

  // 루틴 삭제
  @override
  Future<Result<void, String>> deleteRoutine(int index) async {
    try {
      if (!_box.containsKey(index)) {
        return Result.error('삭제할 루틴이 존재하지 않습니다. (index: $index)');
      }

      await _box.delete(index);
      return Result.success(null);
    } catch (e) {
      return Result.error('루틴 삭제 실패: $e');
    }
  }

  // 루틴 단건 조회
  @override
  Future<Result<RoutineModel, String>> getRoutineById(String id) async {
    try {
      final dataModel = _box.get(id);
      if (dataModel == null) {
        return Result.error('루틴을 찾을 수 없습니다.');
      }
      return Result.success(dataModelToRoutine(dataModel));
    } catch (e) {
      return Result.error('루틴 조회 실패: $e');
    }
  }

  @override
  Future<Result<RoutineModel, String>> deleteStepFromRoutine({
    required int routineId,
    required int stepIndex,
  }) async {
    try {
      final dataModel = _box.get(routineId);
      if (dataModel == null) {
        return Result.error('루틴을 찾을 수 없습니다. (id: $routineId)');
      }

      final currentSteps = List<Map<String, dynamic>>.from(dataModel.steps);

      if (stepIndex < 0 || stepIndex >= currentSteps.length) {
        return Result.error('삭제할 스탭 인덱스가 유효하지 않습니다.');
      }

      currentSteps.removeAt(stepIndex);

      final updatedModel = RoutineDataModel(
        id: dataModel.id,
        title: dataModel.title,
        time: dataModel.time,
        routineIconName: dataModel.routineIconName,
        badgeColor: dataModel.badgeColor,
        routineColor: dataModel.routineColor,
        steps: currentSteps,
      );

      await _box.put(routineId, updatedModel);

      return Result.success(dataModelToRoutine(updatedModel));
    } catch (e) {
      return Result.error('루틴 스탭 삭제 실패: $e');
    }
  }

  @override
  Future<Result<RoutineModel, String>> addStepToRoutine({
    required int routineId,
    required RoutineStepModel newStep,
  }) async {
    try {
      final dataModel = _box.get(routineId);
      if (dataModel == null) {
        return Result.error('루틴을 찾을 수 없습니다. (id: $routineId)');
      }

      // 기존 스탭 목록을 가져와서 새 스탭 추가
      final currentSteps = List<Map<String, dynamic>>.from(dataModel.steps);
      currentSteps.add(newStep.toJson());

      // 루틴 모델 갱신
      final updatedModel = dataModel.copyWith(steps: currentSteps);
      await _box.put(routineId, updatedModel);

      // 도메인 모델로 변환 후 반환
      return Result.success(dataModelToRoutine(updatedModel));
    } catch (e) {
      return Result.error('스탭 추가 중 오류 발생: $e');
    }
  }
}
