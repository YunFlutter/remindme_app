import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/themes/app_colors.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.focusNode,
    required this.textEditingController,
    this.suffixIconDisplay = false,
    void Function(String text)? onSubmitEvent,
  });

  final FocusNode focusNode;
  final TextEditingController textEditingController;
  void Function(String text)? onSubmitEvent;
  bool suffixIconDisplay;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.suffixIconDisplay == false ? false : obscureText,
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      onSubmitted: widget.onSubmitEvent ?? (text){},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        suffixIcon:
            widget.suffixIconDisplay == false
                ? null
                : Padding(
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
                          icon:
                              obscureText
                                  ? LucideIcons.eye
                                  : LucideIcons.eyeClosed,
                          color: AppColors.grayText,
                        ),
                      ),
                    ),
                  ),
                ),
        suffixIconConstraints:
            widget.suffixIconDisplay == false
                ? null
                : BoxConstraints(maxWidth: 24, maxHeight: 24),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.primaryBlue),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.alertRed),
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grayLine),
        ),
      ),
    );
  }
}
