import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/constants/lucide_icon_data_with_keywords.dart';
import 'package:remindme_app/core/constants/time_of_day_model.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_step/routine_step.dart';

part 'routine_model.freezed.dart';
part 'routine_model.g.dart';

@freezed
abstract class RoutineModel with _$RoutineModel {
  const factory RoutineModel({
    required String id, // 고유 ID (UUID 등)
    required String title, // 루틴 이름 (예: "아침 준비")
    required List<RoutineStep> steps, // 루틴 안의 순서 목록
    required String badgeColor,
    required String routineColor,
    required String time,
    @JsonKey(
      fromJson: _iconFromJson,
      toJson: _iconToJson,
    )
    required IconData routineIcon,
    @Default(false) bool isCompletedToday, // 오늘 완료 여부
    @Default(false) bool isFavorite, // 즐겨찾기 여부
    @Default([]) List<String> tags, // 태그 (예: "아침", "집중 루틴")
    DateTime? lastCompletedDate, // 마지막 완료일
  }) = _RoutineModel;

  factory RoutineModel.fromJson(Map<String, dynamic> json) => _$RoutineModelFromJson(json);
}

IconData _iconFromJson(String iconName) {
  return lucideIconData.firstWhere((items) => items["name"] == iconName)["icon"];
}

String _iconToJson(IconData icon) {
  return icon.toString();
}