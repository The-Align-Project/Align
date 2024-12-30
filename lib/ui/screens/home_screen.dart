import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/focus_provider.dart';
import '../widgets/focus_tracker.dart';
import '../widgets/progress_dashboard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Analyzer'),
      ),
      body: Column(
        children: const [
          FocusTracker(),
          ProgressDashboard(),
        ],
      ),
    );
  }
}