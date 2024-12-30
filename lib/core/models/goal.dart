class Goal {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final List<Task> tasks;
  final double progress;

  Goal({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    required this.tasks,
    this.progress = 0.0,
  });
}

class Task {
  final String id;
  final String title;
  bool completed;
  final Duration estimatedTime;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
    required this.estimatedTime,
  });
}