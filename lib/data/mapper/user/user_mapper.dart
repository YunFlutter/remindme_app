import 'package:remind_me_app/data/data_model/user/user_data_model.dart';
import 'package:remind_me_app/domain/domain_model/user/user_model.dart';

class UserMapper {
  //UserModel로 변환해서 viewModel에 반환
  static UserModel toDomain(UserDataModel dataModel) {
    return UserModel(nickname: dataModel.nickname);
  }

  //UserModel을 UserDataModel로 바꿔서 실행
  static UserDataModel fromDomain(UserModel domainModel) {
    return UserDataModel(nickname: domainModel.nickname);
  }
}
