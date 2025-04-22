
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  @override
  final String userName;
  @override
  final List<RoutineModel> routineList;

  const HomeState({
    this.userName = '',
    this.routineList = const<RoutineModel>[],
  });
}