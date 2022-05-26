import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/Input.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

Widget data;
List<TableRow> tr = [];
String snackStr = "";
Widget snackbarIcon;
String S1, S2;

int max(int a, int b) {
  if (a > b)
    return a;
  else
    return b;
}

void lcs_algo(String S1, String S2, int m, int n, fsize, heigh) {
  var L = List.generate(m + 1, (i) => List.generate(n + 1, (j) => 0));
  int i = 0, j = 0;
  for (i = 0; i < m + 1; i++) {
    for (j = 0; j < n + 1; j++) {
      if (i == 0 || j == 0) {
        L[i][j] = 0;
      } else if (S1[i - 1] == S2[j - 1]) {
        L[i][j] = L[i - 1][j - 1] + 1;
      } else {
        L[i][j] = max(L[i - 1][j], L[i][j - 1]);
      }
    }
  }
  int index = L[m][n];
  var lcs_algo = List<String>.filled(index + 1, "");
  lcs_algo[index] = "";

  i = m;
  j = n;
  while (i > 0 && j > 0) {
    if (S1[i - 1] == S2[j - 1]) {
      lcs_algo[index - 1] = S1[i - 1];
      i -= 1;
      j -= 1;
      index -= 1;
    } else if (L[i - 1][j] > L[i][j - 1])
      i -= 1;
    else
      j -= 1;
  }

  tr.add(TableRow(children: [
    Container(
      color: Colors.grey[350],
      height: heigh * 2,
      child: Center(
          child: Text("Sequence 1",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fsize / 1.2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold))),
    ),
    Container(
      color: Colors.white,
      height: heigh * 2,
      child: Center(
          child: FittedBox(
        child: Text(S1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fsize / 1.2,
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold)),
      )),
    ),
  ]));
  tr.add(TableRow(children: [
    Container(
      color: Colors.grey[350],
      height: heigh * 2,
      child: Center(
          child: Text("Sequence 2",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fsize / 1.2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold))),
    ),
    Container(
      color: Colors.white,
      height: heigh * 2,
      child: Center(
          child: FittedBox(
        child: Text(S2,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: fsize / 1.2,
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold)),
      )),
    ),
  ]));
  tr.add(TableRow(children: [
    Container(
      color: Colors.grey[350],
      height: heigh * 2,
      child: Center(
          child: Text("LCS",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fsize / 1.2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold))),
    ),
    Container(
      color: Colors.white,
      height: heigh * 2,
      child: Center(
          child: Text(
              lcs_algo
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll(",", ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fsize / 1.2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold))),
    ),
  ]));
  tr.add(TableRow(children: [
    Container(
      color: Colors.grey[350],
      height: heigh * 2,
      child: Center(
          child: Text("Length",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fsize / 1.2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold))),
    ),
    Container(
      color: Colors.white,
      height: heigh * 2,
      child: Center(
          child: Text((lcs_algo.length - 1).toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: fsize / 1.2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold))),
    ),
  ]));
}

void resMain(fsize, heigh) {
  int m, n;
  m = S1.length;
  n = S2.length;
  lcs_algo(S1, S2, m, n, fsize, heigh);
  data = Container(
      margin: EdgeInsets.all(heigh * 2),
      child: Table(
          border: TableBorder.all(width: 1, color: Colors.black),
          children: tr));
  tr = [];
}

class LCS extends StatefulWidget {
  @override
  _LCSState createState() => _LCSState();
}

class _LCSState extends State<LCS> {
  double inpWidth;
  String Seq1 = "";
  String Seq2 = "";
  int flag = 1;
  Widget res = Container();

  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 10;
    if (flag == 1) {
      flag = 0;
      res = Container(
          margin: EdgeInsets.all(paddingHeight * 2),
          child: Table(
            border: TableBorder.all(width: 1, color: Colors.black),
            children: [
              TableRow(children: [
                Container(
                  color: Colors.grey[350],
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("Sequence 1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  color: Colors.white,
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
              ]),
              TableRow(children: [
                Container(
                  color: Colors.grey[350],
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("Sequence 2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  color: Colors.white,
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
              ]),
              TableRow(children: [
                Container(
                  color: Colors.grey[350],
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("LCS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  color: Colors.white,
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
              ]),
              TableRow(children: [
                Container(
                  color: Colors.grey[350],
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("Length",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
                Container(
                  color: Colors.white,
                  height: paddingHeight * 2,
                  child: Center(
                      child: Text("-",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: font_Size / 1.2,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold))),
                ),
              ])
            ],
          ));
    }
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: PreferredSize(
          child: TitleBar(
            title: "LONGEST COMMON\nSUBSEQUENCE",
          ),
          preferredSize: Size.fromHeight(appbar_height),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Builder(
            builder: (contextSnack) => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: inpHeight,
                      ),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "  SEQUENCE 1",
                            onInput: (val) => Seq1 = val,
                          )),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "  SEQUENCE 2",
                            onInput: (val) => Seq2 = val,
                          )),
                      SizedBox(
                        height: paddingHeight,
                      ),
                      RaisedButton(
                          onPressed: () {
                            if (Seq1.length < 1 || Seq2.length < 1) {
                              if (Seq2.length < 1) {
                                snackStr = "Enter Sequence 2";
                                snackbarIcon =
                                    Icon(Icons.warning, color: Colors.white);
                              }
                              if (Seq1.length < 1) {
                                snackStr = "Enter Sequence 1";
                                snackbarIcon = Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                );
                              }
                              Scaffold.of(contextSnack).showSnackBar(SnackBar(
                                  duration: Duration(seconds: 1),
                                  backgroundColor: Colors.black,
                                  content: Row(
                                    children: [
                                      snackbarIcon,
                                      Padding(
                                        padding:
                                            EdgeInsets.all(paddingHeight / 3),
                                        child: FittedBox(
                                          child: Text(
                                            "$snackStr",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  )));
                            } else {
                              S1 = Seq1;
                              S2 = Seq2;
                              resMain(font_Size, paddingHeight);
                              setState(() {
                                res = data;
                              });
                            }
                          },
                          color: Colors.black,
                          child: FittedBox(
                            child: Text(
                              "FIND",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat-Light.ttf',
                                  fontSize: font_Size / 1.2),
                            ),
                          )),
                    ],
                  ),
                  res
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
