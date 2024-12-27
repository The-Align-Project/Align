import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/goal_model.dart';
import '../providers/goal_provider.dart';

class GoalSettingScreen extends StatelessWidget {
  const GoalSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final goalProvider = Provider.of<GoalProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Goal Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Set Your Goals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Display the list of goals
            Expanded(
              child: ListView.builder(
                itemCount: goalProvider.goals.length,
                itemBuilder: (context, index) {
                  final goal = goalProvider.goals[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        goal.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        'Due by: ${goal.dueDate}',
                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today, color: Colors.grey),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              goalProvider.removeGoal(index);
                            },
                          ),
                        ],
                      ),
                      onTap: () {
                        // Optionally, navigate to a detail view to edit the goal
                      },
                    ),
                  );
                },
              ),
            ),
            // Add a button to add new goals
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to a screen where the user can add a new goal
                  _showAddGoalDialog(context);
                },
                child: const Text('Add New Goal'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController dueDateController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Goal'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Goal Title'),
              ),
              TextField(
                controller: dueDateController,
                decoration: const InputDecoration(labelText: 'Due Date'),
                keyboardType: TextInputType.datetime,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final String title = titleController.text;
                final String dueDate = dueDateController.text;
                if (title.isNotEmpty && dueDate.isNotEmpty) {
                  final newGoal = Goal(
                    title: title,
                    dueDate: dueDate,
                  );
                  context.read<GoalProvider>().addGoal(newGoal);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Goal'),
            ),
          ],
        );
      },
    );
  }
}