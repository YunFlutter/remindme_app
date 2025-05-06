import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:remind_me_app/data/data_model/routine/routine_data_model.dart';
import 'package:remind_me_app/data/data_model/user/user_data_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(UserDataModelAdapter());
  Hive.registerAdapter(RoutineDataModelAdapter());

  final userBox = await Hive.openBox<UserDataModel>('userBox');
  final routineBox = await Hive.openBox<RoutineDataModel>('routineBox');



  // // 루틴 데이터 마이그레이션
  // for (var key in routineBox.keys) {
  //   final data = routineBox.get(key);
  //   if (data is RoutineDataModel) {
  //     try {
  //       final fixedMap = Map<String, dynamic>.from(data as Map);
  //       if (fixedMap['steps'] is List) {
  //         fixedMap['steps'] = (fixedMap['steps'] as List)
  //             .map((e) => Map<String, dynamic>.from(e))
  //             .toList();
  //       }
  //       final converted = RoutineDataModel.fromJson(fixedMap);
  //       await routineBox.put(key, converted);
  //     } catch (_) {
  //       await routineBox.delete(key);
  //     }
  //   }
  // }
}
