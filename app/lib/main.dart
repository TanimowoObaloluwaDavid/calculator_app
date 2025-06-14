import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayText = '0';

  // Build a single button
  Widget calcButton(String text, Color bgColor, Color textColor) {
    return SizedBox(
      width: 75,
      height: 75,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            displayText = (displayText == '0') ? text : displayText + text;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(0),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 24, color: textColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Display area
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Text(
                displayText,
                style: TextStyle(fontSize: 60, color: Colors.white),
                maxLines: 1,
              ),
            ),
            SizedBox(height: 10),
            // Button layout
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                calcButton('AC', Colors.grey, Colors.black),
                calcButton('+/-', Colors.grey, Colors.black),
                calcButton('%', Colors.grey, Colors.black),
                calcButton('/', Colors.orange, Colors.white),
                calcButton('7', Colors.grey.shade800, Colors.white),
                calcButton('8', Colors.grey.shade800, Colors.white),
                calcButton('9', Colors.grey.shade800, Colors.white),
                calcButton('x', Colors.orange, Colors.white),
                calcButton('4', Colors.grey.shade800, Colors.white),
                calcButton('5', Colors.grey.shade800, Colors.white),
                calcButton('6', Colors.grey.shade800, Colors.white),
                calcButton('-', Colors.orange, Colors.white),
                calcButton('1', Colors.grey.shade800, Colors.white),
                calcButton('2', Colors.grey.shade800, Colors.white),
                calcButton('3', Colors.grey.shade800, Colors.white),
                calcButton('+', Colors.orange, Colors.white),
                SizedBox(
                  width: 160,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        displayText = (displayText == '0')
                            ? '0'
                            : displayText + '0';
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade800,
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      '0',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                calcButton('.', Colors.grey.shade800, Colors.white),
                calcButton('=', Colors.orange, Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }
}
