import 'package:flutter/foundation.dart';
import '../models/focus_session.dart';

class FocusProvider with ChangeNotifier {
  List<FocusSession> _sessions = [];
  bool _isTracking = false;
  DateTime? _currentSessionStart;

  bool get isTracking => _isTracking;
  List<FocusSession> get sessions => _sessions;

  void startTracking() {
    _isTracking = true;
    _currentSessionStart = DateTime.now();
    notifyListeners();
  }

  void stopTracking() {
    if (_currentSessionStart != null) {
      _sessions.add(
        FocusSession(
          startTime: _currentSessionStart!,
          endTime: DateTime.now(),
          focusScore: _calculateFocusScore(),
          metrics: _collectMetrics(),
        ),
      );
    }
    _isTracking = false;
    _currentSessionStart = null;
    notifyListeners();
  }

  double _calculateFocusScore() {
    // Implement focus score calculation logic
    return 0.0;
  }

  Map<String, dynamic> _collectMetrics() {
    // Implement metrics collection logic
    return {};
  }
}