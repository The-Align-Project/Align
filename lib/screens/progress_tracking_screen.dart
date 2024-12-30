import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/progress_provider.dart';
import '../providers/streak_provider.dart';

class ProgressTrackingScreen extends StatelessWidget {
  const ProgressTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final progressProvider = Provider.of<ProgressProvider>(context);
    final streakProvider = Provider.of<StreakProvider>(context);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Track Your Progress'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Current Streak',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${streakProvider.streak} Days',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            const Text(
              'Goal Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
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
            CupertinoButton.filled(
              onPressed: () {
                streakProvider.incrementStreak();
              },
              child: const Text('Complete Task and Increase Streak'),
            ),
          ],
        ),
      ),
    );
  }
}