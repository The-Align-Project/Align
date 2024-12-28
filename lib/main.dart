import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/auth_screen.dart';
import 'screens/home_screen.dart';
import 'screens/goal_setting_screen.dart';
import 'screens/progress_tracking_screen.dart';
import 'screens/gamification_screen.dart';
import 'screens/ai_insights_screen.dart';
import 'providers/auth_provider.dart';
import 'providers/data_provider.dart';
import 'providers/ai_insight_provider.dart';
import 'providers/time_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => AuthProvider(),
      child: Consumer<AuthProvider>(
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
              '/ai-insights': (ctx) => const AIInsightScreen(),
            },
          );
        },
      ),
    );
  }
}