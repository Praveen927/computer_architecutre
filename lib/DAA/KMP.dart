import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/Input.dart';
import 'package:flutter_application_1/res/TitleBar.dart';

Widget data;
List<TableRow> tr = [];
String snackStr = "";
Widget snackbarIcon;
String S1, S2;

void computeLPSArray(String pat, int M, List<int> lps) {
  // length of the previous longest prefix suffix
  int len = 0;

  lps[0] = 0; // lps[0] is always 0

  // the loop calculates lps[i] for i = 1 to M-1
  int i = 1;
  while (i < M) {
    if (pat[i] == pat[len]) {
      len++;
      lps[i] = len;
      i++;
    } else // (pat[i] != pat[len])
    {
      if (len != 0) {
        len = lps[len - 1];

        // Also, note that we do not increment
        // i here
      } else // if (len == 0)
      {
        lps[i] = 0;
        i++;
      }
    }
  }
}

// Prints occurrences of txt[] in pat[]
void KMPSearch(String pat, String txt, fsize, heigh) {
  int M = pat.length;
  int N = txt.length;

  // create lps[] that will hold the longest prefix suffix
  // values for pattern
  //int lps[M];
  var lps = List.generate(M, (index) => 0);
  // Preprocess the pattern (calculate lps[] array)
  computeLPSArray(pat, M, lps);

  int i = 0; // index for txt[]
  int j = 0; // index for pat[]
  while (i < N) {
    if (pat[j] == txt[i]) {
      j++;
      i++;
    }

    if (j == M) {
      tr.add(TableRow(children: [
        Container(
          color: Colors.grey[350],
          height: heigh * 2,
          child: Center(
              child: Text("Match Index",
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
              child: Text(((i - j) + 1).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fsize / 1.2,
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold))),
        ),
      ]));
      j = lps[j - 1];
    }
    // mismatch after j matches
    else if (i < N && pat[j] != txt[i]) {
      // Do not match lps[0..lps[j-1]] characters,
      // they will match anyway
      if (j != 0)
        j = lps[j - 1];
      else
        i = i + 1;
    } else {
      tr.add(TableRow(children: [
        Container(
          color: Colors.grey[350],
          height: heigh * 2,
          child: Center(
              child: Text("Match",
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
              child: Text("Not Found",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fsize / 1.2,
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold))),
        ),
      ]));
    }
  }
}

// Driver program to test above function
int resMain(fsize, heigh) {
  tr.add(TableRow(children: [
    Container(
      color: Colors.grey[350],
      height: heigh * 2,
      child: Center(
          child: Text("Main Sequence",
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
              S1
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
          child: Text("Search Sequence",
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
              S2
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
  KMPSearch(S2, S1, fsize, heigh);
  data = Container(
      margin: EdgeInsets.all(heigh * 2),
      child: Table(
          border: TableBorder.all(width: 1, color: Colors.black),
          children: tr));
  tr = [];
  return 0;
}

class KMP extends StatefulWidget {
  @override
  _KMPState createState() => _KMPState();
}

class _KMPState extends State<KMP> {
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
                      child: Text("Main Sequence",
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
                      child: Text("Search Sequence",
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
                      child: Text("KMP",
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
            title: "KMP ALGORITHM",
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
                            ltxt: "  MAIN SEQUENCE",
                            onInput: (val) => Seq1 = val,
                          )),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "  SEARCH SEQUENCE",
                            onInput: (val) => Seq2 = val,
                          )),
                      SizedBox(
                        height: paddingHeight,
                      ),
                      RaisedButton(
                          onPressed: () {
                            if (Seq1.length < 1 || Seq2.length < 1) {
                              if (Seq2.length < 1) {
                                snackStr = "Enter Search Sequence";
                                snackbarIcon =
                                    Icon(Icons.warning, color: Colors.white);
                              }
                              if (Seq1.length < 1) {
                                snackStr = "Enter Main Sequence";
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
