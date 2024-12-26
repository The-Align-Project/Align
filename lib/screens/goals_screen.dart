import 'package:flutter/material.dart';
import '../models/goal_model.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Goal> _goals = [];
  final TextEditingController _controller = TextEditingController();

  void _addGoal() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _goals.add(Goal(title: _controller.text, isCompleted: false));
        _controller.clear();
      });
    }
  }

  void _toggleGoalCompletion(int index) {
    setState(() {
      _goals[index].isCompleted = !_goals[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Set Your Goals')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration:
                        InputDecoration(labelText: 'Enter a goal'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addGoal,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _goals.length,
              itemBuilder: (context, index) => ListTile(
                title:
                    Text(_goals[index].title),
                leading:
                    Checkbox(value:
                        _goals[index].isCompleted,
                        onChanged:
                            (_) =>
                                _toggleGoalCompletion(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}