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
      appBar: AppBar(
        title: const Text('AI Productivity Tool'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            _buildFeatureCard(
              context,
              'Focus Analysis',
              Icons.insights,
              const FocusAnalysisScreen(),
            ),
            _buildFeatureCard(
              context,
              'Goal Setting',
              Icons.task,
              const GoalSettingScreen(),
            ),
            _buildFeatureCard(
              context,
              'Progress Tracking',
              Icons.bar_chart,
              const ProgressTrackingScreen(),
            ),
            _buildFeatureCard(
              context,
              'AI Insights',
              Icons.lightbulb,
              const AIInsightsScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(
      BuildContext context, String title, IconData icon, Widget screen) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.blue),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}