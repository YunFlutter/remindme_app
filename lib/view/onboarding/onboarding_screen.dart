import 'package:flutter/material.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';
import 'package:remindme_app/view/onboarding/onboarding_state.dart';
import 'package:remindme_app/view/onboarding/onboarding_view_model.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingViewModel viewModel;
  const OnboardingScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.baseWhite,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GestureDetector(
              onHorizontalDragUpdate: (detail) {},
              child: AnimatedCrossFade(
                firstChild: firstOnboarding(context: context),
                secondChild: secondOnboarding(),
                crossFadeState:
                    viewModel.state.pageInt == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                duration: Duration(seconds: 5),

              ),
            ),
          ),
        );
      },
    );
  }

  Widget firstOnboarding({required BuildContext context}) {
    return AnimatedOpacity(
      opacity: viewModel.state.firstOpacity,
      duration: const Duration(seconds: 5),
      child: Column(
        spacing: 30,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              spacing: 24,
              children: [
                Image.asset('assets/image/emtion_note.png', width: MediaQuery.of(context).size.width /3,),
                Text(
                  '감정을 기록하고,\n나를 이해해보세요',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.headingL(
                    color: AppColors.onboardingTitleColor,
                  ),
                ),
              ],
            ),
          ),
          indicatorBtn(),
          SizedBox(
            height: 0,
          )
        ],
      ),
    );
  }

  Widget secondOnboarding() {
    return AnimatedOpacity(
      opacity: viewModel.state.secondOpacity,
      duration: const Duration(seconds: 3),
      child: Column(
        children: [
          Column(
            children: [
              Image.asset('assets/image/routine_alert.png'),
              Text(
                '나만의 루틴으로\n하루를 시작해 보세요',
                textAlign: TextAlign.center,
                style: AppTextStyles.headingL(
                  color: AppColors.onboardingTitleColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget indicatorBtn() {
    return Row(
      spacing: 15,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: AppColors.onboardingDescriptionColor,
            shape: BoxShape.circle
          ),
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: AppColors.onboardingDescriptionColor,
              shape: BoxShape.circle
          ),
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: AppColors.onboardingDescriptionColor,
              shape: BoxShape.circle
          ),
        )
      ],
    );
  }
}
