import 'package:covid/const/colors.dart';
import 'package:covid/widgets/symptoms_card.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        Colors.indigo.withOpacity(.25),
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'COVID-19',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Are you feeling sick?',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'If you feel sick with any COVID-19 symptoms, please call us immediately for help.',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 15.0,
                              ),
                            ),
                            SizedBox(height: 30),
                            FlatButton.icon(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 20.0,
                              ),
                              onPressed: () {},
                              color: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Call Now',
                              ),
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(
                        "Symptoms",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 120,
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SymptomItem(
                            title: "Headache",
                            image: "assets/images/headache.png",
                          ),
                          SymptomItem(
                            title: "Cough",
                            image: "assets/images/cough.png",
                          ),
                          SymptomItem(
                            title: "Fever",
                            image: "assets/images/fever.png",
                          ),
                          SymptomItem(
                            title: "Sore Throat",
                            image: "assets/images/sore_throat.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Column(
                children: [
                  cards(
                    size: size,
                    title: "Get test for the virus",
                    color1: kRecoveredColor,
                    color2: kRecoveredColor,
                  ),
                  cards(
                    size: size,
                    title: "Get vaccine for the virus",
                    color1: kBlueColor,
                    color2: kBlueColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FlatButton(
        child: Text("Back"),
        padding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        color: kBlueColor,
        textColor: Colors.white,
      ),
    );
  }
}

class cards extends StatelessWidget {
  final String title;
  final Color color1, color2;
  final Size size;

  const cards(
      {required this.title,
      required this.color1,
      required this.color2,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 5.0),
      margin: EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: size.width,
        height: 100.0,
        child: Card(
          color: Colors.blue[100],
          elevation: 2,
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
            ),
            child: Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(6.0),
                    margin: EdgeInsets.only(top: 20.0, bottom: 5),
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: color1.withOpacity(.25),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: color2, width: 2),
                      ),
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                      color: kBlueColor,
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
