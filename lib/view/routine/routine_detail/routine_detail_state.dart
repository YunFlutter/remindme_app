import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';

part 'routine_detail_state.freezed.dart';

@freezed
class RoutineDetailState with _$RoutineDetailState {
  final List<Map<String, dynamic>> stepList;
  final RoutineModel model;

  const RoutineDetailState({
    this.stepList = const [],
    this.model = const RoutineModel(
      id: -1,
      title: 'title',
      steps: [],
      badgeColor: '#ffffff',
      routineColor: '#ffffff',
      time: 'time',
      routineIconName: 'routineIconName',
    ),
  });
}
