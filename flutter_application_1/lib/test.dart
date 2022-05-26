import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import 'dart:math';

List<Widget> result = [];

List<int> data = [];

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<dynamic> showDialogBox(context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          String ret;
          return AlertDialog(
            content: Container(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(onFieldSubmitted: (val) {
                  ret = val;
                }),
                RaisedButton.icon(
                    disabledColor: Colors.black,
                    color: Colors.black,
                    disabledElevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    onPressed: () {
                      Navigator.of(context).pop(context);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: Text(
                      "PROCESS",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold),
                    )),
              ],
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        11;
    return Scaffold(
      appBar: PreferredSize(
        child: TitleBar(
          title: "TEST",
        ),
        preferredSize: Size.fromHeight(appbar_height / 1.2),
      ),
      body: RaisedButton.icon(
          disabledColor: Colors.black,
          color: Colors.black,
          disabledElevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(font_Size))),
          onPressed: () async {
            dynamic s = await showDialogBox(context);
            print(s);
          },
          icon: Icon(
            Icons.add_circle,
            color: Colors.white,
            size: font_Size,
          ),
          label: Text(
            "PROCESS",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Sans',
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
