import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressTrackingScreen extends StatelessWidget {
  const ProgressTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Weekly Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${rod.y.toInt()} tasks completed',
                          const TextStyle(color: Colors.white),
                        );
                      },
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Mon';
                          case 1:
                            return 'Tue';
                          case 2:
                            return 'Wed';
                          case 3:
                            return 'Thu';
                          case 4:
                            return 'Fri';
                          case 5:
                            return 'Sat';
                          case 6:
                            return 'Sun';
                          default:
                            return '';
                        }
                      },
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: _generateBarGroups(), // Mock data
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    // Mock progress data for each day of the week
    final mockData = [3, 5, 7, 8, 4, 6, 5];
    return List.generate(mockData.length, (index) {
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            y: mockData[index].toDouble(),
            colors: [Colors.blue],
            width: 16,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      );
    });
  }
}