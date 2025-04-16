import 'package:flutter/material.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_shadows.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';

class PrimaryButtonScreen extends StatelessWidget {
  final String buttonText;
  final bool buttonActive;
  final double? borderRadius;
  final void Function()? onTap;

  PrimaryButtonScreen({
    super.key,
    required this.buttonText,
    required this.buttonActive,
    this.borderRadius,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius ?? 16),
      clipBehavior: Clip.hardEdge,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [AppShadows.light],
          borderRadius: BorderRadius.circular(borderRadius?? 16),
          color:
              buttonActive ? AppColors.primaryBlue : AppColors.grayDisabled,
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              buttonText,
              style: AppTextStyles.buttonText(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
