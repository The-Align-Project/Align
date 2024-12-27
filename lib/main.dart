import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(AlignApp());
}

class AlignApp extends StatelessWidget {
  const AlignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Align',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        // Update text theme to use 'titleLarge' instead of 'headline6'
        brightness: Brightness.light, // default light theme
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 4.0,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // replaced headline6 with titleLarge
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blueGrey,
          elevation: 4.0,
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), // replaced headline6 with titleLarge
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
        ),
      ),
      themeMode: ThemeMode.system, // Use system-wide theme (light or dark)
      home: HomeScreen(),
    );
  }
}