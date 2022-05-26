import 'package:flutter/material.dart';
import 'package:flutter_application_1/OS_pack/Legend.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';

List<int> Adata = [];
List<int> Bdata = [];
List<int> Pdata = [];
String snackStr = "";
Widget snackbarIcon;
List<Widget> data = [];
Widget data1;

class process {
  int pid;
  int arrival_time;
  int burst_time;
  int priority;
  int start_time;
  int completion_time;
  int turnaround_time;
  int waiting_time;
}

int resMain(fsize, heigh) {
  int n;
  var p = List<process>.generate(100, (index) => process());
  double avg_turnaround_time;
  double avg_waiting_time;
  int total_turnaround_time = 0;
  int total_waiting_time = 0;
  var burst_remaining = List<int>.filled(100, 0);
  var is_completed = List<int>.filled(100, 0);

  n = Adata.length;

  for (int i = 0; i < n; i++) {
    p[i].arrival_time = Adata[i];
    p[i].burst_time = Bdata[i];
    p[i].priority = Pdata[i];
    p[i].pid = i + 1;
    burst_remaining[i] = p[i].burst_time;
  }

  int current_time = 0;
  int completed = 0;
  int prev = 0;

  while (completed != n) {
    int idx = -1;
    int mx = -1;
    for (int i = 0; i < n; i++) {
      if (p[i].arrival_time <= current_time && is_completed[i] == 0) {
        if (p[i].priority > mx) {
          mx = p[i].priority;
          idx = i;
        }
        if (p[i].priority == mx) {
          if (p[i].arrival_time < p[idx].arrival_time) {
            mx = p[i].priority;
            idx = i;
          }
        }
      }
    }

    if (idx != -1) {
      if (burst_remaining[idx] == p[idx].burst_time) {
        p[idx].start_time = current_time;
      }
      burst_remaining[idx] -= 1;
      current_time++;
      prev = current_time;

      if (burst_remaining[idx] == 0) {
        p[idx].completion_time = current_time;
        p[idx].turnaround_time = p[idx].completion_time - p[idx].arrival_time;
        p[idx].waiting_time = p[idx].turnaround_time - p[idx].burst_time;
        total_turnaround_time += p[idx].turnaround_time;
        total_waiting_time += p[idx].waiting_time;
        is_completed[idx] = 1;
        completed++;
      }
    } else {
      current_time++;
    }
  }

  int min(a, b) {
    if (a < b)
      return a;
    else
      return b;
  }

  int max(a, b) {
    if (a > b)
      return a;
    else
      return b;
  }

  int min_arrival_time = 10000000;
  int max_completion_time = -1;
  for (int i = 0; i < n; i++) {
    min_arrival_time = min(min_arrival_time, p[i].arrival_time);
    max_completion_time = max(max_completion_time, p[i].completion_time);
  }
  avg_turnaround_time = total_turnaround_time / n;
  avg_waiting_time = total_waiting_time / n;

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
                child: Text("PR",
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

  for (int i = 0; i < n; i++) {
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
                    child: Text("${p[i].arrival_time}",
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
                    "${p[i].burst_time}",
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
                      child: Text("${p[i].priority}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${p[i].waiting_time}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${p[i].turnaround_time}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${p[i].completion_time}",
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
                  "AVERAGE WAITING TIME :  ${double.parse("$avg_waiting_time").toStringAsFixed(2)}",
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
                  "AVERAGE TURN AROUND TIME :   ${double.parse("$avg_turnaround_time").toStringAsFixed(2)}",
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

class PRIORITYP extends StatefulWidget {
  @override
  _PRIORITYPState createState() => _PRIORITYPState();
}

class _PRIORITYPState extends State<PRIORITYP> {
  double inpWidth;
  String ArrivalInp = "";
  String BurstInp = "";
  String PriorityInp = "";

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
              title: "PRIORITY SCHEDULING\n(PREEMPTIVE)",
            ),
            preferredSize: Size.fromHeight(appbar_height),
          ),
          body: Builder(
              builder: (contextSnack) => Container(
                  constraints: BoxConstraints.expand(),
                  color: Colors.white,
                  child: SingleChildScrollView(
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
                        Container(
                            height: inpHeight,
                            padding: EdgeInsets.symmetric(
                                vertical: paddingHeight,
                                horizontal: paddingHeight * 2),
                            child: Input(
                              ltxt: "   ENTER PRIORITIES",
                              onInput: (val) => PriorityInp = val,
                            )),
                        SizedBox(
                          height: paddingHeight,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.all(paddingHeight / 1.5),
                          onPressed: () {
                            if (ArrivalInp.length < 1 ||
                                BurstInp.length < 1 ||
                                PriorityInp.length < 1) {
                              if (PriorityInp.length < 1) {
                                snackStr = "Enter Priority";
                                snackbarIcon = Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                );
                              }
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
                            } else if (RegExp(
                                    r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                                .hasMatch(PriorityInp)) {
                              snackStr = "Invalid Element";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else {
                              Adata = [];
                              Bdata = [];
                              Pdata = [];
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
                                while (i != BurstInp.length &&
                                    BurstInp[i] != " ") {
                                  str = str + BurstInp[i++];
                                }
                                if (str != "") {
                                  num = int.parse(str);
                                  Bdata.add(num);
                                } else
                                  i++;
                              }

                              for (int i = 0; i < PriorityInp.length;) {
                                int num;
                                String str = "";
                                while (i != PriorityInp.length &&
                                    PriorityInp[i] != " ") {
                                  str = str + PriorityInp[i++];
                                }
                                if (str != "") {
                                  num = int.parse(str);
                                  Pdata.add(num);
                                } else
                                  i++;
                              }

                              if ((Adata.length != Bdata.length) ||
                                  (Adata.length != Pdata.length) ||
                                  (Bdata.length != Pdata.length)) {
                                snackStr = "UnEqual Length";
                                snackbarIcon = Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                );
                              } else {
                                resMain(font_Size, paddingHeight);
                                Navigator.pushNamed(context, '/OS_display',
                                    arguments: {
                                      "PRIORITY SCHEDULING\n(PREEMPTIVE)",
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
                                      padding:
                                          EdgeInsets.all(paddingHeight / 3),
                                      child: FittedBox(
                                        child: Text(
                                          "$snackStr",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily:
                                                  'Montserrat-Light.ttf'),
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
                    ),
                  )))),
    );
  }
}
