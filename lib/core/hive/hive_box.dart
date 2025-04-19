import 'package:hive_ce/hive.dart';
import 'package:remindme_app/data/data_model/user/user_data_model.dart';

class HiveBox {
  final userBox = Hive.box<UserDataModel>('userBox');

}
