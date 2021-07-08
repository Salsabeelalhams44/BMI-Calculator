import 'package:flutter/material.dart';

class ReusableWidget extends StatelessWidget {
  Color  colour;
  Widget childWidget;
  Function onPressed;
  ReusableWidget({@required this.colour, this.childWidget, this.onPressed});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPressed ,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child:childWidget ,
      ),
    );
  }
}