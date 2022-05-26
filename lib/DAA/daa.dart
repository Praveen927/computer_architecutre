import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class DAA extends StatefulWidget {
  @override
  _DAAState createState() => _DAAState();
}

class _DAAState extends State<DAA> {
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
          title: "ALGORITHMS",
        ),
        preferredSize: Size.fromHeight(appbar_height),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.all(paddingHeight / 2),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 4,
              image: AssetImage('src/DAA.png'),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 14,
            ),
            FlatButton(
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, "/Lcs");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  Longest Common \nSubsequence   ",
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
                  Navigator.pushNamed(context, "/Kmp");
                });
              },
              child: Card(
                margin: EdgeInsets.all(paddingHeight / 2),
                elevation: 5,
                child: Container(
                    padding: EdgeInsets.all(paddingHeight),
                    child: FittedBox(
                      child: Text("  KMP Algorithm   ",
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
