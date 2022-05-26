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
  int st = 0, tot = 0;
  double avgwt = 0, avgta = 0;
  int i;
  for (i = 0; i < n; i++) {
    at[i] = Adata[i];
    bt[i] = Bdata[i];
    pid[i] = i + 1;
    f[i] = 0;
  }

  bool a = true;
  while (true) {
    int c = n, min = 999;
    if (tot ==
        n) // total no of process = completed process loop will be terminated
      break;

    for (int i = 0; i < n; i++) {
      /*
				 * If i'th process arrival time <= system time and its flag=0 and burst<min 
				 * That process will be executed first 
				 */
      if ((at[i] <= st) && (f[i] == 0) && (bt[i] < min)) {
        min = bt[i];
        c = i;
      }
    }

    /* If c==n means c value can not updated because no process arrival time< system time so we increase the system time */
    if (c == n)
      st++;
    else {
      ct[c] = st + bt[c];
      st += bt[c];
      ta[c] = ct[c] - at[c];
      wt[c] = ta[c] - bt[c];
      f[c] = 1;
      tot++;
    }
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
    avgwt += wt[i];
    avgta += ta[i];
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
                    "${bt[i]}",
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

class SJFNP extends StatefulWidget {
  @override
  _SJFNPState createState() => _SJFNPState();
}

class _SJFNPState extends State<SJFNP> {
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
              title: "SJF SCHEDULING\n(NON-PREEMPTIVE)",
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
                                    "SJF SCHEDULING\n(NON-PREEMPTIVE)",
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
