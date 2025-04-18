import 'package:flutter/material.dart';
import 'package:remindme_app/domain/repository_interface/user_repository.dart';
import 'package:remindme_app/view/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  late UserRepository _userRepository;

  HomeViewModel({required UserRepository userRepository}) {
    _userRepository = userRepository;
    initPage();
  }

   HomeState _state = HomeState();


  HomeState get state => _state;

  void initPage() async {
    final Map<String,dynamic> userInfo = await _userRepository.getUserInfo();
    print(userInfo.toString());
    _state = state.copyWith(userName: userInfo["userName"]);
    notifyListeners();
  }
}
