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
    isCompletedToday: model.isCompletedToday, // ⭐ 추가
    lastCompletedDate: model.lastCompletedDate, // ⭐ 추가
    audioPath: model.audioPath, // ✅ audioPath 추가
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
    isCompletedToday: model.isCompletedToday, // ⭐ 추가
    isFavorite: false, // ❗ 여긴 따로 관리하고 있다면 기본값 false
    tags: [], // ❗ 기본 빈 리스트
    lastCompletedDate: model.lastCompletedDate, // ⭐ 추가
    audioPath: model.audioPath, // ✅ audioPath 추가
  );
}