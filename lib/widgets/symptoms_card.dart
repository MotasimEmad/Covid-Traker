import 'package:covid/const/colors.dart';
import 'package:flutter/material.dart';

class SymptomItem extends StatelessWidget {
  const SymptomItem({
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          child: Image.asset('$image'),
        ),
        SizedBox(height: 5),
        Text(
          "$title",
          style: TextStyle(color: kBlueColor, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
