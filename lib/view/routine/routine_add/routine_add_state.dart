import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_add_state.freezed.dart';

@freezed
class RoutineAddState with _$RoutineAddState {
  final String title;
  final String time;
  final String routineIconName;
  final String badgeColor;
  final String routineColor;
  final bool isAnimatedVisible;

  const RoutineAddState({
     this.title = '',
     this.time = '',
     this.routineIconName = 'setting',
     this.badgeColor = '#91B8F7',
     this.routineColor = '#A0C4FF',
     this.isAnimatedVisible = true,
  });
}
