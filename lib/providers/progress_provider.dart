import 'package:flutter/cupertino.dart';

class ProgressProvider with ChangeNotifier {
  final Map<String, double> _goalProgress = {};

  Map<String, double> get goalProgress => _goalProgress;

  void addGoal(String goal) {
    _goalProgress[goal] = 0.0;
    notifyListeners();
  }

  void removeGoal(String goal) {
    _goalProgress.remove(goal);
    notifyListeners();
  }

  void updateGoalProgress(String goal, double progress) {
    _goalProgress[goal] = progress;
    notifyListeners();
  }

  List<String> getSubTasks(String goalTitle) {
    // You can implement this function to return sub-tasks of a goal
    return [];
  }

  void addSubTask(String goalTitle, String subTask) {
    // You can implement this function to add sub-tasks
  }
}