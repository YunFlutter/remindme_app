import 'package:hive_ce/hive.dart';
import 'routine_step_data_model.dart';

part 'routine_data_model.g.dart';

@HiveType(typeId: 1)
class RoutineDataModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  List<RoutineStepDataModel> steps;

  @HiveField(2)
  String badgeColor;

  @HiveField(3)
  String routineColor;

  @HiveField(4)
  String time;

  @HiveField(5)
  String routineIconName;

  @HiveField(6)
  bool isCompletedToday;

  @HiveField(7)
  bool isFavorite;

  @HiveField(8)
  List<String> tags;

  @HiveField(9)
  DateTime? lastCompletedDate;

  RoutineDataModel({
    required this.title,
    required this.steps,
    required this.badgeColor,
    required this.routineColor,
    required this.time,
    required this.routineIconName,
    this.isCompletedToday = false,
    this.isFavorite = false,
    this.tags = const [],
    this.lastCompletedDate,
  });
}