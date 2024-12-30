import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text('Focus Dashboard'),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                FocusTracker(),
                SizedBox(height: 16),
                FocusStats(),
                SizedBox(height: 16),
                TodayGoals(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}