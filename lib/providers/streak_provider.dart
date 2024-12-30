import 'package:flutter/material.dart';

class StreakProvider with ChangeNotifier {
  int _streak = 0;

  int get streak => _streak;

  void incrementStreak() {
    _streak++;
    notifyListeners();
  }

  void resetStreak() {
    _streak = 0;
    notifyListeners();
  }
}