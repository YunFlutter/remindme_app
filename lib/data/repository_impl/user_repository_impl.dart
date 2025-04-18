import 'package:hive_ce/hive.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/data/data_model/user_data_model.dart';
import 'package:remindme_app/data/data_source/user/user_data_source.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';
import 'package:remindme_app/domain/repository_interface/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;
  const UserRepositoryImpl({required UserDataSource userDataSource})
    : _userDataSource = userDataSource;

  @override
  Future<Map<String, dynamic>> getUserInfo() async {
    final result = await _userDataSource.getUserData();

    switch (result) {
      case Success<Map<String, dynamic>, String>():
        return result.data;
      case Error<Map<String, dynamic>, String>():
        return {'error': result.error};
    }
  }

  @override
  Future<UserModel> saveUserName({required String name}) async {
    final box = Hive.box<UserDataModel>('userBox');
    final UserDataModel userDataModel = UserDataModel(userName: name);
    box.add(userDataModel);
    return userDataModel.toUserModel();
  }
}
