import 'package:flutter/material.dart';
import 'package:remindme_app/view/signUp/sign_up_state.dart';

class SignUpViewModel with ChangeNotifier {
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
      print(_state.textEditingController.text);
      notifyListeners();
    });
  }

  void unFocus() {
    _state.focusNode.unfocus();
    notifyListeners();
  }
}
