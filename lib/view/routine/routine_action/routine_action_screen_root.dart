import 'package:flutter/material.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_view_model.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_screen.dart';
import 'package:remind_me_app/view/show_app_out_dialog.dart';

class RoutineActionScreenRoot extends StatelessWidget {
  final RoutineActionViewModel viewModel;

  const RoutineActionScreenRoot({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool result = await showAppOutDialog(context);
        return result;
      },
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return RoutineActionScreen(
            state: viewModel.state,
            model: viewModel.model,
            onAction: viewModel.onEvent,
            pageController: viewModel.pageController,
            timerController: viewModel.timerController,
          );
        },
      ),
    );
  }
}