import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_step_model.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';
import 'package:remindme_app/view/routine/routine_add/routine_add_state.dart';

class RoutineAddViewModel with ChangeNotifier {
  final RoutineRepository _routineRepository;

  RoutineAddViewModel({required RoutineRepository routineRepository})
    : _routineRepository = routineRepository;

  RoutineAddState _state = RoutineAddState();

  RoutineAddState get state => _state;

  void updateTitle(String value) {
    _state = _state.copyWith(title: value);
    _state.titleTextEditingController.text = value;
    notifyListeners();
  }

  void updateTime(String value) {
    _state = _state.copyWith(time: value);
    notifyListeners();
  }

  void toggleAnimationVisible() {
    _state = _state.copyWith(isAnimatedVisible: !_state.isAnimatedVisible);
    notifyListeners();
  }

  void updateRoutineIcon(String iconName) {
    _state = _state.copyWith(routineIconName: iconName);
    notifyListeners();
  }

  void updateBadgeColor(String color) {
    _state = _state.copyWith(badgeColor: color);
    notifyListeners();
  }

  void updateRoutineColor(String color) {
    _state = _state.copyWith(routineColor: color);
    notifyListeners();
  }

  void addStep({
    required String title,
    required String iconName,
    required int durationMinutes,
  }) {
    final currentSteps = _state.steps;
    final newOrder = currentSteps.length;

    final newStep = {
      'title': title,
      'icon': iconName,
      'time': durationMinutes.toString(),
    };

    _state = _state.copyWith(steps: [...currentSteps, newStep]);
    notifyListeners();
  }

  void removeStep(int index) {
    final updatedSteps = List<RoutineStepModel>.from(_state.steps)
      ..removeAt(index);
    notifyListeners();
  }

  Future<void> saveRoutine({required BuildContext context}) async {
    if (state.title.trim().isEmpty ||
        state.time.trim().isEmpty ||
        state.routineIconName.trim().isEmpty ||
        state.badgeColor.trim().isEmpty ||
        state.routineColor.trim().isEmpty ||
        state.steps.isEmpty) {
      Fluttertoast.showToast(msg: "모든 항목을 입력해주세요.");
      return;
    }

    final timeRegex = RegExp(r'^([01]\d|2[0-3]):[0-5]\d$');

    if (!timeRegex.hasMatch(state.time)) {
      Fluttertoast.showToast(msg: '시간 형식이 잘못되었습니다 (예: 19:00)');
      return;
    }

    _state = _state.copyWith(isSubmitting: true, isSuccess: false);
    notifyListeners();

    final routine = RoutineModel(
      title: state.title,
      steps: state.steps,
      badgeColor: state.badgeColor,
      routineColor: state.routineColor,
      time: state.time,
      routineIconName: state.routineIconName,
    );

    final result = await _routineRepository.addRoutine(routine);

    switch (result) {
      case Success():
        context.pop();
      case Error(:final error):
        print(error);
        Fluttertoast.showToast(msg: error);
    }
  }
}
