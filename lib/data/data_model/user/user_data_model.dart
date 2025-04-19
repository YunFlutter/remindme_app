import 'package:hive_ce/hive.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';
part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserDataModel extends HiveObject {
  @HiveField(0)
  final String nickname;

  UserDataModel({required this.nickname});

}