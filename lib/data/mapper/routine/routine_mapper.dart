import 'package:remind_me_app/data/data_model/routine/routine_data_model.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';

RoutineDataModel routineToDataModel(RoutineModel model) {
  return RoutineDataModel(
    title: model.title,
    time: model.time,
    routineIconName: model.routineIconName,
    badgeColor: model.badgeColor,
    routineColor: model.routineColor,
    steps: model.steps,
    id: model.id.toString(),
    isCompletedToday: model.isCompletedToday,
    lastCompletedDate: model.lastCompletedDate,
    audioPath: model.audioPath,
    isVibrateMode: model.isVibrateMode,
  );
}

RoutineModel dataModelToRoutine(RoutineDataModel model) {
  return RoutineModel(
    id: int.parse(model.id),
    title: model.title,
    steps: model.steps,
    badgeColor: model.badgeColor,
    routineColor: model.routineColor,
    time: model.time,
    routineIconName: model.routineIconName,
    isCompletedToday: model.isCompletedToday,
    isFavorite: false,
    tags: [],
    lastCompletedDate: model.lastCompletedDate,
    audioPath: model.audioPath,
    isVibrateMode: model.isVibrateMode,
  );
}