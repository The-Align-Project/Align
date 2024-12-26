import 'package:flutter/material.dart';
import '../services/ai_service.dart';

class FocusScreen extends StatefulWidget {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers.')),
      );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text('Focus Analysis')),
  //     body: Padding(
  //       padding: const EdgeInsets.all(16.0),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.stretch,
  //         children: [
  //           TextField(
  //             controller: productiveTimeController,
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: 'Productive Time (hours)',
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(height: 16),
  //           TextField(
  //             controller: totalTimeController,
  //             keyboardType: TextInputType.number,
  //             decoration: InputDecoration(
  //               labelText: 'Total Time (hours)',
  //               border: OutlineInputBorder(),
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: calculateFocusScore,
  //             child: Text('Calculate Focus Score'),
  //           ),
  //           SizedBox(height: 20),
  //           if (focusScore != null)
  //             Center(
  //               child: Column(
  //                 children: [
  //                   Text(
  //                     'Your Focus Score:',
  //                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //                   ),
  //                   SizedBox(height: 10),
  //                   Text(
  //                     '${focusScore!.toStringAsFixed(2)}%',
  //                     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Focus Analysis')),
    body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Existing input fields and button...
          if (focusScore != null)
            Center(
              child: Column(
                children: [
                  Text(
                    'Your Focus Score:',
                    style:
                        TextStyle(fontSize:
                            18,fontWeight:
                                FontWeight.bold),),SizedBox(height:
                                    10),Text('${focusScore!.toStringAsFixed(2)}%',style:
                                        TextStyle(fontSize:
                                            32,fontWeight:
                                                FontWeight.bold,color:
                                                    Colors.blue),),SizedBox(height:
                                                        20),Text(AIService.generateInsight(focusScore!),style:
                                                            TextStyle(fontSize:
                                                                16,color:
                                                                    Colors.grey[700]),textAlign:
                                                                        TextAlign.center,),],),),],),),);}}


