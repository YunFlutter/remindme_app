import 'package:hive_ce/hive.dart';

part 'routine_data_model.g.dart';

@HiveType(typeId: 1)
class RoutineDataModel {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String time;

  @HiveField(2)
  final String routineIconName;

  @HiveField(3)
  final String badgeColor;

  @HiveField(4)
  final String routineColor;

  @HiveField(5)
  final List<Map<String, dynamic>> steps;

  @HiveField(6)
  final String id;

  RoutineDataModel({
    required this.title,
    required this.time,
    required this.routineIconName,
    required this.badgeColor,
    required this.routineColor,
    required this.steps,
    required this.id,
  });

  RoutineDataModel copyWith({
    String? title,
    String? time,
    String? routineIconName,
    String? badgeColor,
    String? routineColor,
    List<Map<String, dynamic>>? steps,
    String? id,
  }) {
    return RoutineDataModel(
      title: title ?? this.title,
      time: time ?? this.time,
      routineIconName: routineIconName ?? this.routineIconName,
      badgeColor: badgeColor ?? this.badgeColor,
      routineColor: routineColor ?? this.routineColor,
      steps: steps ?? this.steps,
      id: id ?? this.id,
    );
  }
}