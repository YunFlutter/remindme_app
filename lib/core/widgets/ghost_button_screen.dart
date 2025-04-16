import 'package:flutter/material.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';

class GhostButtonScreen extends StatelessWidget {
  final String buttonText;
  void Function()? onTap;

  GhostButtonScreen({super.key, required this.buttonText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.baseWhite,
          border: Border.all(color: AppColors.primaryBlue),
        ),
        child: InkWell(
          onTap: onTap ?? () {},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              buttonText,
              style: AppTextStyles.buttonText(color: AppColors.primaryBlue),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
