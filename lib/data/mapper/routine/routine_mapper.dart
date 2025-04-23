import 'package:remindme_app/data/data_model/routine/routine_data_model.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';

RoutineDataModel routineToDataModel(RoutineModel model) {
  return RoutineDataModel(
    title: model.title,
    time: model.time,
    routineIconName: model.routineIconName,
    badgeColor: model.badgeColor,
    routineColor: model.routineColor,
    steps: model.steps,
  );
}

RoutineModel dataModelToRoutine(RoutineDataModel model) {
  return RoutineModel(
    title: model.title,
    time: model.time,
    routineIconName: model.routineIconName,
    badgeColor: model.badgeColor,
    routineColor: model.routineColor,
    steps: model.steps,
  );
}