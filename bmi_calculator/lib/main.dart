import 'package:bmi_calculator/views/home_page.dart';
import 'package:bmi_calculator/views/result_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
       theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomePage(),
      routes: {
        '/result': (context) => ResultPage(),
      },
    );
  }
}


