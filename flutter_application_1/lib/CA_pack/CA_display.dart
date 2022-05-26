import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

class CA_Display extends StatefulWidget {
  @override
  _CA_DisplayState createState() => _CA_DisplayState();
}

class _CA_DisplayState extends State<CA_Display> {
  Widget data;
  Object arg;
  @override
  Widget build(BuildContext context) {
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    arg = ModalRoute.of(context).settings.arguments;
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
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
        margin: EdgeInsets.symmetric(horizontal: paddingHeight / 1.2),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: paddingHeight / 2),
        child: SingleChildScrollView(child: data),
      ),
    );
  }
}
