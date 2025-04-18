import 'package:flutter/material.dart';
import 'package:remindme_app/view/signUp/sign_up_state.dart';

class SignUpViewModel with ChangeNotifier {
  final SignUpState _state = SignUpState(
    textEditingController: TextEditingController(),
    focusNode: FocusNode(),
  );


  SignUpState get state => _state;

  void initPage(){
    _state.focusNode.addListener(() {});
    _state.textEditingController.addListener(() {
      print(_state.textEditingController.text);
      notifyListeners();
    });
  }

  void unFocus(){
    _state.focusNode.unfocus();
    notifyListeners();
  }
}
