import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/goal_provider.dart';
import 'providers/ai_insights_provider.dart'; // Import the provider
import 'screens/main_navigation.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoalProvider()),
        ChangeNotifierProvider(create: (_) => AIInsightsProvider()),  // Register the provider here
      ],
      child: const ProductivityApp(),
    ),
  );
}

class ProductivityApp extends StatelessWidget {
  const ProductivityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AI Productivity Tool',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        fontFamily: 'Roboto',
      ),
      home: const MainNavigation(),
    );
  }
}