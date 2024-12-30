import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/focus_provider.dart';

class FocusTracker extends StatelessWidget {
  const FocusTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusProvider = Provider.of<FocusProvider>(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Current Focus Session',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                if (focusProvider.isTracking)
                  const _FocusTimer(),
              ],
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                if (focusProvider.isTracking) {
                  focusProvider.stopTracking();
                } else {
                  focusProvider.startTracking();
                }
              },
              icon: Icon(
                focusProvider.isTracking ? Icons.stop : Icons.play_arrow,
              ),
              label: Text(
                focusProvider.isTracking ? 'End Session' : 'Start Focus Session',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FocusTimer extends StatelessWidget {
  const _FocusTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        final focusProvider = Provider.of<FocusProvider>(context);
        final duration = DateTime.now().difference(
          focusProvider.currentSessionStart ?? DateTime.now(),
        );
        
        return Text(
          '${duration.inHours.toString().padLeft(2, '0')}:'
          '${(duration.inMinutes % 60).toString().padLeft(2, '0')}:'
          '${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.headlineSmall,
        );
      },
    );
  }
}