import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar.large(
          title: Text('Goals'),
          floating: true,
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                Text('Goals page content'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}