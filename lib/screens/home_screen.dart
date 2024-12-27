import 'package:flutter/material.dart';
import 'focus_analysis_screen.dart';
import 'goal_setting_screen.dart';
import 'progress_tracking_screen.dart';
import 'ai_insights_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Productivity Tool')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const FocusAnalysisScreen()));
              },
              child: const Text('Focus Analysis'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GoalSettingScreen()));
              },
              child: const Text('Goal Setting'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProgressTrackingScreen()));
              },
              child: const Text('Progress Tracking'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AIInsightsScreen()));
              },
              child: const Text('AI Insights'),
            ),
          ],
        ),
      ),
    );
  }
}