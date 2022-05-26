import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class OS_Display extends StatefulWidget {
  @override
  _OS_DisplayState createState() => _OS_DisplayState();
}

class _OS_DisplayState extends State<OS_Display> {
  Widget data;
  Object arg;
  @override
  Widget build(BuildContext context) {
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 12;
    arg = ModalRoute.of(context).settings.arguments;
    double appbar_height = MediaQuery.of(context).size.height / 6;

    int ct = 0;
    String title;
    for (var process in arg) {
      if (ct == 0) {
        title = process;
      } else {
        data = process;
      }
      ct++;
    }
    return Scaffold(
      appBar: PreferredSize(
        child: TitleBar(
          title: "$title",
        ),
        preferredSize: Size.fromHeight(appbar_height),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: paddingHeight / 2),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: inpHeight / 2,
            ),
            data,
          ],
        )),
      ),
    );
  }
}
