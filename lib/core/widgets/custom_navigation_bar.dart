import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';

class CustomNavigationBar extends StatelessWidget {
  final String nowPagePath;
  const CustomNavigationBar({super.key, required this.nowPagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: double.infinity,
      height: 72,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.grayLine)),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        navButton(icon: LucideIcons.house, onPressed: (){}, label: '홈', active: nowPagePath == '/home'),
        navButton(icon: LucideIcons.notebookPen, onPressed: (){}, label: '감정일기', active: nowPagePath == '/emotion'),
        navButton(icon: LucideIcons.circleUser, onPressed: (){}, label: '마이페이지', active: nowPagePath == '/setting')

      ]),
    );
  }

  Widget navButton({
    required IconData icon,
    required void Function() onPressed,
    required String label,
    required bool active,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: LucideIconWidget(
            icon: icon,
            color: active ? AppColors.primaryBlue : AppColors.navUnselected,
          ),
        ),
        Text(
          label,
          style:
              active
                  ? AppTextStyles.navSelected(color: AppColors.primaryBlue)
                  : AppTextStyles.navUnselected(),
        ),
      ],
    );
  }
}
