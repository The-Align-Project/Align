import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataProvider with ChangeNotifier {
  List<String> _goals = [];

  List<String> get goals => _goals;

  Future<void> loadGoals() async {
    final prefs = await SharedPreferences.getInstance();
    _goals = prefs.getStringList('goals') ?? [];
    notifyListeners();
  }

  Future<void> addGoal(String goal) async {
    _goals.add(goal);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('goals', _goals);
    notifyListeners();
  }

  Future<void> removeGoal(String goal) async {
    _goals.remove(goal);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('goals', _goals);
    notifyListeners();
  }
}