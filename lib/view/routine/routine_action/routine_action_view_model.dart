import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'routine_action_state.dart';
import 'routine_action_event.dart';

class RoutineActionViewModel with ChangeNotifier {
  final RoutineModel model;
  final PageController pageController = PageController();
  final CountDownController timerController = CountDownController();

  RoutineActionState _state = const RoutineActionState();
  RoutineActionState get state => _state;

  RoutineActionEvent? _effect;
  RoutineActionEvent? get effect => _effect;

  RoutineActionViewModel({required this.model});

  List<Map<String, dynamic>> get steps => model.steps;

  void onEvent(RoutineActionEvent event) {
    switch (event) {
      case StartRoutine():
        _state = _state.copyWith(isStarted: true, currentStepIndex: 0);
        timerController.start();
        break;
      case PauseRoutine():
        _state = _state.copyWith(isPaused: true);
        timerController.pause();
        break;
      case ResumeRoutine():
        _state = _state.copyWith(isPaused: false);
        timerController.resume();
        break;
      case NextStep():
        _handleNextStep();
        break;
      case PreviousStep():
        _handlePreviousStep();
        break;
    }
    notifyListeners();
  }

  Future<void> _handleNextStep() async {
    final currentPage = pageController.page?.round() ?? 0;
    _state = _state.copyWith(currentStepIndex: currentPage);
    notifyListeners();
    if (currentPage < steps.length - 1) {
      final nextPage = state.currentStepIndex + 1;

      await pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );

      // 이동한 다음에 바로 상태 업데이트
      _state = _state.copyWith(
        currentStepIndex: nextPage,
        isStarted: false,
        isPaused: false,
      );
      notifyListeners();
    }

  }



  void _handlePreviousStep() {
    if (_state.currentStepIndex > 0) {
      _state = _state.copyWith(currentStepIndex: _state.currentStepIndex - 1);
      pageController.animateToPage(
        _state.currentStepIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void consumeEffect() {
    _effect = null;
  }
}
