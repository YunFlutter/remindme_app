import 'package:hive_ce/hive.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/data/data_model/user_data_model.dart';
import 'package:remindme_app/data/data_source/user/user_data_source.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<Result<Map<String, dynamic>, String>> getUserData() async {
    try {
      final box = Hive.box<UserDataModel>('userBox');
      List<UserDataModel> users = box.values.toList();
      UserModel userModel = users[0].toUserModel();
      return Result.success(userModel.toJson());
    } catch (e) {
      return Result.error("에러 발생: ${e.toString()}");
    }
  }
}
