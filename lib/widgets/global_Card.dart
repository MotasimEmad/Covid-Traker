import 'package:flutter/material.dart';

class GlobalCard extends StatelessWidget {
  final String title, number;
  final Color color1, color2, numberColor;
  GlobalCard({
    required this.title,
    required this.number,
    required this.color1,
    required this.color2,
    required this.numberColor,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6.0),
          margin: EdgeInsets.only(top: 20.0, bottom: 5),
          width: 25.0,
          height: 25.0,
          decoration: BoxDecoration(
            color: color1,
            shape: BoxShape.circle,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: color2,
                width: 2
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                number,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: numberColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(letterSpacing: 2, fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
