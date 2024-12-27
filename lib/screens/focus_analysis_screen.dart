import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FocusAnalysisScreen extends StatelessWidget {
  const FocusAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Focus Score',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[50],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '85', // Mock focus score
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Focus Trends (Last Week)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border.symmetric(
                      horizontal: BorderSide(color: Colors.black12),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 4),
                        FlSpot(1, 6),
                        FlSpot(2, 5),
                        FlSpot(3, 7),
                        FlSpot(4, 6),
                        FlSpot(5, 8),
                        FlSpot(6, 9),
                      ],
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 4,
                      belowBarData: BarAreaData(show: true, colors: [
                        Colors.blue.withOpacity(0.2),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}