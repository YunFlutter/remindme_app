import 'package:hive_ce/hive.dart';
import 'package:remindme_app/core/result/result.dart';
import 'package:remindme_app/data/data_model/user/user_data_model.dart';
import 'package:remindme_app/data/mapper/user/user_mapper.dart';
import 'package:remindme_app/domain/domain_model/user/user_model.dart';
import 'package:remindme_app/domain/repository/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {

  final Box<UserDataModel> _userBox; // data source 역할

  const UserRepositoryImpl({
    required Box<UserDataModel> userBox,
  }) : _userBox = userBox;


  @override
  Future<Result<UserModel, String>> loadUser() async{
    try{
      final data = _userBox.get('currentUser');
      if(data == null) return Result.error('저장된 유저가 없습니다');
      return Result.success(UserMapper.toDomain(data));
    } catch(e) {
      return Result.error('유저 로드 실패 : ${e.toString()}');
    }
  }

  @override
  Future<Result<void, String>> saveUser(UserModel user) async{
    try{
      final data = UserMapper.fromDomain(user);
      await _userBox.put('currentUser', data);
      return const Result.success(null);
    }catch(e){
      return Result.error('유저 저장 실패 : ${e.toString()}');
    }
  }


}