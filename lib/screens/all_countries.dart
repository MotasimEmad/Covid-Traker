import 'package:covid/const/colors.dart';
import 'package:covid/covert.dart';
import 'package:flutter/material.dart';

class All_Countries extends StatelessWidget {
  final List allCountriesList;
  const All_Countries({required this.allCountriesList});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Countries'),
        centerTitle: true,
        elevation: 1,
        backgroundColor: kBlueColor,
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
          itemCount: allCountriesList.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(bottom: 5.0),
              margin: EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: size.width,
                height: 150.0,
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
                            allCountriesList[index]['countryInfo']['flag'],
                            height: 50.0,
                            width: 50.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "Confirmed: " +
                                        convertType(
                                                allCountriesList[index]['cases'])
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: kConfirmedColor,
                                    ),
                                  ),
                                   Text(
                                    "Active: " +
                                        convertType(
                                                allCountriesList[index]['active'])
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: kActiveColor,
                                    ),
                                  ),
                                   Text(
                                    "Recovered: " +
                                        convertType(
                                                allCountriesList[index]['recovered'])
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: kRecoveredColor,
                                    ),
                                  ),
                                   Text(
                                    "Deaths: " +
                                        convertType(
                                                allCountriesList[index]['deaths'])
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: kDeathColor,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    allCountriesList[index]['country'],
                                    style: TextStyle(letterSpacing: 2),
                                  ),
                                ],
                              ),
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
      ),
    );
  }
}
