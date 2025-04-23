class RoutineStepModel {
  final String icon;
  final String title;
  final String time;

  const RoutineStepModel({
    required this.icon,
    required this.title,
    required this.time,
  });

  RoutineStepModel copyWith({
    String? icon,
    String? title,
    String? time,
  }) {
    return RoutineStepModel(
      icon: icon ?? this.icon,
      title: title ?? this.title,
      time: time ?? this.time,
    );
  }
}