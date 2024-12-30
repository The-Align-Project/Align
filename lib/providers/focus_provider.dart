import 'package:flutter/material.dart';

class FocusProvider with ChangeNotifier {
  double _focusScore = 75.0; // Mock focus score
  List<Map<String, dynamic>> _taskDurations = [
    {'taskName': 'Writing Report', 'duration': 120},
    {'taskName': 'Design Mockup', 'duration': 90},
    {'taskName': 'Team Meeting', 'duration': 60},
  ]; // Mock task durations
  Map<String, int> _distractions = {
    'Social Media': 5,
    'Emails': 3,
    'Frequent Breaks': 4,
  }; // Mock distractions

  double get focusScore => _focusScore;
  List<Map<String, dynamic>> get taskDurations => _taskDurations;
  Map<String, int> get distractions => _distractions;

  void updateFocusScore(double score) {
    _focusScore = score;
    notifyListeners();
  }

  void addTaskDuration(String taskName, int duration) {
    _taskDurations.add({'taskName': taskName, 'duration': duration});
    notifyListeners();
  }

  void updateDistractions(String distraction, int count) {
    _distractions[distraction] = count;
    notifyListeners();
  }
}