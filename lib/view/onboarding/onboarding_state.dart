import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  final int pageInt;
  final double firstOpacity;
  final double secondOpacity;
  final double thirdOpacity;
  final bool imageVisible;
  final bool textVisible;

  const OnboardingState({
    this.pageInt = 0,
    this.imageVisible = false,
    this.textVisible = false,
    this.firstOpacity = 0.0,
    this.secondOpacity = 0.0,
    this.thirdOpacity = 0.0,
  });
}
