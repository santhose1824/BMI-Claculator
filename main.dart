import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primaryColor: Color(0xff12a1a6)),
      home: MyApp(), //home of the app
      debugShowCheckedModeBanner: false, //used to remove the tag
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 100.0;
  double _weight = 50.0;
  int bmi = 0;
  String condition = 'Select Data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //addapted for all size of devices
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.40,
              width: double.infinity,
              decoration: new BoxDecoration(color: Color(0xff12a1a6)),
              padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white, fontSize: 40.0),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "$bmi",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Condition:",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$condition",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  Text("Choose Data",
                      style: TextStyle(
                        color: Color(0xff12a1a6),
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                    text: TextSpan(
                        text: "Height:",
                        style: TextStyle(color: Colors.black, fontSize: 25.0),
                        children: <TextSpan>[
                          TextSpan(
                            text: "$_height cm",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250,
                    label: "$_height",
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  RichText(
                      text: TextSpan(
                    text: "Weight:",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                    children: <TextSpan>[
                      TextSpan(
                        text: "$_weight kg",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 250,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 250,
                    label: "$_weight",
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Container(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              bmi = (_weight /
                                      ((_height / 100) * (_height / 100)))
                                  .round()
                                  .toInt();
                              if (bmi >= 18.5 && bmi <= 25) {
                                condition = "Normal";
                              } else if (bmi > 25 && bmi <= 30) {
                                condition = "OverWeight";
                              } else if (bmi > 30) {
                                condition = "obesity";
                              } else {
                                condition = "Underweight";
                              }
                            });
                          },
                          child: Text(
                            "Calculate",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.0),
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
