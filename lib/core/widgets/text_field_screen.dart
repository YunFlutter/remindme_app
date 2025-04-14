import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:lucide_icons_flutter/test_icons.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_shadows.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({
    super.key,
    required this.focusNode,
    required this.textEditingController,
  });

  final FocusNode focusNode;
  final TextEditingController textEditingController;

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Material(
            color: Colors.transparent,
            child: Ink(
              child: InkWell(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: LucideIconWidget(
                  size: 24,
                  icon: obscureText ? LucideIcons.eye : LucideIcons.eyeClosed,
                  color: AppColors.grayText,
                ),
              ),
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(maxWidth: 24, maxHeight: 24),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryBlue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.alertRed),
        ),
        errorStyle: AppTextStyles.caption(color: AppColors.alertRed),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grayLine),
        ),
        errorText: '정확하지 않는 값을 입력하셨습니다!',
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.alertRed),
        ),
      ),
    );
  }
}
