import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class OS extends StatefulWidget {
  @override
  _OSState createState() => _OSState();
}

class _OSState extends State<OS> {
  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    double paddingWidth = MediaQuery.of(context).size.width / 10;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 12;
    double inpWidth = MediaQuery.of(context).size.width / 1.7;
    return Scaffold(
      appBar: PreferredSize(
        child: TitleBar(
          title: "PROCESS SCHEDULER",
        ),
        preferredSize: Size.fromHeight(appbar_height),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.all(paddingHeight / 2),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width / 4,
                image: AssetImage('src/OS.png'),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, "/FCFS");
                  });
                },
                child: Card(
                  margin: EdgeInsets.all(paddingHeight / 2),
                  elevation: 5,
                  child: Container(
                      padding: EdgeInsets.all(paddingHeight),
                      child: FittedBox(
                        child: Text(" FCFS Scheduling  ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: font_Size,
                                fontFamily: 'Montserrat-Light.ttf',
                                color: Colors.black)),
                      )),
                ),
              ),
              FlatButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: inpHeight / 1.8,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: paddingWidth / 15)),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/SJFNP');
                                  },
                                  child: FittedBox(
                                    child: Text("  Non-Preemptive  ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: font_Size,
                                            fontFamily: 'Montserrat-Light.ttf',
                                            color: Colors.black)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: paddingHeight,
                              ),
                              Container(
                                height: inpHeight / 1.8,
                                child: FlatButton(
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/SJFP');
                                  },
                                  child: FittedBox(
                                    child: Text("  Preemptive   ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: font_Size,
                                            fontFamily: 'Montserrat-Light.ttf',
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Card(
                  margin: EdgeInsets.all(paddingHeight / 2),
                  elevation: 5,
                  child: Container(
                      padding: EdgeInsets.all(paddingHeight),
                      child: FittedBox(
                        child: Text("  SJF Scheduling   ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: font_Size,
                                fontFamily: 'Montserrat-Light.ttf',
                                color: Colors.black)),
                      )),
                ),
              ),
              FlatButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: inpHeight / 1.8,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black,
                                        width: paddingWidth / 15)),
                                child: FlatButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/PRIORITYNP');
                                  },
                                  child: FittedBox(
                                    child: Text("  Non-Preemptive  ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: font_Size,
                                            fontFamily: 'Montserrat-Light.ttf',
                                            color: Colors.black)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: paddingHeight,
                              ),
                              Container(
                                height: inpHeight / 1.8,
                                child: FlatButton(
                                  color: Colors.black,
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/PRIORITYP');
                                  },
                                  child: FittedBox(
                                    child: Text("  Preemptive   ",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: font_Size,
                                            fontFamily: 'Montserrat-Light.ttf',
                                            color: Colors.white)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                },
                child: Card(
                  margin: EdgeInsets.all(paddingHeight / 2),
                  elevation: 5,
                  child: Container(
                      padding: EdgeInsets.all(paddingHeight),
                      child: FittedBox(
                        child: Text(" Priority Scheduling   ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: font_Size,
                                fontFamily: 'Montserrat-Light.ttf',
                                color: Colors.black)),
                      )),
                ),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, "/RR");
                  });
                },
                child: Card(
                  margin: EdgeInsets.all(paddingHeight / 2),
                  elevation: 5,
                  child: Container(
                      padding: EdgeInsets.all(paddingHeight),
                      child: FittedBox(
                        child: Text("  Round Robin Scheduling   ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: font_Size,
                                fontFamily: 'Montserrat-Light.ttf',
                                color: Colors.black)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
