import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  IconData icon;
  String label;
  static const styleText = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
  );
GenderWidget({@required this.icon, @required this.label});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children:[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height:15.0,
        ),
        Text(
          label,
          style:styleText ,
        ),
      ],
    );
  }
}