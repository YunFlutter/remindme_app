import 'package:freezed_annotation/freezed_annotation.dart';
part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  final bool firstTextVisible;
  final bool secondTextVisible;

  const SplashState({
    this.firstTextVisible = false,
    this.secondTextVisible = false,
  });
}
