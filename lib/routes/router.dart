import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:remindme_app/routes/page_transitions.dart';
import 'package:remindme_app/routes/routes.dart';
import 'package:remindme_app/view/onboarding/onboarding_screen.dart';
import 'package:remindme_app/view/onboarding/onboarding_state.dart';
import 'package:remindme_app/view/onboarding/onboarding_view_model.dart';
import 'package:remindme_app/view/splash/splash_screen.dart';
import 'package:remindme_app/view/splash/splash_view_model.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder:
          (context, state) => SplashScreen(
            viewModel:
                SplashViewModel()..textValueChange(
                  firstMilliseconds: 1500,
                  secondMilliseconds: 3000,
                  context: context,
                ),
          ),
    ),
    GoRoute(
      path: Routes.onboarding,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: OnboardingScreen(viewModel: OnboardingViewModel(state: OnboardingState()),),
          transitionsBuilder: PageTransitions.slideFadeFromRight,
          transitionDuration: const Duration(milliseconds: 1500)
        );
      },
    ),
  ],
);
