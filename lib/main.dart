import 'package:flutter/material.dart';
import 'package:remindme_app/core/widgets/primary_button/primary_button_screen.dart';

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
  const WidgetTestPage({super.key});

  final bool buttonActive = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryButtonScreen(
                  buttonText: '시작하기',
                  buttonActive: buttonActive,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
