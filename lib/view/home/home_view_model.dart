import 'package:flutter/material.dart';
import 'package:remindme_app/domain/repository_interface/user_repository.dart';

class HomeViewModel with ChangeNotifier {
  UserRepository _userRepository;

  HomeViewModel({required UserRepository userRepository})
    : _userRepository = userRepository;
}
