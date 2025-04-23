class RoutineStepDataModel {
  final String icon;
  final String title;
  final String time;

  RoutineStepDataModel({
    required this.icon,
    required this.title,
    required this.time,
  });

  Map<String, dynamic> toJson() => {
    'icon': icon,
    'title': title,
    'time': time,
  };

  factory RoutineStepDataModel.fromJson(Map<String, dynamic> json) {
    return RoutineStepDataModel(
      icon: json['icon'] as String,
      title: json['title'] as String,
      time: json['time'] as String,
    );
  }
}