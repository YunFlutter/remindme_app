import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/core/hive/hive_box.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';
import 'package:remindme_app/domain/repository/user/user_repository.dart';
import 'package:remindme_app/view/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  RoutineRepository _routineRepository;

  // HomeViewModel({
  //   required RoutineRepository routineRepository,
  // }) {
  //   _routineRepository = routineRepository;
  //   initPage();
  // }

  HomeViewModel({required RoutineRepository routineRepository})
    : _routineRepository = routineRepository {
    initPage();
  }

  HomeState _state = HomeState();
  final HiveBox _box = HiveBox();

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
