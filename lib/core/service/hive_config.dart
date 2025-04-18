import 'package:hive_ce_flutter/adapters.dart';
import 'package:remindme_app/data/data_model/user_data_model.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataModelAdapter());

  await Hive.openBox<UserDataModel>('userBox');
}
