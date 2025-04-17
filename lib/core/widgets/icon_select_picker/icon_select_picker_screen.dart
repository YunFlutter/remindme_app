import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/constants/lucide_icon_data_with_keywords.dart';
import 'package:remindme_app/core/widgets/icon_select_picker/icon_select_picker_view_model.dart';
import 'package:remindme_app/core/widgets/custom_text_field.dart';

class IconSelectPickerScreen extends StatefulWidget {
  final IconSelectPickerViewModel viewModel;

  const IconSelectPickerScreen({super.key, required this.viewModel});

  @override
  State<IconSelectPickerScreen> createState() => _IconSelectPickerScreenState();
}

class _IconSelectPickerScreenState extends State<IconSelectPickerScreen> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    // 이전 타이머가 있다면 취소
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    // 새 타이머 시작 (800ms 후 실행)
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final text = _controller.text;
      print("text : $text");
      widget.viewModel.searchIconKeyWord(keyword: text);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20,
            children: [
              SizedBox(height: 0),
              CustomTextField(
                focusNode: _focusNode,
                textEditingController: _controller,
              ),
              if (widget.viewModel.state.searchIconKeyWord.isEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      runSpacing: 16,
                      spacing: 16,
                      children:
                          lucideIconData.map((items) {
                            return LucideIconWidget(
                              icon: items["icon"],
                              size: 32,
                            );
                          }).toList(),
                    ),
                  ),
                ),
              if (widget.viewModel.state.searchIconKeyWord.isNotEmpty)
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      runSpacing: 16,
                      spacing: 16,
                      children:
                          widget.viewModel.state.filterIconList.map((items) {
                            return LucideIconWidget(
                              icon: items["icon"],
                              size: 32,
                            );
                          }).toList(),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
