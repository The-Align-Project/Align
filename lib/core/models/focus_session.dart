class FocusSession {
  final DateTime startTime;
  final DateTime? endTime;
  final double focusScore;
  final Map<String, dynamic> metrics;

  FocusSession({
    required this.startTime,
    this.endTime,
    required this.focusScore,
    required this.metrics,
  });

  Map<String, dynamic> toJson() => {
    'startTime': startTime.toIso8601String(),
    'endTime': endTime?.toIso8601String(),
    'focusScore': focusScore,
    'metrics': metrics,
  };
}