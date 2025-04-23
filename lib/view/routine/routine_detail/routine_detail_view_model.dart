import 'package:flutter/cupertino.dart';
import 'package:remindme_app/domain/repository/routine/routine_repository.dart';
import 'package:remindme_app/view/routine/routine_detail/routine_detail_state.dart';

class RoutineDetailViewModel with ChangeNotifier {
  final RoutineRepository _routineRepository;

  RoutineDetailViewModel({required RoutineRepository routineRepository})
    : _routineRepository = routineRepository;

  final RoutineDetailState _state = RoutineDetailState();

  RoutineDetailState get state => _state;
}
