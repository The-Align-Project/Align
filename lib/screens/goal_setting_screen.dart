import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/progress_provider.dart';

class GoalSettingScreen extends StatelessWidget {
  const GoalSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Set Your Goals'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: progressProvider.goalProgress.length,
                itemBuilder: (context, index) {
                  final goalTitle =
                      progressProvider.goalProgress.keys.toList()[index];
                  return CupertinoListTile(
                    title: Text(goalTitle),
                    subtitle: Text(
                        'Progress: ${progressProvider.goalProgress[goalTitle]?.toStringAsFixed(1)}%'),
                    trailing: CupertinoButton(
                      child: const Icon(CupertinoIcons.delete, color: CupertinoColors.destructiveRed),
                      onPressed: () {
                        progressProvider.removeGoal(goalTitle);
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            CupertinoButton.filled(
              onPressed: () {
                _showAddGoalDialog(context, progressProvider);
              },
              child: const Text('Add New Goal'),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddGoalDialog(
      BuildContext context, ProgressProvider progressProvider) {
    final TextEditingController goalController = TextEditingController();

    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Add New Goal'),
          content: Column(
            children: [
              const SizedBox(height: 8),
              CupertinoTextField(
                controller: goalController,
                placeholder: 'Goal Title',
              ),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                if (goalController.text.isNotEmpty) {
                  progressProvider.addGoal(goalController.text);
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