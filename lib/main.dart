import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:remindme_app/core/hive/hive_init.dart';
import 'package:remindme_app/routes/router.dart';

import 'data/data_model/user/user_data_model.dart';

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
