import 'package:flutter/material.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  _FocusScreenState createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  final TextEditingController productiveTimeController = TextEditingController();
  final TextEditingController totalTimeController = TextEditingController();
  double? focusScore;

  void calculateFocusScore() {
    final productiveTime = double.tryParse(productiveTimeController.text);
    final totalTime = double.tryParse(totalTimeController.text);

    if (productiveTime != null && totalTime != null && totalTime > 0) {
      setState(() {
        focusScore = (productiveTime / totalTime) * 100;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid input')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title:
              Text('Focus Analysis')),
      body:
          Padding(padding:
              const EdgeInsets.all(16.0),child:
                  Column(children:[
                      TextField(controller:
                          productiveTimeController,keyboardType:
                              TextInputType.number,decoration:
                                  InputDecoration(labelText:'Productive Time (hours)'),),SizedBox(height:
                                      10),TextField(controller:
                                          totalTimeController,keyboardType:
                                              TextInputType.number,decoration:
                                                  InputDecoration(labelText:'Total Time (hours)'),),SizedBox(height:
                                                      20),ElevatedButton(onPressed:
                                                          calculateFocusScore,child:
                                                              Text('Calculate Focus Score')),if(focusScore!=null)Padding(padding:
                                                                  const EdgeInsets.only(top:
                                                                      20),child:
                                                                          Text('Your Focus Score is ${focusScore!.toStringAsFixed(2)}%',style:
                                                                              TextStyle(fontSize:
                                                                                  18)),)])));
}}