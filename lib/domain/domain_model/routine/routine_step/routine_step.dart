import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_step.freezed.dart';
part 'routine_step.g.dart';


@freezed
abstract class RoutineStep with _$RoutineStep {
  const factory RoutineStep({
    required int order,
    required String description, // 할 일 내용 (예: "세수하기", "옷 입기")
    @Default(false) bool isDone, // 완료 여부
    Duration? duration, // 예상 소요 시간 (선택)
    String? emoji, // 감정이나 아이콘 표현 (예: 😃, 🪥)
  }) = _RoutineStep;

  factory RoutineStep.fromJson(Map<String, dynamic> json) => _$RoutineStepFromJson(json);
}