import 'package:flutter/material.dart';
import 'package:remindme_app/view/routine/routine_add/routine_add_state.dart';

class RoutineAddViewModel with ChangeNotifier {
  RoutineAddState _state = RoutineAddState();

  RoutineAddState get state => _state;


  void updateTitle(String value) {
    _state = _state.copyWith(title: value);
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
}
