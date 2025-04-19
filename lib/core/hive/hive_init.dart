import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:remindme_app/data/data_model/user/user_data_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserDataModelAdapter());

  await Hive.openBox<UserDataModel>('userBox');
}
