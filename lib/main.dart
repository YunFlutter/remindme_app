import 'package:flutter/material.dart';
import 'package:remind_me_app/core/hive/hive_init.dart';
import 'package:remind_me_app/core/service/di_setup.dart';
import 'package:remind_me_app/routes/router.dart';

import 'domain/use_case/routine/reset_routine_completion_use_case.dart';

void main() async {
  await initHive();
  diSetUp();
  final resetRoutineUseCase = ResetRoutineCompletionUseCase();
  await resetRoutineUseCase.execute();
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
