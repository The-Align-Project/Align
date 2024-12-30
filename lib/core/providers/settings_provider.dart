import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  bool _darkMode = false;
  bool _notifications = true;
  int _dailyGoalHours = 4;
  TimeOfDay _reminderTime = const TimeOfDay(hour: 9, minute: 0);

  bool get darkMode => _darkMode;
  bool get notifications => _notifications;
  int get dailyGoalHours => _dailyGoalHours;
  TimeOfDay get reminderTime => _reminderTime;

  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }

  void toggleNotifications() {
    _notifications = !_notifications;
    notifyListeners();
  }

  void setDailyGoalHours(int hours) {
    _dailyGoalHours = hours;
    notifyListeners();
  }

  void setReminderTime(TimeOfDay time) {
    _reminderTime = time;
    notifyListeners();
  }
}