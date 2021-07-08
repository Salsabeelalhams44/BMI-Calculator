import 'package:bmi_calculator/widget/gender_widget.dart';
import 'package:bmi_calculator/widget/reusable_widget.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  static const routeName = '/result';
  ResultPage({this.bmiResult, this.resultText, this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    final ResultPage resultPage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableWidget(
              colour: Color(0xFF111328),
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        resultPage.resultText,
                        style:TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ) ,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      resultPage.bmiResult,
                      style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      resultPage.interpretation,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                  fontSize:20, 
                  color: Colors.white,
                ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
            child: Container(
              child: Text(
                'RE - CALCULATE',
                textAlign: TextAlign.center,
                style:TextStyle(
                  fontSize:25, 
                  color: Colors.white,
                  fontWeight:FontWeight.bold,
                ) ,
              ),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Color(0xFFEB1555),
              
              
            ),
          ),
        ],
      ),
    );
  }
}