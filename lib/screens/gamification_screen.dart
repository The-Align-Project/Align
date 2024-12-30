import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../providers/streak_provider.dart';

class GamificationScreen extends StatelessWidget {
  const GamificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final streakProvider = Provider.of<StreakProvider>(context);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Gamification'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Gamification Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Current Streak: ${streakProvider.streak} days',
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            CupertinoButton.filled(
              onPressed: () {
                streakProvider.incrementStreak();
              },
              child: const Text('Complete Task'),
            ),
            const SizedBox(height: 16),
            CupertinoButton(
              color: CupertinoColors.destructiveRed,
              onPressed: () {
                streakProvider.resetStreak();
              },
              child: const Text('Reset Streak'),
            ),
          ],
        ),
      ),
    );
  }
}