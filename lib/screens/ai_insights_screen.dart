import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ai_insight_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/data_provider.dart';

class AIInsightScreen extends StatefulWidget {
  const AIInsightScreen({super.key});

  @override
  _AIInsightScreenState createState() => _AIInsightScreenState();
}

class _AIInsightScreenState extends State<AIInsightScreen> {
  @override
  void initState() {
    super.initState();
    // Generate AI insights when the screen loads
    final userGoals = Provider.of<DataProvider>(context, listen: false).goals;
    Provider.of<AIInsightProvider>(context, listen: false).generateInsights();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('AI Insights'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Logout functionality
            Provider.of<AuthProvider>(context, listen: false).logOut();
            Navigator.of(context).pushReplacementNamed('/auth');
          },
          child: const Icon(CupertinoIcons.power),
        ),
      ),
      child: Consumer<AIInsightProvider>(
        builder: (ctx, insightProvider, _) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Personalized Insights',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                if (insightProvider.insights.isEmpty)
                  const CupertinoActivityIndicator()
                else
                  Column(
                    children: insightProvider.insights
                        .map((insight) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.lightbulb,
                                    color: CupertinoColors.activeBlue,
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(insight),
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}