import 'package:flutter/material.dart';

class AIInsightProvider with ChangeNotifier {
  List<String> _insights = [];
  final List<String> _userGoals;

  AIInsightProvider(this._userGoals);

  List<String> get insights => _insights;

  void generateInsights() {
    _insights.clear();

    if (_userGoals.isNotEmpty) {
      _insights.add('🔎 You are setting great goals! Keep it up!');
    }

    if (_userGoals.contains('focus') || _userGoals.contains('productivity')) {
      _insights.add('💡 Schedule more focused sessions for increased productivity!');
    }

    if (_userGoals.length > 5) {
      _insights.add('🎯 Try breaking your goals into smaller chunks for better focus.');
    }

    notifyListeners();
  }
}