import 'package:remindme_app/domain/domain_model/routine/routine_step_model.dart';

class RoutineModel {
  final String title;
  final List<RoutineStepModel> steps;
  final String badgeColor;
  final String routineColor;
  final String time;
  final String routineIconName;
  final bool isCompletedToday;
  final bool isFavorite;
  final List<String> tags;
  final DateTime? lastCompletedDate;

  const RoutineModel({
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