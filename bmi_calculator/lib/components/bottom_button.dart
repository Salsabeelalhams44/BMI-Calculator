
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({@required this.buttonText, @required this.onTap});

  final String buttonText;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            
            buttonText,
            style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        margin: EdgeInsets.only(top: 10.0),
        color: Color(0xFFEB1555),
        height: 50.0,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      ),
    );
  }
}




