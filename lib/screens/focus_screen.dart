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
  bool showScore = false;

  void calculateFocusScore() {
    final productiveTime = double.tryParse(productiveTimeController.text);
    final totalTime = double.tryParse(totalTimeController.text);

    if (productiveTime != null && totalTime != null && totalTime > 0) {
      setState(() {
        focusScore = (productiveTime / totalTime) * 100;
        showScore = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please enter valid numbers.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Focus Analysis')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: productiveTimeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Productive Time (hours)',
                border: OutlineInputBorder(),
                hintText: 'Enter the hours you were productive',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: totalTimeController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Total Time (hours)',
                border: OutlineInputBorder(),
                hintText: 'Enter the total hours you spent working',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFocusScore,
              child: Text('Calculate Focus Score'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                backgroundColor: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: showScore ? 200 : 0,
              width: showScore ? 200 : 0,
              child: showScore
                  ? Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        value: focusScore! / 100,
                      ),
                    )
                  : null,
            ),
            if (showScore && focusScore != null)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Your Focus Score:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${focusScore!.toStringAsFixed(2)}%',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}