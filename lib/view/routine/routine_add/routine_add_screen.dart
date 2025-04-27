import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remind_me_app/core/service/icon_mapper.dart';
import 'package:remind_me_app/core/themes/app_colors.dart';
import 'package:remind_me_app/core/themes/app_text_styles.dart';
import 'package:remind_me_app/core/widgets/custom_text_field.dart';
import 'package:remind_me_app/view/routine/routine_add/routine_add_view_model.dart';
import 'package:remind_me_app/view/routine/routine_add/routine_step_bottom_sheet.dart';

class RoutineAddScreen extends StatelessWidget {
  final RoutineAddViewModel viewModel;
  const RoutineAddScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        return Scaffold(
          backgroundColor: AppColors.baseWhite,
          appBar: AppBar(
            title: Text('루틴 추가', style: AppTextStyles.headingL()),
            backgroundColor: AppColors.baseWhite,
            actionsPadding: EdgeInsets.only(right: 16),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => viewModel.saveRoutine(context: context),
                icon: LucideIconWidget(
                  icon: LucideIcons.save,
                  color:
                      viewModel.state.steps.isNotEmpty
                          ? AppColors.primaryBlue
                          : AppColors.grayDisabled,
                ),
              ),
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
                          (context) =>
                              RoutineStepBottomSheet(viewModel: viewModel),
                    ),
                icon: LucideIconWidget(
                  icon: LucideIcons.calendarPlus,
                  color: AppColors.primaryBlue,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 20,
                children: [
                  Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('루틴 제목', style: AppTextStyles.caption()),
                      CustomTextField(onChangeEvent: viewModel.updateTitle),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('시작 시간(ex:17:00)', style: AppTextStyles.caption()),
                      CustomTextField(onChangeEvent: viewModel.updateTime),
                    ],
                  ),

                  Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('아이콘 선택', style: AppTextStyles.caption()),
                      Wrap(
                        runSpacing: 10,
                        children:
                            viewModel.state.routineIconNames.map((icon) {
                              final isSelected =
                                  viewModel.state.routineIconName == icon;
                              return GestureDetector(
                                onTap: () => viewModel.updateRoutineIcon(icon),
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color:
                                        isSelected
                                            ? Colors.blue[50]
                                            : Colors.transparent,
                                    border: Border.all(
                                      color:
                                          isSelected
                                              ? Colors.blue
                                              : Colors.grey.shade300,
                                      width: isSelected ? 2 : 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: LucideIconWidget(
                                    icon: getLucideIconData(icon),
                                    color:
                                        isSelected
                                            ? Colors.blue
                                            : Colors.black54,
                                    size: 28,
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      Text('배지 색상', style: AppTextStyles.caption()),
                      Wrap(
                        runSpacing: 10,
                        children:
                            viewModel.state.badgeColors.map((hex) {
                              final color = Color(
                                int.parse('0xFF${hex.substring(1)}'),
                              );
                              return GestureDetector(
                                onTap: () => viewModel.updateBadgeColor(hex),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          viewModel.state.badgeColor == hex
                                              ? Colors.black
                                              : AppColors.grayLine,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),

                  Column(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('루틴 배경색', style: AppTextStyles.caption()),
                      Wrap(
                        runSpacing: 10,
                        children:
                            viewModel.state.routineBackgroundColors.map((hex) {
                              final color = Color(
                                int.parse('0xFF${hex.substring(1)}'),
                              );
                              return GestureDetector(
                                onTap: () => viewModel.updateRoutineColor(hex),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: color,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color:
                                          viewModel.state.routineColor == hex
                                              ? Colors.black
                                              : AppColors.grayLine,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ],
                  ),
                  if (viewModel.state.steps.isNotEmpty)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '추가된 단계',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: viewModel.state.steps.length,
                          separatorBuilder: (_, __) => SizedBox(height: 8),
                          itemBuilder: (context, index) {
                            final step = viewModel.state.steps[index];
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
                                    onPressed:
                                        () => viewModel.removeStep(index),
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
                        const SizedBox(height: 24),
                      ],
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
