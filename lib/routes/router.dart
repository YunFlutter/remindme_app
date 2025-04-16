import 'package:go_router/go_router.dart';
import 'package:remindme_app/routes/routes.dart';
import 'package:remindme_app/view/splash/splash_screen.dart';
import 'package:remindme_app/view/splash/splash_view_model.dart';

final GoRouter router = GoRouter(
  initialLocation: Routes.splash,
  routes: [
    GoRoute(path: Routes.splash, builder: (context, state) => SplashScreen(viewModel: SplashViewModel()..textValueChange(firstMilliseconds: 500, secondMilliseconds: 1000),)),
  ],
);
