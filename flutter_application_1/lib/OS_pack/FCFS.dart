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

void findWaitingTime(List<int> processes, int n, List<int> bt, List<int> wt,
    List<int> at, double fsize, double heigh) {
  var service_time = List<int>.filled(n, 0);
  service_time[0] = at[0];
  wt[0] = 0;
  for (int i = 1; i < n; i++) {
    service_time[i] = service_time[i - 1] + bt[i - 1];
    wt[i] = service_time[i] - at[i];
    if (wt[i] < 0) wt[i] = 0;
  }
}

void findTurnAroundTime(List<int> processes, int n, List<int> bt, List<int> wt,
    List<int> tat, double fsize, double heigh) {
  for (int i = 0; i < n; i++) tat[i] = bt[i] + wt[i];
}

void findavgTime(List<int> processes, int n, List<int> bt, List<int> at,
    double fsize, double heigh) {
  var wt = List<int>.filled(n, 0);
  var tat = List<int>.filled(n, 0);
  findWaitingTime(processes, n, bt, wt, at, fsize, heigh);
  findTurnAroundTime(processes, n, bt, wt, tat, fsize, heigh);
  data.add(Container(
    margin: EdgeInsets.symmetric(horizontal: heigh),
    child: Table(
      border: TableBorder(
        right: BorderSide(width: 2),
        left: BorderSide(width: 2),
        top: BorderSide(width: 2),
        verticalInside: BorderSide(width: 2),
        horizontalInside: BorderSide(width: 2),
      ),
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

  int total_wt = 0, total_tat = 0;

  for (int i = 0; i < n; i++) {
    total_wt = total_wt + wt[i];
    total_tat = total_tat + tat[i];
    int compl_time = tat[i] + at[i];
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
                      child: Text("${tat[i]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("$compl_time",
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
                  "AVERAGE WAITING TIME : ${double.parse((double.parse("$total_wt") / double.parse("$n")).toStringAsFixed(2))}",
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
                  "AVERAGE TURN AROUND TIME :  ${double.parse((double.parse("$total_tat") / double.parse("$n")).toStringAsFixed(2))}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.4)))),
    ],
  ));
}

int resMain(double fsize, double heigh) {
  // Process id's
  var processes = List<int>.filled(Adata.length, 0);
  for (int i = 0; i < Adata.length; i++) {
    processes[i] = i + 1;
  }
  int n = processes.length;

  findavgTime(processes, n, Bdata, Adata, fsize, heigh);
  data1 = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data,
  );
  return 0;
}

class FCFS extends StatefulWidget {
  @override
  _FCFSState createState() => _FCFSState();
}

class _FCFSState extends State<FCFS> {
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
              title: "FCFS SCHEDULING",
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
                                  arguments: {"FCFS SCHEDULING", data1});
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
