

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

  @HiveField(7)
  final bool isCompletedToday; // ⭐ 오늘 완료 여부

  @HiveField(8)
  final DateTime? lastCompletedDate; // ⭐ 마지막 완료한 날짜

  RoutineDataModel({
    required this.title,
    required this.time,
    required this.routineIconName,
    required this.badgeColor,
    required this.routineColor,
    required this.steps,
    required this.id,
    this.isCompletedToday = false,
    this.lastCompletedDate,
  });

  RoutineDataModel copyWith({
    String? title,
    String? time,
    String? routineIconName,
    String? badgeColor,
    String? routineColor,
    List<Map<String, dynamic>>? steps,
    String? id,
    bool? isCompletedToday,
    DateTime? lastCompletedDate,
  }) {
    return RoutineDataModel(
      title: title ?? this.title,
      time: time ?? this.time,
      routineIconName: routineIconName ?? this.routineIconName,
      badgeColor: badgeColor ?? this.badgeColor,
      routineColor: routineColor ?? this.routineColor,
      steps: steps ?? this.steps,
      id: id ?? this.id,
      isCompletedToday: isCompletedToday ?? this.isCompletedToday,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
    );
  }
}