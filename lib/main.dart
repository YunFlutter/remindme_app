import 'package:flutter/material.dart';
import 'package:remindme_app/core/widgets/ghost_button_screen.dart';
import 'package:remindme_app/core/widgets/primary_button_screen.dart';
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
