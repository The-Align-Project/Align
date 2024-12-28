import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_screen.dart';
import 'auth_screen.dart';
import 'goal_setting_screen.dart';
import 'progress_tracking_screen.dart';
import 'gamification_screen.dart';
import 'ai_insights_screen.dart';
import '../providers/auth_provider.dart';

class MainNavigation extends StatelessWidget {
  const MainNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (ctx, authProvider, _) {
        return MaterialApp(
          title: 'Productivity App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: authProvider.isAuthenticated() ? const HomeScreen() : const AuthScreen(),
          routes: {
            '/home': (ctx) => const HomeScreen(),
            '/auth': (ctx) => const AuthScreen(),
            '/goal-setting': (ctx) => const GoalSettingScreen(),
            '/progress-tracking': (ctx) => const ProgressTrackingScreen(),
            '/gamification': (ctx) => const GamificationScreen(),
            '/ai-insights': (ctx) => const AIInsightScreen(), // Ensure this route is correctly linked
          },
        );
      },
    );
  }
}