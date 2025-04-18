import 'package:remindme_app/core/result/result.dart';

abstract interface class UserDataSource {
  Future<Result<Map<String,dynamic>,String>> getUserData();
}