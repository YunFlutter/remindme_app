import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remind_me_app/core/themes/app_colors.dart';
import 'package:remind_me_app/core/themes/app_text_styles.dart';
import 'package:remind_me_app/core/widgets/primary_button.dart';
import 'package:remind_me_app/view/onboarding/onboarding_view_model.dart';

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
          body: Stack(
            children: [
              Positioned.fill(
                child: PageView.builder(
                  controller: viewModel.pageController,
                  onPageChanged: viewModel.setPageInt,
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return buildPage(context: context, index: index);
                  },
                ),
              ),
              if (viewModel.state.pageInt != 0)
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () {
                      viewModel.pageIntMinus();
                    },
                    icon: LucideIconWidget(icon: LucideIcons.chevronsLeft),
                  ),
                ),
              if (viewModel.state.pageInt != 2)
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      viewModel.pageIntPlus();
                    },
                    icon: LucideIconWidget(icon: LucideIcons.chevronsRight),
                  ),
                ),

              if (viewModel.state.pageInt == 2)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    padding: EdgeInsets.only(bottom: 70),
                    child: PrimaryButton(
                      onTap: () {
                        context.go("/sign-up");
                      },
                      buttonText: '시작하기',
                      buttonActive: true,
                    ),
                  ),
                ),

              Align(alignment: Alignment.bottomCenter, child: indicator()),

              if (viewModel.state.pageInt != 2)
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.only(
                      right: 10,
                      top: MediaQuery.of(context).padding.top,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.go("/sign-up");
                      },
                      child: Text(
                        '건너뛰기',
                        style: AppTextStyles.caption(color: AppColors.grayText),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPage({required BuildContext context, required int index}) {
    switch (index) {
      case 0:
        return onboardingFirst(valueKey: const ValueKey(0), context: context);
      case 1:
        return onboardingSecond(valueKey: const ValueKey(1), context: context);
      case 2:
        return onboardingThird(valueKey: const ValueKey(2), context: context);
      default:
        return Container(
          color: AppColors.grayPlaceholder,
          key: const ValueKey(-1),
        );
    }
  }

  Widget onboardingFirst({
    required ValueKey valueKey,
    required BuildContext context,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        Image.asset(
          'assets/image/emtion_note.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        Text(
          '감정을 기록 하고,\n나를 이해해 보세요',
          style: AppTextStyles.bodyS(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget onboardingSecond({
    required ValueKey valueKey,
    required BuildContext context,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        Image.asset(
          'assets/image/routine_note.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        Text(
          '나만의 루틴 으로,\n하루를 시작해 보세요',
          style: AppTextStyles.bodyS(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget onboardingThird({
    required ValueKey valueKey,
    required BuildContext context,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 30,
      children: [
        Image.asset(
          'assets/image/routine_alert.png',
          width: MediaQuery.of(context).size.width / 3,
        ),
        Text(
          '반복 되는 하루 속에서,\n나를 위한 시간을 만들어 보세요',
          style: AppTextStyles.bodyS(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget indicator() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (index) {
            final isSelected = index == viewModel.state.pageInt;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              width: isSelected ? 16.0 : 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color:
                    isSelected
                        ? const Color(0xFF4A80F0) // 선택된 색
                        : const Color(0xFFDADADA), // 비선택 색
                borderRadius: BorderRadius.circular(4.0),
              ),
            );
          }),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
