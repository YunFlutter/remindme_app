import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remindme_app/core/constants/result/result.dart';
import 'package:remindme_app/core/hive/hive_box.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';
import 'package:remindme_app/domain/repository/user/user_repository.dart';
import 'package:remindme_app/view/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  late UserRepository _userRepository;
  late RoutineRepository _routineRepository;

  HomeViewModel({
    required UserRepository userRepository,
    required RoutineRepository routineRepository,
  }) {
    _userRepository = userRepository;
    _routineRepository = routineRepository;
    initPage();
  }

  HomeState _state = HomeState();
  HiveBox _box = HiveBox();

  HomeState get state => _state;

  HiveBox get box => _box;

  Future<void> initPage() async {
    final user = box.userBox.get('currentUser');
    final routineListResult = await _routineRepository.getAllRoutines();

    if (user != null) {
      _state = state.copyWith(userName: user.nickname);
      notifyListeners();
    }

    switch (routineListResult) {
      case Success(:final data): // Success(data)
        _state = state.copyWith(routineList: data);
        notifyListeners();
        break;
      case Error(:final error): // Error(error)
        print(error);
        Fluttertoast.showToast(msg: error);
        break;
    }
  }
}
