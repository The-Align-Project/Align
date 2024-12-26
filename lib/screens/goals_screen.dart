import 'package:flutter/material.dart';
import '../models/goal_model.dart';

class GoalsScreen extends StatefulWidget {
  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Goal> _goals = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final TextEditingController _controller = TextEditingController();

  void _addGoal() {
    if (_controller.text.isNotEmpty) {
      final newGoal = Goal(title: _controller.text);
      setState(() {
        _goals.insert(0, newGoal);
        _listKey.currentState?.insertItem(0);
        _controller.clear();
      });
    }
  }

  void _deleteGoal(int index) {
    final removedGoal = _goals[index];
    setState(() {
      _goals.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildGoalItem(removedGoal, animation),
      );
    });
  }

  Widget _buildGoalItem(Goal goal, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: ListTile(
        title: Text(goal.title),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => _deleteGoal(_goals.indexOf(goal)),
        ),
      ),
    );
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
                IconButton(icon: Icon(Icons.add), onPressed: _addGoal),
              ],
            ),
          ),
          Expanded(
            child: AnimatedList(
              key: _listKey,
              initialItemCount: _goals.length,
              itemBuilder:
                  (context, index, animation) =>
                      _buildGoalItem(_goals[index], animation),
            ),
          ),
        ],
      ),
    );
  }
}
