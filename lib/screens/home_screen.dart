import 'package:flutter/material.dart';
import 'goals_screen.dart';
import 'focus_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Align')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => GoalsScreen()),
                );
              },
              child: Text('Set Goals'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => FocusScreen()),
                );
              },
              child: Text('Focus Analysis'),
            ),
          ],
        ),
      ),
    );
  }
}