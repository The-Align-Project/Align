import 'package:flutter/material.dart';

class Goal {
  bool isCompleted;
  String description;

  Goal({required this.isCompleted, required this.description});
}

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  _GoalsScreenState createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  final List<Goal> _goals = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final TextEditingController _controller = TextEditingController();
  DateTime? selectedDate;

  void _addGoal() {
    if (_controller.text.isNotEmpty) {
      final newGoal = Goal(isCompleted: false, description: _controller.text);
      setState(() {
        _goals.insert(0, newGoal);
        _listKey.currentState?.insertItem(0);
        _controller.clear();
        selectedDate = null;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Goal added!'), backgroundColor: Colors.green),
        );
      });
    }
  }

  void _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2025),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
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
      appBar: AppBar(title: Text('Set Your Goals'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        labelText: 'Enter a goal',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _addGoal,
                    child: Text('Add'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            AnimatedList(
              key: _listKey,
              initialItemCount: _goals.length,
              itemBuilder: (context, index, animation) {
                final goal = _goals[index];
                return _buildGoalItem(goal, index, animation);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGoalItem(Goal goal, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        margin: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          title: Text(
            goal.description,
            style: TextStyle(
              decoration: goal.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: selectedDate != null ? Text('Due: ${selectedDate!.toLocal()}') : null,
          trailing: Checkbox(
            value: goal.isCompleted,
            onChanged: (bool? value) {
              _toggleGoalCompletion(index);
            },
          ),
        ),
      ),
    );
  }
}