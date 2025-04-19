
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  final String userName;
  final List routineList;

  const HomeState({
    this.userName = '',
    this.routineList = const[],
  });
}