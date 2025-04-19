import 'package:flutter/material.dart';
import 'package:remindme_app/core/service/icon_mapper.dart';
import 'package:remindme_app/view/routine/routine_add/routine_add_view_model.dart';
import 'package:remindme_app/view/routine/routine_add/routine_add_state.dart';
import 'package:remindme_app/view/routine/routine_add/routine_step_bottom_sheet.dart';

class RoutineAddScreen extends StatelessWidget {
  final RoutineAddViewModel viewModel;
  const RoutineAddScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('루틴 추가')),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: ListView(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: '루틴 제목'),
                  onChanged: viewModel.updateTitle,
                ),
                const SizedBox(height: 12),
                TextField(
                  decoration: const InputDecoration(
                    labelText: '시작 시간 (예: 07:00)',
                  ),
                  onChanged: viewModel.updateTime,
                ),
                const SizedBox(height: 24),

                Text('아이콘 선택'),
                Row(
                  children:
                      ['sun', 'coffee', 'alarm'].map((icon) {
                        final isSelected =
                            viewModel.state.routineIconName == icon;
                        return GestureDetector(
                          onTap: () => viewModel.updateRoutineIcon(icon),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
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
                            child: Icon(
                              iconData(icon),
                              color: isSelected ? Colors.blue : Colors.black54,
                              size: 28,
                            ),
                          ),
                        );
                      }).toList(),
                ),

                const SizedBox(height: 16),
                Text('배지 색상'),
                Row(
                  children:
                      ['#FFD700', '#FF8A80', '#A7FFEB'].map((hex) {
                        final color = Color(
                          int.parse('0xFF${hex.substring(1)}'),
                        );
                        return GestureDetector(
                          onTap: () => viewModel.updateBadgeColor(hex),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    viewModel.state.badgeColor == hex
                                        ? Colors.black
                                        : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),

                const SizedBox(height: 16),
                Text('루틴 배경색'),
                Row(
                  children:
                      ['#FFFFFF', '#E3F2FD', '#FFF3E0'].map((hex) {
                        final color = Color(
                          int.parse('0xFF${hex.substring(1)}'),
                        );
                        return GestureDetector(
                          onTap: () => viewModel.updateRoutineColor(hex),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color:
                                    viewModel.state.routineColor == hex
                                        ? Colors.black
                                        : Colors.transparent,
                                width: 2,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),

                const SizedBox(height: 32),

                ElevatedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text('단계 추가'),
                  onPressed:
                      () => showModalBottomSheet(
                        context: context,
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
                                Icon(iconData(step.iconName), size: 24),
                                const SizedBox(width: 12),
                                Expanded(child: Text(step.title)),
                                Text('${step.durationMinutes}분'),
                                IconButton(
                                  onPressed: () => viewModel.removeStep(index),
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

                if (viewModel.state.isSubmitting)
                  const Center(child: CircularProgressIndicator())
                else
                  ElevatedButton(
                    onPressed: () => viewModel.saveRoutine(context: context),
                    child: const Text('루틴 저장하기'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
