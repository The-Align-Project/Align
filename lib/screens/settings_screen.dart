import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Preferences',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: const Text('Enable Notifications'),
              subtitle: const Text('Receive daily reminders'),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Dark Theme'),
              subtitle: const Text('Switch between light and dark themes'),
              value: _darkTheme,
              onChanged: (value) {
                setState(() {
                  _darkTheme = value;
                  _applyTheme(context, value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  void _applyTheme(BuildContext context, bool darkTheme) {
    final themeData = darkTheme ? ThemeData.dark() : ThemeData.light();
    // Update the theme dynamically
    // Note: In a real app, use a provider or state management solution to handle theme changes globally.
  }
}