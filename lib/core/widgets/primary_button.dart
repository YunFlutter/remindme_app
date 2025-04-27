import 'package:flutter/material.dart';
import 'package:remind_me_app/core/themes/app_colors.dart';
import 'package:remind_me_app/core/themes/app_shadows.dart';
import 'package:remind_me_app/core/themes/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String buttonText;
  final bool buttonActive;
  final double? borderRadius;
  final Color? buttonColor;
  final Color? textColor;

  final void Function()? onTap;

  const PrimaryButton({
    super.key,
    required this.buttonText,
    required this.buttonActive,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? 16),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [AppShadows.light],
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
          color:
              buttonActive
                  ? buttonColor ?? AppColors.primaryBlue
                  : AppColors.grayDisabled,
        ),
        child: InkWell(
          onTap: buttonActive ? (onTap ?? () {}) : null,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              buttonText,
              style: AppTextStyles.buttonText(
                color: textColor ?? AppColors.baseWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
