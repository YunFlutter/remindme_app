import 'package:flutter/material.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';
import 'package:remindme_app/view/splash/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  final SplashViewModel viewModel;
  const SplashScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return Scaffold(
          backgroundColor: AppColors.primaryBlue,
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Column(
                spacing: 24,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/image/emtion_note.png", width: MediaQuery.of(context).size.width /3, fit: BoxFit.contain,),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: viewModel.state.firstTextVisible ? 1.0 : 0.0,
                    child: Text(
                      '반복되는 하루 속에서,\n나를 위한 작은 루틴을 시작해보세요.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.headingXl(
                        color: AppColors.grayText, // 진한 텍스트 컬러
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 1500),
                    opacity: viewModel.state.secondTextVisible ? 1.0 : 0.0,
                    child: Text(
                      '당신의 감정과 하루를 기록하는,\n따뜻한 루틴 메이트.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyM(
                        color: Color(0xff666666), // 중간톤 텍스트 컬러
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
