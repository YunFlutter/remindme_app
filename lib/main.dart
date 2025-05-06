import 'package:flutter/material.dart';
import 'package:remind_me_app/core/hive/hive_init.dart';
import 'package:remind_me_app/core/service/check_android_permission.dart';
import 'package:remind_me_app/core/service/di_setup.dart';
import 'package:remind_me_app/core/service/notifications/initialize_constants.dart';
import 'package:remind_me_app/routes/router.dart';

import 'core/service/notifications/notifications_service.dart';
import 'domain/use_case/routine/reset_routine_completion_use_case.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupTimezone();
  await initHive();
  diSetUp();

  final resetRoutineUseCase = ResetRoutineCompletionUseCase();
  await resetRoutineUseCase.execute();

  await initializeNotification();
  await printAllScheduledNotifications();
  runApp(RemindMe());
}

class RemindMe extends StatelessWidget {
  const RemindMe({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(

      title: 'ReMindMe',
      theme: ThemeData(fontFamily: 'Pretendard'),
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
