import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:just_audio/just_audio.dart';
import 'package:remind_me_app/core/result/result.dart';
import 'package:remind_me_app/core/service/notifications/notifications_service.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_step_model.dart';
import 'package:remind_me_app/domain/repository/routine/routine_repository.dart';
import 'package:remind_me_app/view/routine/routine_add/routine_add_state.dart';
import 'package:remind_me_app/view/routine/routine_detail/routine_detail_action.dart';

class RoutineAddViewModel with ChangeNotifier {
  final RoutineRepository _routineRepository;
  final AudioPlayer _audioPlayer = AudioPlayer();
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

  void toggleAlarmSetting() {
    _state = _state.copyWith(isAlarmSetting: !_state.isAlarmSetting);
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

  void audioStop() async {
    await _audioPlayer.stop();
  }

  void updateSoundPath(String path) async {
    // 1. 상태 업데이트
    if (state.soundFilePath != path) {
      _state = _state.copyWith(soundFilePath: path);
      notifyListeners();

      try {
        // 2. 현재 재생 중인 음악 멈추기
        await _audioPlayer.stop();

        // 3. 새 음악 파일 설정
        await _audioPlayer.setAsset(path);

        // 4. 재생
        _audioPlayer.play();
      } catch (e) {
        print('음악 재생 실패: $e');
      }
    } else {
      await _audioPlayer.stop();
      _state = _state.copyWith(soundFilePath: '');
      notifyListeners();
    }
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

  void removeStep(Map<String, dynamic> items) {
    // final updatedSteps = List<RoutineStepModel>.from(_state.steps)
    //   ..removeAt(index);
    final List<Map<String, dynamic>> saveData = _state.steps;
    final List<Map<String, dynamic>> removeData =
        saveData.where((e) => e != items).toList();
    _state = _state.copyWith(steps: removeData);
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
      id: -1, // 또는 생략 (자동 부여용)
      title: state.title,
      steps: state.steps,
      badgeColor: state.badgeColor,
      routineColor: state.routineColor,
      time: state.time,
      routineIconName: state.routineIconName,
      audioPath: state.soundFilePath,
      isAlarmEnabled: state.isAlarmSetting
    );

    final result = await _routineRepository.addRoutine(routine);
    await _audioPlayer.stop();
    switch (result) {
      case Success():
        context.pop();
      case Error(:final error):
        print(error);
        Fluttertoast.showToast(msg: error);
    }
  }
}
