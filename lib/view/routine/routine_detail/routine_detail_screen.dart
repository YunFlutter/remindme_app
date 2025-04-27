import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart'; // 아이콘용
import 'package:remind_me_app/core/constants/adjust_color_brightness.dart';
import 'package:remind_me_app/core/service/di_setup.dart';
import 'package:remind_me_app/core/service/hex_to_color.dart';
import 'package:remind_me_app/core/service/icon_mapper.dart';
import 'package:remind_me_app/core/themes/app_colors.dart';
import 'package:remind_me_app/core/themes/app_text_styles.dart';
import 'package:remind_me_app/core/widgets/primary_button.dart';
import 'package:remind_me_app/core/widgets/routine_card/routine_card_model.dart';
import 'package:remind_me_app/core/widgets/routine_card/routine_card_not_button.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_model.dart';
import 'package:remind_me_app/domain/domain_model/routine/routine_step_model.dart';
import 'package:remind_me_app/view/routine/routine_action/routine_action_view_model.dart';
import 'package:remind_me_app/view/routine/routine_add/routine_step_bottom_sheet.dart';
import 'package:remind_me_app/view/routine/routine_detail/routine_detail_action.dart';
import 'package:remind_me_app/view/routine/routine_detail/routine_detail_state.dart';

class RoutineDetailScreen extends StatefulWidget {
  final RoutineDetailState state;
  final RoutineModel routineModel;
  final void Function(RoutineDetailAction action) onAction;

  const RoutineDetailScreen({
    super.key,
    required this.state,
    required this.routineModel,
    required this.onAction,
  });

  @override
  State<RoutineDetailScreen> createState() => _RoutineDetailScreenState();
}

class _RoutineDetailScreenState extends State<RoutineDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onAction(RoutineDetailAction.pageInit(model: widget.routineModel));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      appBar: AppBar(
        backgroundColor: AppColors.baseWhite,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          '루틴 상세',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed:
                () => showModalBottomSheet(
                  context: context,
                  backgroundColor: AppColors.baseWhite,
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  builder:
                      (context) => RoutineStepBottomSheet(viewModel: getIt()),
                ).then((value) {
                  if (value != null) {
                    widget.onAction(
                      RoutineDetailAction.addRoutineStep(
                        routineId: widget.routineModel.id,
                        newStep: value,
                      ),
                    );
                  }
                }),
            icon: LucideIconWidget(
              icon: LucideIcons.calendarPlus,
              color: AppColors.primaryBlue,
            ),
          ),
          IconButton(
            onPressed: () {
              widget.onAction(
                RoutineDetailAction.removeRoutine(
                  routineId: widget.routineModel.id,
                ),
              );
              context.pop();
            },
            icon: Icon(Icons.delete_outline, color: Colors.redAccent),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 루틴 아이콘과 제목
            RoutineCardNotButton(
              cardModel: RoutineCardModel(
                isCompletedToday: widget.routineModel.isCompletedToday,
                index: widget.routineModel.id,
                icons: getLucideIconData(widget.routineModel.routineIconName),
                badgeColor: widget.routineModel.badgeColor,
                badgeBackGroundColor: widget.routineModel.routineColor,
                routineTitle: widget.routineModel.title,
                routineTime: widget.routineModel.time,
              ),
            ),
            const SizedBox(height: 20),

            // 스텝 리스트 제목
            const Text(
              '루틴 스텝',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 루틴 스텝 리스트
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.state.stepList.length,
                separatorBuilder: (_, __) => SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final step = widget.state.stepList[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      children: [
                        // Icon(iconData(step.iconName), size: 24),
                        LucideIconWidget(
                          icon: getLucideIconData(step["icon"]),
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(step["title"])),
                        Text('${step['time']}분'),
                        IconButton(
                          onPressed: () {
                            widget.onAction(
                              RoutineDetailAction.removeRoutineStep(
                                routineId: widget.routineModel.id,
                                stepIndex: index,
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            PrimaryButton(
              buttonText: '루틴 시작하기',
              buttonActive: true,
              onTap: () {
                context.go('/routine-active', extra: widget.state.model);
              },
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
