import 'package:remindme_app/domain/domain_model/user/user_model.dart';

abstract interface class UserRepository {
  Future<Map<String, dynamic>> getUserInfo();

  Future<UserModel> saveUserName({required String name});
}
