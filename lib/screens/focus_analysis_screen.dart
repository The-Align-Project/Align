import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:provider/provider.dart';
import '../providers/focus_provider.dart';

class FocusAnalysisScreen extends StatelessWidget {
  const FocusAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final focusProvider = Provider.of<FocusProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Analysis'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Your Focus Score',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildFocusScoreGauge(focusProvider.focusScore),
              const SizedBox(height: 32),
              const Text(
                'Time Spent on Tasks',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildTaskDurationList(focusProvider.taskDurations),
              const SizedBox(height: 32),
              const Text(
                'Distraction Analysis',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildDistractionAnalysis(focusProvider.distractions),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFocusScoreGauge(double focusScore) {
    return Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 0,
              maximum: 100,
              ranges: <GaugeRange>[
                GaugeRange(startValue: 0, endValue: 50, color: Colors.red),
                GaugeRange(startValue: 50, endValue: 80, color: Colors.orange),
                GaugeRange(startValue: 80, endValue: 100, color: Colors.green),
              ],
              pointers: <GaugePointer>[
                NeedlePointer(value: focusScore),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '${focusScore.toStringAsFixed(1)}%',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  angle: 90,
                  positionFactor: 0.5,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskDurationList(List<Map<String, dynamic>> taskDurations) {
    return Column(
      children: taskDurations.map((task) {
        return ListTile(
          leading: const Icon(Icons.task_alt, color: Colors.blue),
          title: Text(task['taskName']),
          subtitle: Text('Duration: ${task['duration']} minutes'),
        );
      }).toList(),
    );
  }

  Widget _buildDistractionAnalysis(Map<String, int> distractions) {
    return Column(
      children: distractions.entries.map((entry) {
        return ListTile(
          leading: const Icon(Icons.warning, color: Colors.red),
          title: Text(entry.key),
          subtitle: Text('Occurrences: ${entry.value}'),
        );
      }).toList(),
    );
  }
}