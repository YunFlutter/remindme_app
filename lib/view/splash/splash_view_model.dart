import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remindme_app/view/splash/splash_state.dart';

class SplashViewModel with ChangeNotifier {
  SplashState _state = SplashState();

  SplashState get state => _state;

  Future firstTextValueChange() async {
    _state = _state.copyWith(firstTextVisible: true);
    notifyListeners();
  }

  Future secondTextValueChange() async {
    _state = _state.copyWith(secondTextVisible: true);
    notifyListeners();
  }

  void textValueChange({
    required int firstMilliseconds,
    required int secondMilliseconds,
    required BuildContext context,
  }) async {
    Future.delayed(Duration(milliseconds: firstMilliseconds), () async {
      await firstTextValueChange();
      notifyListeners();
      Future.delayed(Duration(milliseconds: secondMilliseconds), () async {
        await secondTextValueChange();
        notifyListeners();
        Future.delayed(Duration(seconds: 5), () {
          context.go("/onboarding");
        });
      });
    });
  }
}
