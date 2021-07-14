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
    return Container(
      width: 140.0,
      height: 180.0,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30.0, bottom: 20.0),
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: color1,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    color: color2,
                    shape: BoxShape.circle,
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
                        color: numberColor),
                  ),
                  Text(
                    title,
                    style: TextStyle(letterSpacing: 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
