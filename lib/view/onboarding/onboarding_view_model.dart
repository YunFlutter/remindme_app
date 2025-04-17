import 'package:flutter/material.dart';
import 'package:remindme_app/view/onboarding/onboarding_state.dart';

class OnboardingViewModel with ChangeNotifier {
  OnboardingState _state;

  OnboardingViewModel({required OnboardingState state}) : _state = state;

  OnboardingState get state => _state;

  PageController pageController = PageController();

  void setPageInt(int newPage) {
    _state = state.copyWith(pageInt: newPage);
    notifyListeners();
  }

  void pageIntPlus() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void pageIntMinus() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
