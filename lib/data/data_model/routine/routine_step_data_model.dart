

import 'package:hive_ce/hive.dart';

part 'routine_step_data_model.g.dart';

@HiveType(typeId: 2)
class RoutineStepDataModel extends HiveObject {
  @HiveField(0)
  String description;

  @HiveField(1)
  int order;

  RoutineStepDataModel({
    required this.description,
    required this.order,
  });
}