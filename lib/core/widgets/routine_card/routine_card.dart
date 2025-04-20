import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/app_shadows.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';
import 'package:remindme_app/core/widgets/primary_button.dart';
import 'package:remindme_app/core/widgets/routine_card/routine_card_model.dart';

class RoutineCard extends StatelessWidget {
  final RoutineCardModel cardModel;
  const RoutineCard({super.key, required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      clipBehavior: Clip.hardEdge,
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.grayLine
          ),
          boxShadow: [AppShadows.light],
        ),
        child: InkWell(
          onTap: cardModel.onTap,
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: cardModel.badgeBackGroundColor,
                  ),
                  child: LucideIconWidget(
                    icon: cardModel.icons,
                    color: cardModel.badgeColor,
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cardModel.routineTitle,
                        style: AppTextStyles.headingL(),
                      ),
                      Row(
                        spacing: 9,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          LucideIconWidget(
                            icon: LucideIcons.alarmClock,
                            size: 16,
                          ),
                          Text(
                            "${cardModel.routineTime} 시작",
                            style: AppTextStyles.bodyS(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: PrimaryButton(
                    buttonText: '시작하기',
                    buttonActive: true,
                    borderRadius: 80,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
