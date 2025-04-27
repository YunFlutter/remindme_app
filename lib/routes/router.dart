import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_ce/hive.dart';
import 'package:remind_me_app/core/hive/hive_box.dart';
import 'package:remind_me_app/core/service/di_setup.dart';
import 'package:remind_me_app/core/themes/app_colors.dart';
import 'package:remind_me_app/core/widgets/custom_navigation_bar.dart';
import 'package:remind_me_app/data/data_model/user/user_data_model.dart';
import 'package:remind_me_app/data/repository_impl/routine/routine_repository_impl.dart';
import 'package:remind_me_app/data/repository_impl/user/user_repository_impl.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/routes/page_transitions.dart';
import 'package:remind_me_app/routes/routes.dart';
import 'package:remind_me_app/view/home/home_screen.dart';
import 'package:remind_me_app/view/home/home_view_model.dart';
import 'package:remind_me_app/view/onboarding/onboarding_screen.dart';
import 'package:remind_me_app/view/onboarding/onboarding_state.dart';
import 'package:remind_me_app/view/onboarding/onboarding_view_model.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_screen_root.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_view_model.dart';
import 'package:remind_me_app/view/routine/routine_add/routine_add_screen.dart';
import 'package:remind_me_app/view/routine/routine_add/routine_add_view_model.dart';
import 'package:remind_me_app/view/routine/routine_detail/routine_detail_screen_root.dart';
import 'package:remind_me_app/view/signUp/sign_up_screen.dart';
import 'package:remind_me_app/view/signUp/sign_up_view_model.dart';
import 'package:remind_me_app/view/splash/splash_screen.dart';
import 'package:remind_me_app/view/splash/splash_view_model.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) {
        final viewModel = SplashViewModel();
        viewModel.textValueChange(
          firstMilliseconds: 300,
          secondMilliseconds: 3000,
          context: context,
        );
        return SplashScreen(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.onboarding,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: OnboardingScreen(
            viewModel: OnboardingViewModel(state: OnboardingState()),
          ),
          transitionsBuilder: PageTransitions.fade,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    ),
    GoRoute(
      path: Routes.signUp,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: SignUpScreen(viewModel: getIt()),
          transitionsBuilder: PageTransitions.fade,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    ),
    GoRoute(
      path: Routes.routineAdd,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: RoutineAddScreen(viewModel: getIt()),
          transitionsBuilder: PageTransitions.fade,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    ),
    GoRoute(
      path: Routes.routineDetail,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: RoutineDetailScreenRoot(
            routineModel: state.extra as RoutineModel,
            viewModel: getIt(),
          ),
          transitionsBuilder: PageTransitions.slideFadeFromRight,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    ),
    GoRoute(
      path: Routes.routineActive,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: RoutineActionScreenRoot(
            viewModel: RoutineActionViewModel(model: state.extra as RoutineModel),
          ),
          transitionsBuilder: PageTransitions.slideFadeFromRight,
          transitionDuration: const Duration(milliseconds: 300),
        );
      },
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: AppColors.baseWhite,
          body: Column(
            children: [
              Expanded(child: child),
              // CustomNavigationBar(
              //   nowPagePath: GoRouterState.of(context).fullPath.toString(),
              // ),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: HomeScreen(viewModel: getIt()),
              transitionsBuilder: PageTransitions.fade,
              transitionDuration: const Duration(milliseconds: 500),
            );
          },
        ),
      ],
    ),
  ],
);
