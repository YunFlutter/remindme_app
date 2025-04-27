import 'package:flutter/cupertino.dart';
import 'package:remind_me_app/core/result/result.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/repository/routine/routine_repository.dart';
import 'package:remind_me_app/view/routine/routine_detail/routine_detail_action.dart';
import 'package:remind_me_app/view/routine/routine_detail/routine_detail_state.dart';

class RoutineDetailViewModel with ChangeNotifier {
  final RoutineRepository _routineRepository;

  RoutineDetailViewModel({required RoutineRepository routineRepository})
    : _routineRepository = routineRepository;

  RoutineDetailState _state = RoutineDetailState();

  RoutineDetailState get state => _state;

  void onAction(RoutineDetailAction action) async {
    switch (action) {
      case pageInit():
        _state = state.copyWith(
          model: action.model,
          stepList: action.model.steps,
        );
        notifyListeners();
        break;
      case removeRoutine():
        _routineRepository.deleteRoutine(action.routineId);
        notifyListeners();
        break;
      case removeRoutineStep():
        final result = await _routineRepository.deleteStepFromRoutine(
          routineId: action.routineId,
          stepIndex: action.stepIndex,
        );

        switch (result) {
          case Success<RoutineModel, String>():
            final RoutineModel newModel = result.data;

            _state = state.copyWith(model: newModel, stepList: newModel.steps);
            print("삭제 완료");
            notifyListeners();

          case Error<RoutineModel, String>():
            // TODO: Handle this case.
            throw UnimplementedError();
        }

        notifyListeners();
        break;
      case addRoutineStep():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }
}
