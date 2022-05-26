import 'package:flutter/material.dart';
import 'package:flutter_application_1/OS_pack/Legend.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';

List<int> Adata = [];
List<int> Bdata = [];
String snackStr = "";
Widget snackbarIcon;
List<Widget> data = [];
Widget data1;

void resMain(fsize, heigh) {
  int n = Adata.length;
  var pid = List<int>.filled(n, 0);
  var at = List<int>.filled(n, 0);
  var bt = List<int>.filled(n, 0);
  var ct = List<int>.filled(n, 0);
  var ta = List<int>.filled(n, 0);
  var wt = List<int>.filled(n, 0);
  var f = List<int>.filled(n, 0);
  var k = List<int>.filled(n, 0);
  int i, st = 0, tot = 0;
  double avgwt = 0, avgta = 0;

  for (i = 0; i < n; i++) {
    pid[i] = i + 1;
    at[i] = Adata[i];
    bt[i] = Bdata[i];
    k[i] = bt[i];
    f[i] = 0;
  }
  while (true) {
    int min = 0099, c = n;
    if (tot == n) break;

    for (i = 0; i < n; i++) {
      if ((at[i] <= st) && (f[i] == 0) && (bt[i] < min)) {
        min = bt[i];
        c = i;
      }
    }

    if (c == n)
      st++;
    else {
      bt[c]--;
      st++;
      if (bt[c] == 0) {
        ct[c] = st;
        f[c] = 1;
        tot++;
      }
    }
  }

  for (i = 0; i < n; i++) {
    ta[i] = ct[i] - at[i];
    wt[i] = ta[i] - k[i];
    avgwt += wt[i];
    avgta += ta[i];
  }

  data.add(Container(
    margin: EdgeInsets.symmetric(horizontal: heigh),
    child: Table(
      border: TableBorder(
          left: BorderSide(width: 2),
          right: BorderSide(width: 2),
          top: BorderSide(width: 2),
          verticalInside: BorderSide(width: 2),
          horizontalInside: BorderSide(width: 2)),
      children: [
        TableRow(children: [
          Container(
            color: Colors.grey[350],
            height: heigh * 2,
            child: Center(
                child: Text("PID",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fsize / 1.2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            color: Colors.grey[350],
            height: heigh * 2,
            child: Center(
                child: Text("AT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fsize / 1.2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            color: Colors.grey[350],
            height: heigh * 2,
            child: Center(
                child: Text("BT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fsize / 1.2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            color: Colors.grey[350],
            height: heigh * 2,
            child: Center(
                child: Text("WT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fsize / 1.2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            color: Colors.grey[350],
            height: heigh * 2,
            child: Center(
                child: Text("TAT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fsize / 1.2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold))),
          ),
          Container(
            color: Colors.grey[350],
            height: heigh * 2,
            child: Center(
                child: Text("CT",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fsize / 1.2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold))),
          ),
        ])
      ],
    ),
  ));
  for (i = 0; i < n; i++) {
    double wid = 0;
    if (i == n - 1) {
      wid = 2;
    }
    data.add(Container(
      margin: EdgeInsets.symmetric(horizontal: heigh),
      child: Table(
          border: TableBorder(
              bottom: BorderSide(width: wid),
              left: BorderSide(width: 2),
              right: BorderSide(width: 2),
              top: BorderSide(width: 2),
              verticalInside: BorderSide(width: 2),
              horizontalInside: BorderSide(width: 2)),
          children: [
            TableRow(
              children: [
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${i + 1}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                    child: Text("${at[i]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: fsize / 1.2,
                          fontFamily: 'Montserrat-Light.ttf',
                        )),
                  ),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text(
                    "${k[i]}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fsize / 1.2,
                      fontFamily: 'Montserrat-Light.ttf',
                    ),
                  )),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${wt[i]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${ta[i]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${ct[i]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
              ],
            ),
          ]),
    ));
  }
  data.add(Legend());
  data.add(Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(height: heigh * 2),
      Container(
          child: Center(
              child: Text(
                  "AVERAGE WAITING TIME : ${double.parse((double.parse("$avgwt") / double.parse("$n")).toStringAsFixed(2))}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.4)))),
      SizedBox(
        height: fsize / 1.2,
      ),
      Container(
          child: Center(
              child: Text(
                  "AVERAGE TURN AROUND TIME :  ${double.parse((double.parse("$avgta") / double.parse("$n")).toStringAsFixed(2))}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.4)))),
    ],
  ));

  data1 = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data,
  );
}

class SJFP extends StatefulWidget {
  @override
  _SJFPState createState() => _SJFPState();
}

class _SJFPState extends State<SJFP> {
  double inpWidth;
  String ArrivalInp = "";
  String BurstInp = "";

  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 10;
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
              title: "SJF SCHEDULING\n(PREEMPTIVE)",
            ),
            preferredSize: Size.fromHeight(appbar_height),
          ),
          body: Builder(
              builder: (contextSnack) => Container(
                  constraints: BoxConstraints.expand(),
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: inpHeight * 1.5,
                      ),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "   ENTER ARRIVAL TIMES",
                            onInput: (val) => ArrivalInp = val,
                          )),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "   ENTER BURST TIMES",
                            onInput: (val) => BurstInp = val,
                          )),
                      SizedBox(
                        height: paddingHeight,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(paddingHeight / 1.5),
                        onPressed: () {
                          if (ArrivalInp.length < 1 || BurstInp.length < 1) {
                            if (BurstInp.length < 1) {
                              snackStr = "Enter Burst Times";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            }
                            if (ArrivalInp.length < 1) {
                              snackStr = "Enter Arrival Times";
                              snackbarIcon =
                                  Icon(Icons.warning, color: Colors.white);
                            }
                          } else if (RegExp(
                                  r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                              .hasMatch(ArrivalInp)) {
                            snackStr = "Invalid Element";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
                          } else if (RegExp(
                                  r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                              .hasMatch(BurstInp)) {
                            snackStr = "Invalid Element";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
                          } else {
                            Adata = [];
                            Bdata = [];
                            data = [];
                            for (int i = 0; i < ArrivalInp.length;) {
                              int num;
                              String str = "";
                              while (i != ArrivalInp.length &&
                                  ArrivalInp[i] != " ") {
                                str = str + ArrivalInp[i++];
                              }
                              if (str != "") {
                                num = int.parse(str);
                                Adata.add(num);
                              } else
                                i++;
                            }

                            for (int i = 0; i < BurstInp.length;) {
                              int num;
                              String str = "";
                              while (
                                  i != BurstInp.length && BurstInp[i] != " ") {
                                str = str + BurstInp[i++];
                              }
                              if (str != "") {
                                num = int.parse(str);
                                Bdata.add(num);
                              } else
                                i++;
                            }

                            if (Adata.length != Bdata.length) {
                              snackStr = "UnEqual Length";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else {
                              resMain(font_Size, paddingHeight);
                              Navigator.pushNamed(context, '/OS_display',
                                  arguments: {
                                    "SJF SCHEDULING\n(PREEMPTIVE)",
                                    data1
                                  });
                              return;
                            }
                          }
                          Scaffold.of(contextSnack).showSnackBar(SnackBar(
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.black,
                              content: Row(
                                children: [
                                  snackbarIcon,
                                  Padding(
                                    padding: EdgeInsets.all(paddingHeight / 3),
                                    child: FittedBox(
                                      child: Text(
                                        "$snackStr",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat-Light.ttf'),
                                      ),
                                    ),
                                  )
                                ],
                              )));
                        },
                        color: Colors.black,
                        child: FittedBox(
                          child: Text("Schedule",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: font_Size / 1.2,
                                fontFamily: 'Montserrat-Light.ttf',
                              )),
                        ),
                      ),
                      SizedBox(
                        height: paddingHeight,
                      ),
                      FittedBox(
                        child: Text(
                          "Note : Elements Must Be Space Separated.",
                          style: TextStyle(
                              fontFamily: 'Montserrat-Light.ttf',
                              fontSize: font_Size / 1.4,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent),
                        ),
                      ),
                    ],
                  )))),
    );
  }
}
