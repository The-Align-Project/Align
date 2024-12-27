import 'package:flutter/material.dart';
import '../models/goal_model.dart';

class GoalProvider with ChangeNotifier {
  List<Goal> _goals = [];

  List<Goal> get goals => _goals;

  void addGoal(Goal goal) {
    _goals.add(goal);
    notifyListeners();
  }

  void removeGoal(int index) {
    _goals.removeAt(index);
    notifyListeners();
  }
}