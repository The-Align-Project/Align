class Goal {
  final String title;
  final String dueDate;
  bool isCompleted;
  bool hasMilestone;

  Goal({
    required this.title,
    required this.dueDate,
    this.isCompleted = false,
    this.hasMilestone = false,
  });
}