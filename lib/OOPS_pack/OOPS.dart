import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class Oops extends StatefulWidget {
  @override
  _OopsState createState() => _OopsState();
}

class _OopsState extends State<Oops> {
  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    double paddingWidth = MediaQuery.of(context).size.width / 50;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 12;
    double inpWidth = MediaQuery.of(context).size.width / 1.7;
    return Scaffold(
      appBar: PreferredSize(
        child: TitleBar(
          title: "DATA STRUCTURES",
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
              image: AssetImage('src/OOPS.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/AVL");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  AVL Tree   ",
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
                  Navigator.pushNamed(context, "/Splay");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  Splay Tree   ",
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
