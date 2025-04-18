import 'package:flutter/material.dart';
import 'package:remindme_app/core/service/icon_mapper.dart';
import 'package:remindme_app/data/data_model/routine/routine_data_model.dart';
import 'package:remindme_app/data/data_model/routine/routine_step_data_model.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_step/routine_step.dart';
import 'package:remindme_app/core/constants/lucide_icon_data_with_keywords.dart';

extension RoutineToDataModel on RoutineModel {
  RoutineDataModel toDataModel() {
    return RoutineDataModel(
      title: title,
      steps:
          steps
              .map(
                (s) => RoutineStepDataModel(
                  description: s.description,
                  order: s.order,
                ),
              )
              .toList(),
      badgeColor: badgeColor,
      routineColor: routineColor,
      time: time,
      routineIconName: iconToJson(routineIcon),
      isCompletedToday: isCompletedToday,
      isFavorite: isFavorite,
      tags: tags,
      lastCompletedDate: lastCompletedDate,
    );
  }
}

extension RoutineDataModelToRoutine on RoutineDataModel {
  RoutineModel toRoutine() {
    return RoutineModel(
      title: title,
      steps:
          steps
              .map(
                (s) => RoutineStep(description: s.description, order: s.order),
              )
              .toList(),
      badgeColor: badgeColor,
      routineColor: routineColor,
      time: time,
      routineIcon: iconFromJson(routineIconName),
      isCompletedToday: isCompletedToday,
      isFavorite: isFavorite,
      tags: tags,
      lastCompletedDate: lastCompletedDate,
    );
  }
}


