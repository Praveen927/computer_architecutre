import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  String title;
  TitleBar({this.title = ""});
  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        9;
    return SafeArea(
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: font_Size * 1.2,
          ),
        ),
        toolbarHeight: appbar_height,
        title: FittedBox(
          child: Text("$title",
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 2,
                  fontSize: font_Size * 1.1,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Cinzel',
                  color: Colors.black)),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              padding: EdgeInsets.only(
                  right: MediaQuery.of(context).size.width / 35),
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: font_Size * 1.2,
              ),
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              })
        ],
      ),
    );
  }
}
