import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import 'dart:math';

List<String> data;
String ldata;
List<String> Ldata = [];
List<Widget> result = [];

treedata() {
  for (int i = 0; i < ldata.length;) {
    int num;
    String str = "";
    while (i != ldata.length && ldata[i] != " ") {
      str = str + ldata[i++];
    }
    if (str != "") {
      Ldata.add(str);
    } else
      i++;
  }
}

void Tree(double size, fsize) {
  size = double.parse("${size ~/ 1}");
  result = [];
  int t = 0, ct = 0;
  int dl = Ldata.length, lvl_ct = (log(dl) ~/ log(2));
  double dis = double.parse("${pow(2, 6 + lvl_ct)}"), l, r;
  for (int i = 0; i <= lvl_ct; i++) {
    int ele_ct = pow(2, i);
    ct = 0;
    List<Widget> row = [];
    dis = double.parse("${dis ~/ 2}");
    double th = 10, bh = 10, cw = dis;
    CrossAxisAlignment cross = CrossAxisAlignment.center;
    String parent;
    //print("${Ldata[t]}" + parent);
    if (i == 0) {
      th = 0;
    } else if (i == lvl_ct) {
      bh = 0;
      cw = 0;
    }
    while (ct < ele_ct) {
      Color color = Colors.black;
      if (t > 0) {
        parent = Ldata[((t + 1) ~/ 2) - 1];
      }
      if (i == 0) {
        l = dis - (size ~/ 2);
        r = dis - (size ~/ 2);
      } else if (ct == 0) {
        l = double.parse("${dis ~/ 2}") - (size ~/ 2);
        r = dis - (size ~/ 2);
        cross = CrossAxisAlignment.start;
      } else if (ct == ele_ct - 1) {
        r = double.parse("${dis ~/ 2}") - (size ~/ 2);
        l = dis - (size ~/ 2);
        cross = CrossAxisAlignment.end;
      } else {
        r = dis - (size ~/ 2);
        l = dis - (size ~/ 2);
        cross = CrossAxisAlignment.center;
      }
      if (Ldata[t] == 'X') {
        color = Colors.white;
      }
      if (parent == 'X') {
        row.add(
          Column(
            crossAxisAlignment: cross,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(l, 0, r, 0),
                child: Column(
                  children: [
                    Container(height: th, width: 2, color: Colors.white),
                    Container(
                      height: size,
                      width: size,
                    ),
                    Container(
                      height: bh,
                      width: 2,
                      color: color,
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                width: cw,
                color: color,
              )
            ],
          ),
        );
      } else {
        row.add(
          Column(
            crossAxisAlignment: cross,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(l, 0, r, 0),
                child: Column(
                  children: [
                    Container(
                      height: th,
                      width: 2,
                      color: Colors.black,
                    ),
                    Container(
                      height: size,
                      width: size,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.black),
                      child: Center(
                        child: Text("${Ldata[t]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Montserrat-Light.ttf',
                                fontWeight: FontWeight.bold,
                                fontSize: fsize,
                                color: Colors.white)),
                      ),
                    ),
                    Container(
                      height: bh,
                      width: 2,
                      color: color,
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                width: cw,
                color: color,
              )
            ],
          ),
        );
      }
      ct++;
      t++;
    }
    result.add(Row(children: row.toList()));
  }
}

class OOPS_Display extends StatefulWidget {
  @override
  _OOPS_DisplayState createState() => _OOPS_DisplayState();
}

class _OOPS_DisplayState extends State<OOPS_Display> {
  String preOrder;
  String inOrder;
  String postOrder;
  int ct = 0;
  List<String> names = ['PreOrder', 'PostOrder', 'InOrder', 'LevelOrder'];
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    double paddingWidth = MediaQuery.of(context).size.width / 50;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 12;
    double inpWidth = MediaQuery.of(context).size.width / 1.7;
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    ldata = data[data.length - 1];
    result = [];
    Ldata = [];
    treedata();
    Tree(paddingHeight * 1.5, font_Size / 1.5);
    return Scaffold(
      appBar: PreferredSize(
        child: TitleBar(
          title: "${data[0]}",
        ),
        preferredSize: Size.fromHeight(appbar_height / 1.2),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: paddingHeight / 1.2),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(paddingHeight / 2),
              margin: EdgeInsets.all(paddingHeight / 2),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 2, color: Colors.black)),
              child: Scrollbar(
                thickness: paddingHeight / 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: result,
                  ),
                ),
              ),
            ),
            Expanded(
                child: Scrollbar(
              isAlwaysShown: false,
              thickness: paddingHeight / 2,
              child: ListView.builder(
                  itemCount: data.length - 1,
                  itemBuilder: (context, index) {
                    if (index == 0 || index == data.length - 1) {
                      return Container(height: 0);
                    } else {
                      String name = names[index - 1];
                      return Card(
                        elevation: 2.0,
                        color: Colors.white70,
                        margin: EdgeInsets.all(paddingHeight),
                        child: Container(
                          padding: EdgeInsets.all(paddingHeight),
                          child: Column(
                            children: [
                              FittedBox(
                                child: Text(
                                  "$name",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat-Light.ttf',
                                      fontWeight: FontWeight.bold,
                                      fontSize: font_Size),
                                ),
                              ),
                              SizedBox(height: paddingHeight),
                              FittedBox(
                                child: Text(
                                  "${data[index]}",
                                  style: TextStyle(
                                      fontFamily: 'Cinzel',
                                      fontWeight: FontWeight.bold,
                                      fontSize: font_Size),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  }),
            )),
          ],
        ),
      ),
    );
  }
}
