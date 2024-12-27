import 'package:flutter/material.dart';

class AIInsightsProvider with ChangeNotifier {
  List<String> _insights = [];

  List<String> get insights => _insights;

  void fetchInsights() {
    // Mock API call
    _insights = [
      '📈 You are most productive between 9 AM and 11 AM. Schedule your deep work during this time.',
      '⏳ Tasks that take longer than 1 hour tend to cause distractions. Try breaking them into smaller chunks.',
      '🎯 You achieved 80% of your weekly goals last week. Great work!',
      '⚡ Consider reducing screen time by 20% to improve focus and reduce fatigue.',
      '💡 Your focus improved by 15% compared to the previous week. Keep it up!',
    ];
    notifyListeners();
  }
}