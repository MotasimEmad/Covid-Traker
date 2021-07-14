import 'package:covid/covert.dart';
import 'package:flutter/material.dart';

class MostEffect extends StatelessWidget {
  final List mostList;
  MostEffect({
    required this.mostList,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(bottom: 5.0),
            margin: EdgeInsets.only(top: 10.0),
            child: SizedBox(
              width: size.width,
              height: 100.0,
              child: Card(
                elevation: 2,
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          mostList[index]['countryInfo']['flag'],
                          height: 50.0,
                          width: 50.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Column(
                            children: [
                              Text(
                                convertType(mostList[index]['cases']).toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              Text(
                                mostList[index]['country'],
                                style: TextStyle(letterSpacing: 2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      // child: ListView.builder(
      //   itemCount: 5,
      //   shrinkWrap: true,
      //   // physics: NeverScrollableScrollPhysics(),
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //     return ;
      //   },
      // ),
    );
  }
}
