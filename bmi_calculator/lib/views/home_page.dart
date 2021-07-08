import 'dart:math';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/gender_widget.dart';
import 'package:bmi_calculator/components/reusable_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_page.dart';
import 'package:bmi_calculator/module/brain_widget.dart';

enum Gender {Male, Female}
class HomePage extends StatefulWidget {
  Gender genderCheck ;
  Color activeCardColor = Color(0xFF1D1E33);
  Color inActiveCardColor = Color(0xFF111328);
  double height= 120;
  double  weight=60;
  double resul;
  var  age=20;
  TextStyle styleNumber = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w900,
);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableWidget(
                    onPressed: (){
                      setState(() {
                        widget.genderCheck= Gender.Male;
                      });
                    },
                    colour: widget.genderCheck == Gender.Male ?
                       widget.activeCardColor: widget.inActiveCardColor ,
                    childWidget: GenderWidget(
                      icon: FontAwesomeIcons.mars ,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    onPressed: (){
                      setState(() {
                        widget.genderCheck= Gender.Female;
                      });
                    },
                    colour: widget.genderCheck == Gender.Female ?
                        widget.activeCardColor: widget.inActiveCardColor ,
                    childWidget: GenderWidget(
                      icon:FontAwesomeIcons.venus ,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            
            child: ReusableWidget(
              colour:  widget.inActiveCardColor,
              childWidget: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style:GenderWidget.styleText,
                      
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children:[
                        Text(
                          '${widget.height.round()}',
                           style:widget.styleNumber,
                        ),
                        Text(
                          'CM',
                           style:GenderWidget.styleText,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderThumbShape(enabledThumbRadius: 30.0),
                      ),
                      child: Slider(
                        value: widget.height ,
                        min: 30,
                        max: 250, 
                        onChanged: (val){
                          widget.height= val;
                          setState(() {
                            
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableWidget(
                    colour: widget.activeCardColor,
                    childWidget: Column(
                      mainAxisAlignment:MainAxisAlignment.center ,
                      children: [
                        Text(
                          'Weight',
                          style:GenderWidget.styleText,
                        ),
                        Text(
                          '${widget.weight.round()}',
                          style:widget.styleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'weight--',
                              onPressed: (){
                                widget.weight--;
                                setState(() {
                                  
                                });
                              },
                              backgroundColor: Colors.grey[600] ,
                               mini: true,
                                child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                              heroTag: 'weight++',
                              onPressed: (){
                                widget.weight++;
                                setState(() {
                                  
                                });
                              },
                              backgroundColor: Colors.grey[600] ,
                               mini: true,
                                child: Icon(
                                  Icons.add,
                                  color:Colors.white,
                                ),
                            ),
                          ],
                        ),
                  
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableWidget(
                    colour: widget.activeCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style:GenderWidget.styleText,
                        ),
                        Text(
                          '${widget.age}',
                          style:widget.styleNumber,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age--',
                              onPressed: (){
                                widget.age--;
                                setState(() {
                                  
                                });
                              },
                              backgroundColor: Colors.grey[600] ,
                              mini: true,
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                                ),
                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                              heroTag: 'age++',
                              onPressed: (){
                                widget.age++;
                                setState(() {
                                  
                                });
                              },
                              backgroundColor: Colors.grey[600] ,
                              mini: true,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,

                                ),
                            ),
                          ],
                        ),
                        
                        
                      ],
                    ),
                  ),
                ),
                
              ],
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(
                    height: widget.height.round(),
                     weight: widget.weight.round()
                     );
              Navigator.pushNamed(
                context,
                ResultPage.routeName,
                arguments: ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                ),
              );
            }
          ),
      
        ],
      ),
    );
  }
}