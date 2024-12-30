import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/ai_insight_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize insights when HomeScreen is loaded
    Provider.of<AIInsightProvider>(context, listen: false).generateInsights();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productivity App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              // Log out and go back to the auth screen
              Provider.of<AuthProvider>(context, listen: false).logOut();
              Navigator.of(context).pushReplacementNamed('/auth');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/goal-setting');
              },
              child: const Text('Set New Goals'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/progress-tracking');
              },
              child: const Text('Track Progress'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/gamification');
              },
              child: const Text('Gamification'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/ai-insights');
              },
              child: const Text('View AI Insights'),
            ),
          ],
        ),
      ),
    );
  }
}