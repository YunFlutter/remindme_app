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

  Map<String, dynamic> toJson() {
    return {"icon": this.icon, "title": this.title, "time": this.time,};
  }

  factory RoutineStepModel.fromJson(Map<String, dynamic> json) {
    return RoutineStepModel(
      icon: json["icon"], title: json["title"], time: json["time"],);
  }





}