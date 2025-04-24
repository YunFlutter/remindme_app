import 'package:flutter/material.dart';
import 'package:remindme_app/domain/domain_model/routine/routine_model.dart';
import 'package:remindme_app/view/routine/routine_detail/routine_detail_screen.dart';
import 'package:remindme_app/view/routine/routine_detail/routine_detail_view_model.dart';

class RoutineDetailScreenRoot extends StatelessWidget {
  final RoutineDetailViewModel viewModel;
  final RoutineModel routineModel;
  const RoutineDetailScreenRoot({
    super.key,
    required this.viewModel,
    required this.routineModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return RoutineDetailScreen(
          state: viewModel.state,
          routineModel: routineModel,
          onAction: viewModel.onAction,
        );
      },
    );
  }
}
