import 'package:flutter/material.dart';
import 'package:remindme_app/core/hive/hive_box.dart';
import 'package:remindme_app/domain/repository/user/user_repository.dart';
import 'package:remindme_app/view/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  late UserRepository _userRepository;

  HomeViewModel({required UserRepository userRepository}) {
    _userRepository = userRepository;
    initPage();
  }

  HomeState _state = HomeState();
  HiveBox _box = HiveBox();

  HomeState get state => _state;

  HiveBox get box => _box;

  void initPage() {
    final user = box.userBox.get('currentUser');
    if (user != null) _state = state.copyWith(userName: user.nickname);
  }
}
