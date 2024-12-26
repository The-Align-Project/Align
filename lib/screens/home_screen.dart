import 'package:flutter/material.dart';
import 'goals_screen.dart';
import 'focus_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Small steps lead to big achievements.",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 20),
            _buildNavigationCard(
              context,
              title: "Set Goals",
              subtitle: "Plan and track your goals",
              iconData: Icons.checklist,
              onTap: () => _navigateTo(context, GoalsScreen()),
            ),
            SizedBox(height: 20),
            _buildNavigationCard(
              context,
              title: "Focus Analysis",
              subtitle: "Measure your productivity",
              iconData: Icons.insights,
              onTap: () => _navigateTo(context, FocusScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationCard(BuildContext context,
      {required String title, required String subtitle, required IconData iconData, required VoidCallback onTap}) {
    return InkWell(
  onTap: onTap,
  borderRadius: BorderRadius.circular(12), // Ensures ripple effect matches card shape
  child: Card(
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Matches the InkWell border radius
    ),
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(
            iconData, // Icon passed as a parameter
            size: 40,
            color: Colors.blue, // Primary color for icons
          ),
          SizedBox(width: 16), // Spacing between icon and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title, // Title passed as a parameter
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                subtitle, // Subtitle passed as a parameter
                style: TextStyle(
                  color: Colors.grey[600], // Subtle text color for subtitles
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

  }

void _navigateTo(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide in from the right
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}

}