import 'package:flutter/material.dart';
import 'focus_analysis_screen.dart';
import 'goal_setting_screen.dart';
import 'progress_tracking_screen.dart';
import 'ai_insights_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const FocusAnalysisScreen(),
    const GoalSettingScreen(),
    const ProgressTrackingScreen(),
    const AIInsightsScreen(),
  ];

  final List<String> _titles = [
    'Focus Analysis',
    'Goal Setting',
    'Progress Tracking',
    'AI Insights',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Focus',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flag),
            label: 'Goals',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Insights',
          ),
        ],
      ),
    );
  }
}