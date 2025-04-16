import 'package:flutter/material.dart';
import 'package:remindme_app/view/onboarding/onboarding_state.dart';

class OnboardingViewModel with ChangeNotifier {
   OnboardingState _state;

  OnboardingViewModel({
    required OnboardingState state,
  }) : _state = state;

  OnboardingState get state => _state;

  void firstValueChange() async{
    Future.delayed(Duration(seconds: 2), () {
      _state = state.copyWith(firstOpacity: 1.0);
      notifyListeners();
    });
  }


}
