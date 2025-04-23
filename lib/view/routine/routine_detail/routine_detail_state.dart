import 'package:freezed_annotation/freezed_annotation.dart';

part 'routine_detail_state.freezed.dart';

@freezed
abstract class RoutineDetailState with _$RoutineDetailState {
  const factory RoutineDetailState({
    @Default(false) bool isLoading,
  }) = _RoutineDetailState;

}