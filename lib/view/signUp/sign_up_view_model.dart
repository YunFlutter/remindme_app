import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remindme_app/domain/repository_interface/user_repository.dart';
import 'package:remindme_app/view/signUp/sign_up_state.dart';

class SignUpViewModel with ChangeNotifier {
  final UserRepository _userRepository;
  SignUpViewModel({required UserRepository userRepository})
    : _userRepository = userRepository;

  SignUpState _state = SignUpState(
    textEditingController: TextEditingController(),
    focusNode: FocusNode(),
  );

  SignUpState get state => _state;

  void initPage() async {
    await Future.delayed(const Duration(milliseconds: 500), () {
          _state = state.copyWith(pageOpacity: true);
          notifyListeners();
        })
        .then((_) async {
          await Future.delayed(const Duration(milliseconds: 500), () {
            _state = _state.copyWith(isTitleVisible: true);
            notifyListeners();
          });
        })
        .then((_) async {
          await Future.delayed(const Duration(milliseconds: 500), () {
            _state = _state.copyWith(isFieldVisible: true);
            notifyListeners();
          });
        });

    _state.focusNode.addListener(() {});
    _state.textEditingController.addListener(() {
      notifyListeners();
    });
  }

  void saveName({required String text, required BuildContext context}) async {
    final Map<String, dynamic> userNameMap =
        await _userRepository.getUserInfo();
    final String? userName = userNameMap["username"];

    if (userName == null) {
      final userModel = await _userRepository.saveUserName(name: text);
      context.go("/home");
    }else{
      print("이미 등록된 이름이 존재함");
    }
  }

  void unFocus() {
    _state.focusNode.unfocus();
    notifyListeners();
  }
}
