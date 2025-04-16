import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:remindme_app/core/themes/app_colors.dart';
import 'package:remindme_app/core/themes/basic_emoji_list.dart';
import 'package:remindme_app/core/widgets/emoji_badge.dart';
import 'package:remindme_app/core/widgets/ghost_button_screen.dart';
import 'package:remindme_app/core/widgets/icon_select_picker/icon_select_picker_screen.dart';
import 'package:remindme_app/core/widgets/icon_select_picker/icon_select_picker_view_model.dart';
import 'package:remindme_app/core/widgets/primary_button_screen.dart';
import 'package:remindme_app/core/widgets/routine_card_model.dart';
import 'package:remindme_app/core/widgets/routine_card_screen.dart';
import 'package:remindme_app/core/widgets/text_field_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: WidgetTestPage());
  }
}

class WidgetTestPage extends StatelessWidget {
  WidgetTestPage({super.key});

  final bool buttonActive = true;
  final FocusNode focusNode = FocusNode();
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryButtonScreen(
                  buttonText: '시작하기',
                  buttonActive: buttonActive,
                ),
                GhostButtonScreen(buttonText: '시작하기'),
                TextFieldScreen(
                  focusNode: focusNode,
                  textEditingController: textEditingController,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children:
                      BasicEmojiList.emojiButtons.map((items) {
                        return EmojiBadge(
                          emoji: items.emoji,
                          backGroundColor: items.color,
                        );
                      }).toList(),
                ),
                PrimaryButtonScreen(
                  buttonText: '아이콘 피커',
                  buttonActive: buttonActive,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          width: double.infinity,
                          color: AppColors.baseWhite,
                          height: MediaQuery.of(context).size.height / 2,
                          child: IconSelectPickerScreen(
                            viewModel: IconSelectPickerViewModel(),
                          ),
                        );
                      },
                    );
                  },
                ),
                RoutineCardScreen(
                  cardModel: RoutineCard(
                    icons: LucideIcons.alarmClock,
                    routineTitle: "아침 루틴",
                    routineTime: '5',
                    badgeBackGroundColor: AppColors.primaryBlue,
                    badgeColor: AppColors.baseWhite,
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
