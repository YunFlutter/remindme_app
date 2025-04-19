import 'package:flutter/material.dart';
import 'package:remindme_app/core/service/icon_mapper.dart';
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '새 단계 추가',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // 단계 이름
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: '단계 이름',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),

          // 소요 시간
          TextField(
            controller: _durationController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: '소요 시간 (분)',
              border: OutlineInputBorder(),
              suffixText: '분',
            ),
          ),
          const SizedBox(height: 16),

          // 아이콘 선택
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                ['sun', 'coffee', 'alarm'].map((iconName) {
                  final isSelected = _selectedIcon == iconName;
                  return IconButton(
                    onPressed: () {
                      setState(() {
                        _selectedIcon = iconName;
                      });
                    },
                    icon: Icon(
                      iconData(iconName),
                      color:
                          isSelected
                              ? Theme.of(context).primaryColor
                              : Colors.grey,
                    ),
                  );
                }).toList(),
          ),
          const SizedBox(height: 20),

          // 추가 버튼
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
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
                }
              },
              child: Text('단계 추가'),
            ),
          ),
        ],
      ),
    );
  }
}
