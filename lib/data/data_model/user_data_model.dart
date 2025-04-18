import 'package:hive_ce_flutter/adapters.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';
part 'user_data_model.g.dart';

@HiveType(typeId: 0)
class UserDataModel extends HiveObject {
  @HiveField(0)
  final String userName;

  UserDataModel({required this.userName});

  UserModel toUserModel() => UserModel(userName: userName);

  factory UserDataModel.fromDataModel(UserModel model) =>
      UserDataModel(userName: model.userName);
}
