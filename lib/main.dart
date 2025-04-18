import 'package:flutter/material.dart';
import 'package:remindme_app/core/service/hive_config.dart';
import 'package:remindme_app/routes/router.dart';

void main() async{
  await initHive();
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
