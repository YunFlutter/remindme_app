import 'package:flutter/material.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';

import 'routine_detail_state.dart';
import 'routine_detail_action.dart';

class RoutineDetailViewModel with ChangeNotifier {
  final RoutineRepository _routineRepository;

  RoutineDetailState _state = const RoutineDetailState();
  RoutineDetailState get state => _state;

  RoutineDetailViewModel({
    required RoutineRepository routineRepository,
  }) : _routineRepository = routineRepository;

  void onAction(BuildContext context, RoutineDetailAction action) {
    switch (action) {
      case ToggleTodayComplete(:final index, :final routine):
        _toggleTodayComplete(index: index, routine: routine);
        break;

      case DeleteRoutine(:final index):
        _deleteRoutine(index: index);
        break;

      case EditRoutine(:final index, :final routine):
        _navigateToEditRoutine(context, routine);
        break;
    }
  }

  Future<void> _toggleTodayComplete({
    required int index,
    required RoutineModel routine,
  }) async {
    final updated = !routine.isCompletedToday;
    final updatedRoutine = routine.copyWith(
      isCompletedToday: updated,
      lastCompletedDate: updated ? DateTime.now() : null,
    );

    final result = await _routineRepository.updateRoutine(index, updatedRoutine);
    switch (result) {
      case Success():
        print("루틴 업데이트 성공");
        break;
      case Error(:final error):
        print("업데이트 실패: $error");
        break;
    }
  }

  Future<void> _deleteRoutine({required int index}) async {
    final result = await _routineRepository.deleteRoutine(index);
    switch (result) {
      case Success():
        print("루틴 삭제 성공");
        break;
      case Error(:final error):
        print("삭제 실패: $error");
        break;
    }
  }

  void _navigateToEditRoutine(BuildContext context, RoutineModel routine) {
    // Navigator.pushNamed(context, "/edit", arguments: routine);
    
  }
}