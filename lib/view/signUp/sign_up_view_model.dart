import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:remindme_app/core/constants/result/result.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';
import 'package:remindme_app/domain/repository/user/user_repository.dart';
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
    final Result<void, String> userSave = await _userRepository.saveUser(
      UserModel(nickname: text),
    );
    switch (userSave) {
      case Success<void, String>():
        context.go('/home');
      case Error<void, String>():
        Fluttertoast.showToast(msg: "유저 등록 실패");
    }
  }

  void unFocus() {
    _state.focusNode.unfocus();
    notifyListeners();
  }
}
