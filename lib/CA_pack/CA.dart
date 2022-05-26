import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class CA extends StatefulWidget {
  @override
  _CAState createState() => _CAState();
}

class _CAState extends State<CA> {
  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    return Scaffold(
      appBar: PreferredSize(
        child: TitleBar(
          title: "COMPUTER ARCHITECTURE",
        ),
        preferredSize: Size.fromHeight(appbar_height),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(paddingHeight / 2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 4,
              image: AssetImage('src/CA.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/Restoring");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  Restoring Division   ",
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
                  Navigator.pushNamed(context, "/NonRestoring");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  Non-Restoring Division   ",
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
                  Navigator.pushNamed(context, "/Booth");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  Booth Multiplication   ",
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
    );
  }
}
