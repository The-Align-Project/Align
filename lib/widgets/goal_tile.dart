import 'package:flutter/cupertino.dart';

class GoalTile extends StatelessWidget {
  final String goalTitle;
  final double progress;
  final VoidCallback onRemove;

  const GoalTile({
    required this.goalTitle,
    required this.progress,
    required this.onRemove,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(goalTitle),
      subtitle: Text('Progress: ${progress.toStringAsFixed(1)}%'),
      trailing: CupertinoButton(
        child: const Icon(CupertinoIcons.delete, color: CupertinoColors.destructiveRed),
        onPressed: onRemove,
      ),
    );
  }
}