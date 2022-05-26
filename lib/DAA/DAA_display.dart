import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class DAA_Display extends StatefulWidget {
  @override
  _DAA_DisplayState createState() => _DAA_DisplayState();
}

class _DAA_DisplayState extends State<DAA_Display> {
  List<String> data;
  @override
  Widget build(BuildContext context) {
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    data = ModalRoute.of(context).settings.arguments;
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        10;
    String title;

    title = data[0];

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.map((e) {
            if (data[0] == e) {
              return Container(
                height: 0,
              );
            } else {
              return Container(
                  child: Text("$e",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Light.ttf',
                          fontSize: font_Size / 1.2)));
            }
          }).toList(),
        )),
      ),
    );
  }
}
