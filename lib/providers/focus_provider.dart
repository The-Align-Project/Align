import 'package:flutter/material.dart';

class FocusProvider with ChangeNotifier {
  int _focusScore = 85; // Mock focus score
  List<double> _focusTrends = [4, 6, 5, 7, 6, 8, 9]; // Mock trend data

  int get focusScore => _focusScore;
  List<double> get focusTrends => _focusTrends;

  void updateFocusScore(int score) {
    _focusScore = score;
    notifyListeners();
  }

  void updateFocusTrends(List<double> trends) {
    _focusTrends = trends;
    notifyListeners();
  }
}