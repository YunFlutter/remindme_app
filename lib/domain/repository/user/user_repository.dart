import 'package:remind_me_app/core/result/result.dart';
import 'package:remind_me_app/domain/domain_model/user/user_model.dart';

abstract interface class UserRepository {
  Future<Result<UserModel, String>> loadUser();
  Future<Result<void, String>> saveUser(UserModel user);
}
