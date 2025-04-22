import 'package:freezed_annotation/freezed_annotation.dart';
part 'onboarding_state.freezed.dart';

@freezed
class OnboardingState with _$OnboardingState {
  @override
  final int pageInt;
  @override
  final double firstOpacity;
  @override
  final double secondOpacity;
  @override
  final double thirdOpacity;
  @override
  final bool imageVisible;
  @override
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
