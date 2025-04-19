import 'package:remindme_app/data/data_model/routine/routine_step_data_model.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_step_model.dart';

class RoutineStepMapper {
  static RoutineStepDataModel toDataModel(RoutineStepModel model) {
    return RoutineStepDataModel(
      iconName: model.iconName,
      title: model.title,
      order: model.order,
      durationMinutes: model.durationMinutes,
    );
  }

  static RoutineStepModel toDomainModel(RoutineStepDataModel data) {
    return RoutineStepModel(
      iconName: data.iconName,
      title: data.title,
      order: data.order,
      durationMinutes: data.durationMinutes,
    );
  }
}