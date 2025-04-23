import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:remindme_app/core/hive/hive_box.dart';
import 'package:remindme_app/data/repository_impl/routine/routine_repository_impl.dart';
import 'package:remindme_app/data/repository_impl/user/user_repository_impl.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';
import 'package:remindme_app/domain/repository/user/user_repository.dart';
import 'package:remindme_app/view/home/home_view_model.dart';
import 'package:remindme_app/view/routine/routine_add/routine_add_view_model.dart';
import 'package:remindme_app/view/routine/routine_detail/routine_detail_view_model.dart';
import 'package:remindme_app/view/signUp/sign_up_view_model.dart';

final getIt = GetIt.instance;

void diSetUp() {
  getIt.registerSingleton<UserRepository>(
    UserRepositoryImpl(userBox: HiveBox().userBox),
  );
  getIt.registerSingleton<RoutineRepository>(
    RoutineRepositoryImpl(routineBox: HiveBox().routineBox),
  );

  getIt.registerFactory<SignUpViewModel>(
    () => SignUpViewModel(userRepository: getIt()),
  );

  getIt.registerFactory<HomeViewModel>(
    () => HomeViewModel(routineRepository: getIt()),
  );

  getIt.registerFactory<RoutineAddViewModel>(
    () => RoutineAddViewModel(routineRepository: getIt()),
  );

  getIt.registerFactory<RoutineDetailViewModel>(
    () => RoutineDetailViewModel(routineRepository: getIt()),
  );
}
