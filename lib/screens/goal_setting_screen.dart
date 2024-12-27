import 'package:flutter/material.dart';

class GoalSettingScreen extends StatelessWidget {
  const GoalSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Goal Setting')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Goal Setting Feature Coming Soon!'),
          ],
        ),
      ),
    );
  }
}