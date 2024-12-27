import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double progress; // Value between 0 and 1

  const ProgressBar({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(5),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          decoration: BoxDecoration(
            color: progress >= 0.8
                ? Colors.green
                : progress >= 0.5
                    ? Colors.yellow
                    : Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}