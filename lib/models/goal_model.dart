import 'package:flutter/material.dart';

class Goal {
  final String title;
  bool isCompleted;
  int priority; // 0 - Low, 1 - Medium, 2 - High
  DateTime? deadline;
  double progress; // Value between 0 and 1 representing the progress

  Goal({
    required this.title,
    this.isCompleted = false,
    this.priority = 1, // Default medium priority
    this.deadline,
    this.progress = 0.0, // Default progress is 0
  });

  // Toggle the completion status of the goal
  void toggleCompletion() {
    isCompleted = !isCompleted;
  }

  // Convert goal to JSON for storage (e.g., shared preferences or database)
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'priority': priority,
      'deadline': deadline?.toIso8601String(),
      'progress': progress,
    };
  }

  // Create a Goal from JSON (e.g., from database or shared preferences)
  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      title: json['title'],
      isCompleted: json['isCompleted'],
      priority: json['priority'],
      deadline: json['deadline'] != null
          ? DateTime.parse(json['deadline'])
          : null,
      progress: json['progress']?.toDouble() ?? 0.0,
    );
  }

  // Return a string representation of the goal's priority
  String get priorityString {
    switch (priority) {
      case 0:
        return 'Low';
      case 1:
        return 'Medium';
      case 2:
        return 'High';
      default:
        return 'Unknown';
    }
  }

  // Display a formatted deadline if it exists
  String get formattedDeadline {
    return deadline != null
        ? "${deadline!.day}/${deadline!.month}/${deadline!.year}"
        : 'No deadline';
  }
}