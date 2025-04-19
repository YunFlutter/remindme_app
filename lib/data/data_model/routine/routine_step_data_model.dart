import 'package:hive_ce/hive.dart';
part 'routine_step_data_model.g.dart';

@HiveType(typeId: 2)
class RoutineStepDataModel extends HiveObject {
  @HiveField(0)
  String iconName;

  @HiveField(1)
  String title;

  @HiveField(2)
  int order;

  @HiveField(3)
  int durationMinutes;

  RoutineStepDataModel({
    required this.iconName,
    required this.title,
    required this.order,
    required this.durationMinutes,
  });
}
