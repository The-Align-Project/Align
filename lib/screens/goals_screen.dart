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

  void _deleteGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title:
              Text('Set Goals')),
body:
Column(children:[
Padding(padding:
EdgeInsets.all(16),child:
Row(children:[
Expanded(child:
TextField(controller:
_controller,decoration:
InputDecoration(labelText:'Enter a goal'),),),IconButton(icon:
Icon(Icons.add),onPressed:_addGoal,),],),),Expanded(child:
ListView.builder(itemCount:_goals.length,itemBuilder:(context,index)=>ListTile(title:
Text(_goals[index].title),trailing:
IconButton(icon:
Icon(Icons.delete),onPressed:
()=>_deleteGoal(index),),),),)]));}}