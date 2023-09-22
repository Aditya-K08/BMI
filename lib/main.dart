import 'package:flutter/material.dart';
import 'input_page.dart';


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColorDark: Color(0xFF0a0e21) ,
        scaffoldBackgroundColor: Color(0xFF0a0e21),

      ),
      home: InputPage(

      ),
    );
  }
}

