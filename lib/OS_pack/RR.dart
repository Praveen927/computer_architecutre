import 'package:flutter/material.dart';
import 'package:flutter_application_1/OS_pack/Legend.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';

List<int> Adata = [];
List<int> Bdata = [];
int Quan;
String snackStr = "";
Widget snackbarIcon;
List<Widget> data = [];
Widget data1;

void queueUpdation(List<int> queue, int timer, List<int> arrival, int n,
    int maxProccessIndex) {
  int zeroIndex;
  for (int i = 0; i < n; i++) {
    if (queue[i] == 0) {
      zeroIndex = i;
      break;
    }
  }
  queue[zeroIndex] = maxProccessIndex + 1;
}

void queueMaintainence(List<int> queue, int n) {
  for (int i = 0; (i < n - 1) && (queue[i + 1] != 0); i++) {
    int temp = queue[i];
    queue[i] = queue[i + 1];
    queue[i + 1] = temp;
  }
}

void checkNewArrival(int timer, List<int> arrival, int n, int maxProccessIndex,
    List<int> queue) {
  if (timer <= arrival[n - 1]) {
    bool newArrival = false;
    for (int j = (maxProccessIndex + 1); j < n; j++) {
      if (arrival[j] <= timer) {
        if (maxProccessIndex < j) {
          maxProccessIndex = j;
          newArrival = true;
        }
      }
    }
    //adds the incoming process to the ready queue
    //(if any arrives)
    if (newArrival) queueUpdation(queue, timer, arrival, n, maxProccessIndex);
  }
}

//Driver Code
int resMain(fsize, heigh) {
  int n, tq, timer = 0, maxProccessIndex = 0;
  double avgWait = 0, avgTT = 0;
  tq = Quan;
  n = Adata.length;
  //int arrival[n], burst[n], wait[n], turn[n], queue[n], temp_burst[n];
  //bool complete[n];
  var arrival = List<int>.filled(n, 0);
  var burst = List<int>.filled(n, 0);
  var wait = List<int>.filled(n, 0);
  var turn = List<int>.filled(n, 0);
  var queue = List<int>.filled(n, 0);
  var temp_burst = List<int>.filled(n, 0);
  var complete = List<bool>.filled(n, true);
  for (int i = 0; i < n; i++) {
    arrival[i] = Adata[i];
    burst[i] = Bdata[i];
    temp_burst[i] = burst[i];
  }

  for (int i = 0; i < n; i++) {
    //Initializing the queue and complete array
    complete[i] = false;
    queue[i] = 0;
  }
  while (
      timer < arrival[0]) //Incrementing Timer until the first process arrives
    timer++;
  queue[0] = 1;

  while (true) {
    bool flag = true;
    for (int i = 0; i < n; i++) {
      if (temp_burst[i] != 0) {
        flag = false;
        break;
      }
    }
    if (flag) break;

    for (int i = 0; (i < n) && (queue[i] != 0); i++) {
      int ctr = 0;
      while ((ctr < tq) && (temp_burst[queue[0] - 1] > 0)) {
        temp_burst[queue[0] - 1] -= 1;
        timer += 1;
        ctr++;

        //Checking and Updating the ready queue untill all the processes arrive
        checkNewArrival(timer, arrival, n, maxProccessIndex, queue);
      }
      //If a process is completed then store its exit time
      //and mark it as completed
      if ((temp_burst[queue[0] - 1] == 0) &&
          (complete[queue[0] - 1] == false)) {
        //turn array currently stores the completion time
        turn[queue[0] - 1] = timer;
        complete[queue[0] - 1] = true;
      }

      //checks whether or not CPU is idle
      bool idle = true;
      if (queue[n - 1] == 0) {
        for (int i = 0; i < n && queue[i] != 0; i++) {
          if (complete[queue[i] - 1] == false) {
            idle = false;
          }
        }
      } else
        idle = false;

      if (idle) {
        timer++;
        checkNewArrival(timer, arrival, n, maxProccessIndex, queue);
      }

      //Maintaining the entires of processes
      //after each premption in the ready Queue
      queueMaintainence(queue, n);
    }
  }

  for (int i = 0; i < n; i++) {
    turn[i] = turn[i] - arrival[i];
    wait[i] = turn[i] - burst[i];
  }

  for (int i = 0; i < n; i++) {
    avgWait += wait[i];
    avgTT += turn[i];
  }
  avgWait = avgWait / n;
  avgTT = avgTT / n;

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
                    child: Text("${arrival[i]}",
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
                    "${burst[i]}",
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
                      child: Text("${wait[i]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: fsize / 1.2,
                            fontFamily: 'Montserrat-Light.ttf',
                          ))),
                ),
                Container(
                  height: heigh * 2,
                  child: Center(
                      child: Text("${turn[i]}",
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
                  "AVERAGE WAITING TIME :  ${double.parse("$avgWait").toStringAsFixed(2)}",
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
                  "AVERAGE TURN AROUND TIME :   ${double.parse("$avgTT").toStringAsFixed(2)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.4)))),
    ],
  ));
  print(data);
  data1 = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data,
  );

  return 0;
}

class RR extends StatefulWidget {
  @override
  _RRState createState() => _RRState();
}

class _RRState extends State<RR> {
  double inpWidth;
  String ArrivalInp = "";
  String BurstInp = "";
  String QuanInp = "";

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
              title: "ROUND ROBIN\nSCHEDULING",
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
                              ltxt: "   ENTER QUANTUM NUMBER",
                              onInput: (val) => QuanInp = val,
                            )),
                        SizedBox(
                          height: paddingHeight,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.all(paddingHeight / 1.5),
                          onPressed: () {
                            if (ArrivalInp.length < 1 ||
                                BurstInp.length < 1 ||
                                QuanInp.length < 1) {
                              if (QuanInp.length < 1) {
                                snackStr = "Enter Quantum Number";
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
                                    .hasMatch(QuanInp) ||
                                RegExp(" ").hasMatch(QuanInp)) {
                              snackStr = "Invalid Quantum Number";
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

                              Quan = int.parse("$QuanInp");

                              if ((Adata.length != Bdata.length)) {
                                snackStr = "UnEqual Length";
                                snackbarIcon = Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                );
                              } else {
                                resMain(font_Size, paddingHeight);
                                Navigator.pushNamed(context, '/OS_display',
                                    arguments: {
                                      "ROUND ROBIN\nSCHEDULING",
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
