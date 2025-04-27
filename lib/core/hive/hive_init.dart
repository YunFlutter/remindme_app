import 'package:hive_ce_flutter/adapters.dart';
import 'package:remind_me_app/data/data_model/routine/routine_data_model.dart';
import 'package:remind_me_app/data/data_model/routine/routine_step_data_model.dart';
import 'package:remind_me_app/data/data_model/user/user_data_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserDataModelAdapter());
  Hive.registerAdapter(RoutineDataModelAdapter());

  await Hive.openBox<UserDataModel>('userBox');
  await Hive.openBox<RoutineDataModel>('routineBox');
}
