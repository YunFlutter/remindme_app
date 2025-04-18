import 'package:flutter/material.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
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
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: GestureDetector(
              onTap: viewModel.unFocus,
              child: Column(
                spacing: 15,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('닉네임'),
                  CustomTextField(
                    focusNode: viewModel.state.focusNode,
                    textEditingController: viewModel.state.textEditingController,
                    onSubmitEvent: (text) {
                      print("완성 $text");
                    },
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
