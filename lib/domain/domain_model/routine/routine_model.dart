class RoutineModel {
  final int id;
  final String title;
  final List<Map<String, dynamic>> steps;
  final String badgeColor;
  final String routineColor;
  final String time;
  final String routineIconName;
  final bool isCompletedToday;
  final bool isFavorite;
  final List<String> tags;
  final DateTime? lastCompletedDate;

  const RoutineModel({
    required this.id,
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

  RoutineModel copyWith({
    String? title,
    List<Map<String, dynamic>>? steps,
    String? badgeColor,
    String? routineColor,
    String? time,
    String? routineIconName,
    bool? isCompletedToday,
    bool? isFavorite,
    List<String>? tags,
    DateTime? lastCompletedDate,
    int? id,
  }) {
    return RoutineModel(
      id: id ?? -1,
      title: title ?? this.title,
      steps: steps ?? this.steps,
      badgeColor: badgeColor ?? this.badgeColor,
      routineColor: routineColor ?? this.routineColor,
      time: time ?? this.time,
      routineIconName: routineIconName ?? this.routineIconName,
      isCompletedToday: isCompletedToday ?? this.isCompletedToday,
      isFavorite: isFavorite ?? this.isFavorite,
      tags: tags ?? this.tags,
      lastCompletedDate: lastCompletedDate ?? this.lastCompletedDate,
    );
  }

  @override
  String toString() {
    return 'RoutineModel{id: $id title: $title, steps: $steps, badgeColor: $badgeColor, routineColor: $routineColor, time: $time, routineIconName: $routineIconName, isCompletedToday: $isCompletedToday, isFavorite: $isFavorite, tags: $tags, lastCompletedDate: $lastCompletedDate}';
  }
}
