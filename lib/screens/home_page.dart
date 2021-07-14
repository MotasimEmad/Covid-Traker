import 'dart:convert';

import 'package:covid/const/colors.dart';
import 'package:covid/screens/all_countries.dart';
import 'package:covid/screens/contact.dart';
import 'package:covid/widgets/globalContainer.dart';
import 'package:covid/widgets/mostEffect.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _loading;
  int selectedIndex = 0;
  final tabs = [
    HomePage(),
    Contact(),
  ];

  late Map globalMap;
  var url = Uri.parse("https://corona.lmao.ninja/v2/all");
  getGlobalSituation() async {
    http.Response response = await http.get(url);
    globalMap = jsonDecode(response.body);
    setState(() {
      _loading = false;
    });
  }

  late List globalMapCountries;
  var urlCountries =
      Uri.parse("https://corona.lmao.ninja/v2/countries?sort=cases");
  getCountriesSituation() async {
    http.Response response = await http.get(urlCountries);
    setState(() {
      globalMapCountries = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    super.initState();
    
    getGlobalSituation();
    getCountriesSituation();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        width: double.infinity,
                        height: 350.0,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.indigo,
                              kBlueColor.withOpacity(.25),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Expanded(
                          child: Stack(
                            children: [
                              Image.asset(
                                "assets/images/clip-vaccine.png",
                                width: 300,
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topLeft,
                              ),
                              Positioned(
                                top: 210,
                                left: 150,
                                child: Text(
                                  "Hi there! \n How you feel today ?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Text(
                        "Covid-19 Latest Update",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.indigo[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.centerLeft,
                    ),

                    // ignore: unnecessary_null_comparison
                    globalMap == null
                        ? Center(child: CircularProgressIndicator())
                        : GloalSituationCard(map: globalMap),

                    SizedBox(height: 20),

                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Most Effect Countries",
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.indigo[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return All_Countries(
                                      allCountriesList: globalMapCountries,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "View all",
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      alignment: Alignment.centerLeft,
                    ),

                    // ignore: unnecessary_null_comparison
                    globalMapCountries == null
                        ? Center(child: CircularProgressIndicator())
                        : MostEffect(mostList: globalMapCountries),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: FlatButton.icon(
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Contact(),
            ),
          );
        },
        color: kBlueColor,
        icon: const Icon(
          Icons.medical_services,
          color: Colors.white,
        ),
        label: Text(
          'Services',
        ),
        textColor: Colors.white,
      ),
    );
  }
}
