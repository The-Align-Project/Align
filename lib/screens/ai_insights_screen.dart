import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ai_insights_provider.dart';

class AIInsightsScreen extends StatelessWidget {
  const AIInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch the insights using the provider
    final aiInsightsProvider = Provider.of<AIInsightsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Insights'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI Productivity Insights',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Use Consumer to rebuild when insights are updated
            Expanded(
              child: ListView.builder(
                itemCount: aiInsightsProvider.insights.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        aiInsightsProvider.insights[index],
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Fetch new insights from the provider (you could also call an API here)
          aiInsightsProvider.fetchInsights();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}