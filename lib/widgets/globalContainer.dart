import 'package:covid/const/colors.dart';
import 'package:covid/covert.dart';
import 'package:covid/widgets/global_Card.dart';
import 'package:flutter/material.dart';

class GloalSituationCard extends StatelessWidget {
  final Map map;
  GloalSituationCard({required this.map});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        width: double.infinity,
        height: 220,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              color: kBlueColor.withOpacity(0.5),
              blurRadius: 10,
              spreadRadius: 4,
            )
          ],
        ),
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
          ),
          children: [
            GlobalCard(
              title: 'Confirmed',
              number: convertType(map['cases']).toString(),
              color1: kConfirmedColor.withOpacity(.26),
              color2: kConfirmedColor,
              numberColor: kConfirmedColor,
            ),
            GlobalCard(
              title: 'Active',
              number: convertType(map['active']).toString(),
              color1: kActiveColor.withOpacity(.26),
              color2: kActiveColor,
              numberColor: kActiveColor,
            ),
            GlobalCard(
              title: 'Recovered',
              number: convertType(map['recovered']).toString(),
              color1: kRecoveredColor.withOpacity(.26),
              color2: kRecoveredColor,
              numberColor: kRecoveredColor,
            ),
            GlobalCard(
              title: 'Deaths',
              number: convertType(map['deaths']).toString(),
              color1: kDeathColor.withOpacity(.26),
              color2: kDeathColor,
              numberColor: kDeathColor,
            ),
          ],
        ),
      ),
    );
  }
}
