import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';
import 'package:remindme_app/core/widgets/custom_text_field.dart';
import 'package:remindme_app/view/signUp/sign_up_view_model.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpViewModel viewModel;

  const SignUpScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (_, _) {
        return Scaffold(
          backgroundColor: AppColors.baseWhite,
          body: AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            opacity: viewModel.state.pageOpacity ? 1.0 : 0.0,
            curve: Curves.easeIn,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  if (viewModel.state.pageOpacity)
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 600),
                      offset:
                      viewModel.state.isTitleVisible
                          ? Offset.zero
                          : const Offset(0, 0.2),
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 2,
                        ),
                        child: Text(
                          '간단한 닉네임 입력 으로\n루틴을 시작해 보세요',
                          style: AppTextStyles.headingXl(),
                        ),
                      ),
                    ),
                  if (viewModel.state.pageOpacity &&
                      viewModel.state.isTitleVisible)
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 600),
                      offset:
                      viewModel.state.isFieldVisible
                          ? Offset.zero
                          : const Offset(0, 0.2),
                      child: Column(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('닉네임'),
                          CustomTextField(
                            focusNode: viewModel.state.focusNode,
                            textEditingController:
                            viewModel.state.textEditingController,
                            onSubmitEvent: (text) {
                              print("완성 $text");
                            },
                          ),
                        ],
                      ),
                    ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).padding.top * 2,
                    ),
                    child: AnimatedOpacity(
                      opacity:
                      viewModel.state.textEditingController.text.isNotEmpty
                          ? 1.0
                          : 0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                      child: IconButton(
                        padding: EdgeInsets.all(15),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.primaryBlue,
                          ),
                        ),
                        onPressed: () {
                          viewModel.saveName(
                            text: viewModel.state.textEditingController.text,
                            context: context,
                          );
                        },
                        icon: LucideIconWidget(
                          icon: LucideIcons.chevronRight,
                          color: AppColors.baseWhite,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}