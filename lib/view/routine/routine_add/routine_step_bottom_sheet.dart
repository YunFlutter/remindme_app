import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/service/icon_mapper.dart';
import 'package:remindme_app/core/themes/app_text_styles.dart';
import 'package:remindme_app/core/widgets/custom_text_field.dart';
import 'package:remindme_app/core/widgets/ghost_button.dart';
import 'package:remindme_app/view/routine/routine_add/routine_add_view_model.dart';

class RoutineStepBottomSheet extends StatefulWidget {
  final RoutineAddViewModel viewModel;
  const RoutineStepBottomSheet({super.key, required this.viewModel});

  @override
  State<RoutineStepBottomSheet> createState() => _RoutineStepBottomSheetState();
}

class _RoutineStepBottomSheetState extends State<RoutineStepBottomSheet> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _durationController = TextEditingController(
    text: '5',
  ); // 기본값 5분
  String _selectedIcon = 'sun';

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: bottom + 20,
        top: 20,
      ),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '새 단계 추가',
            style: AppTextStyles.headingL(),
            textAlign: TextAlign.center,
          ),

          // 단계 이름
          Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('스탭 이름', style: AppTextStyles.caption()),
              CustomTextField(
                focusNode: FocusNode(),
                textEditingController: _titleController,
              ),
            ],
          ),
          Column(
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('소요 시간 (분)', style: AppTextStyles.caption()),
              CustomTextField(
                focusNode: FocusNode(),
                textEditingController: _durationController,
                keyBoardType: TextInputType.number,
              ),
            ],
          ),

          Wrap(
            runSpacing: 10,
            children:
                widget.viewModel.state.routineIconNames.map((icon) {
                  final isSelected = _selectedIcon == icon;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIcon = icon;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:
                            isSelected ? Colors.blue[50] : Colors.transparent,
                        border: Border.all(
                          color:
                              isSelected ? Colors.blue : Colors.grey.shade300,
                          width: isSelected ? 2 : 1,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: LucideIconWidget(
                        icon: getLucideIconData(icon),
                        color: isSelected ? Colors.blue : Colors.black54,
                        size: 28,
                      ),
                    ),
                  );
                }).toList(),
          ),

          // 추가 버튼
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 3,
            child: GhostButton(
              buttonText: "추가하기",
              onTap: () {
                final title = _titleController.text.trim();
                final duration =
                    int.tryParse(_durationController.text.trim()) ?? 1;

                if (title.isNotEmpty) {
                  widget.viewModel.addStep(
                    title: title,
                    iconName: _selectedIcon,
                    durationMinutes: duration,
                  );
                  Navigator.of(context).pop();
                }else{
                  Fluttertoast.showToast(msg: "앗! 스텝 제목(이름)이 입력이 안되어 었어요");
                }
              },
            ),
          ),

          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       backgroundColor: WidgetStatePropertyAll<Color>(AppColors.baseWhite),
          //     ),
          //     onPressed: () {
          //       final title = _titleController.text.trim();
          //       final duration =
          //           int.tryParse(_durationController.text.trim()) ?? 1;
          //
          //       if (title.isNotEmpty) {
          //         widget.viewModel.addStep(
          //           title: title,
          //           iconName: _selectedIcon,
          //           durationMinutes: duration,
          //         );
          //         Navigator.of(context).pop();
          //       }
          //     },
          //     child: Text('단계 추가'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
