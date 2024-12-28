import 'dart:async';
import 'package:flutter/cupertino.dart';

class TimeProvider with ChangeNotifier {
  Map<String, int> _taskTime = {}; // stores time spent on each task
  Map<String, Timer?> _timers = {}; // stores active timers

  Map<String, int> get taskTime => _taskTime;

  void startTimer(String taskName) {
    if (_timers.containsKey(taskName) && _timers[taskName]!.isActive) return;

    final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _taskTime[taskName] = (_taskTime[taskName] ?? 0) + 1;
      notifyListeners();
    });
    _timers[taskName] = timer;
  }

  void stopTimer(String taskName) {
    _timers[taskName]?.cancel();
    notifyListeners();
  }

  void resetTimer(String taskName) {
    _taskTime[taskName] = 0;
    notifyListeners();
  }
}