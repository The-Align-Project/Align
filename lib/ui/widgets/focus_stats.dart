import 'package:flutter/material.dart';
import '../../core/providers/focus_provider.dart';

class FocusStats extends StatelessWidget {
  const FocusStats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusProvider = context.watch<FocusProvider>();
    final theme = Theme.of(context);

    final totalDuration = _calculateTotalDuration(focusProvider.sessions);
    final averageScore = _calculateAverageScore(focusProvider.sessions);
    final streak = _calculateStreak(focusProvider.sessions);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today\'s Progress',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _StatCard(
                    icon: Icons.timer,
                    value: _formatDuration(totalDuration),
                    label: 'Focus Time',
                    color: theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    icon: Icons.analytics,
                    value: '${(averageScore * 100).toStringAsFixed(0)}%',
                    label: 'Focus Score',
                    color: theme.colorScheme.tertiary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatCard(
                    icon: Icons.local_fire_department,
                    value: streak.toString(),
                    label: 'Day Streak',
                    color: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Duration _calculateTotalDuration(List<FocusSession> sessions) {
    return sessions.fold(Duration.zero, (total, session) {
      if (session.endTime != null) {
        return total + session.endTime!.difference(session.startTime);
      }
      return total;
    });
  }

  double _calculateAverageScore(List<FocusSession> sessions) {
    if (sessions.isEmpty) return 0;
    final total = sessions.fold(0.0, (sum, session) => sum + session.focusScore);
    return total / sessions.length;
  }

  int _calculateStreak(List<FocusSession> sessions) {
    if (sessions.isEmpty) return 0;
    
    int streak = 0;
    DateTime? lastDate;
    
    for (var session in sessions.reversed) {
      final sessionDate = DateTime(
        session.startTime.year,
        session.startTime.month,
        session.startTime.day,
      );
      
      if (lastDate == null) {
        lastDate = sessionDate;
        streak = 1;
      } else if (sessionDate.difference(lastDate).inDays == -1) {
        streak++;
        lastDate = sessionDate;
      } else {
        break;
      }
    }
    
    return streak;
  }

  String _formatDuration(Duration duration) {
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;
    return '${hours}h ${minutes}m';
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _StatCard({
    Key? key,
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}