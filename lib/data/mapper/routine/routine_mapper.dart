import 'package:remindme_app/data/data_model/routine/routine_data_model.dart';
import 'package:remindme_app/data/mapper/routine/routine_step_mapper.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';

class RoutineMapper {
  static RoutineDataModel toDataModel(RoutineModel model) {
    return RoutineDataModel(
      title: model.title,
      steps: model.steps
          .map((step) => RoutineStepMapper.toDataModel(step))
          .toList(),
      badgeColor: model.badgeColor,
      routineColor: model.routineColor,
      time: model.time,
      routineIconName: model.routineIconName,
      isCompletedToday: model.isCompletedToday,
      isFavorite: model.isFavorite,
      tags: model.tags,
      lastCompletedDate: model.lastCompletedDate,
    );
  }

  static RoutineModel toDomainModel(RoutineDataModel data) {
    return RoutineModel(
      title: data.title,
      steps: data.steps
          .map((step) => RoutineStepMapper.toDomainModel(step))
          .toList(),
      badgeColor: data.badgeColor,
      routineColor: data.routineColor,
      time: data.time,
      routineIconName: data.routineIconName,
      isCompletedToday: data.isCompletedToday,
      isFavorite: data.isFavorite,
      tags: data.tags,
      lastCompletedDate: data.lastCompletedDate,
    );
  }
}