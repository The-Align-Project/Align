import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // Value between 0 and 1
  final double height; // Customizable height of the progress bar
  final double borderRadius; // Customizable border radius
  final bool showPercentage; // Whether to show progress as a percentage inside the bar

  const ProgressBar({
    super.key,
    required this.progress,
    this.height = 10,
    this.borderRadius = 5,
    this.showPercentage = false,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate color based on the progress
    Color progressColor = Colors.blue;
    if (progress < 0.3) {
      progressColor = Colors.red;
    } else if (progress < 0.7) {
      progressColor = Colors.orange;
    } else {
      progressColor = Colors.green;
    }

    return Stack(
      children: [
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: height,
            decoration: BoxDecoration(
              color: progressColor,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: showPercentage
                ? Center(
                    child: Text(
                      '${(progress * 100).toStringAsFixed(0)}%',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}