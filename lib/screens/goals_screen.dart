import 'package:flutter/material.dart';
import '../models/goal_model.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Goal added!'),
            backgroundColor: Colors.green,
          ),
        );
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Goal deleted!'),
        backgroundColor: Colors.redAccent,
      ),
    );
  }

  Widget _buildGoalItem(Goal goal, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: Icon(Icons.flag, color: Colors.blue),
          title: Text(
            goal.title,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.redAccent),
            onPressed: () => _showDeleteDialog(_goals.indexOf(goal)),
          ),
        ),
      ),
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Goal'),
        content: Text('Are you sure you want to delete this goal?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteGoal(index);
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Your Goals'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
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
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blueAccent, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: _addGoal,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                      child: Text('Add'),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: _goals.length,
                  itemBuilder: (context, index, animation) =>
                      _buildGoalItem(_goals[index], animation),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}