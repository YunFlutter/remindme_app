import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'routine_action_state.dart';
import 'routine_action_event.dart';

class RoutineActionViewModel with ChangeNotifier {
  final RoutineModel model;
  final PageController pageController = PageController();
  final AudioPlayer _audioPlayer = AudioPlayer();
  final CountDownController timerController = CountDownController();

  RoutineActionState _state = const RoutineActionState();
  RoutineActionState get state => _state;

  RoutineActionEvent? _effect;
  RoutineActionEvent? get effect => _effect;

  RoutineActionViewModel({required this.model});

  List<Map<String, dynamic>> get steps => model.steps;

  Future<void> playSound(String path) async {
    try {
      await _audioPlayer.stop(); // ✅ 재생 중이면 정지
      await _audioPlayer.setAsset(path);
      await _audioPlayer.play();
    } catch (e) {
      print('오디오 재생 오류: $e');
    }
  }

  Future<void> stopSound() async {
    try {
      await _audioPlayer.stop();
    } catch (e) {
      print('오디오 정지 오류: $e');
    }
  }



  void onEvent(RoutineActionEvent event)async {
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
        await stopSound();
        _handleNextStep();
        break;
      case PreviousStep():
        await stopSound();
        _handlePreviousStep();
        break;
      case TimerFinished():
        if (event.audioPath != null && event.audioPath!.isNotEmpty) {
          await playSound(event.audioPath!);
        }
      case MoveToNextStep():
        await stopSound();
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

  void dispose() {
    _audioPlayer.dispose(); // ✅ 메모리 누수 방지
    // (기존 dispose 코드 있으면 같이)
  }
}
