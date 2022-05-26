import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';
import 'dart:math';

List<Widget> data = [];
List<Widget> data1 = [];
Widget dat;
String snackStr = "";
Widget snackbarIcon;

int getsize(int x) {
  return (log(x) ~/ log(2)) + 1;
}

List<int> bin(int num, int len) {
  int r, i = 0;
  var temp = List<int>.filled(len, 0, growable: true);
  while (i <= len - 1) {
    r = num % 2;
    temp[i] = r;
    num = num ~/ 2;
    i++;
  }
  return temp;
}

List<int> addBinary(List<int> a1, List<int> a2) {
  var temp = List<int>.filled(a1.length, 0, growable: true);
  int c = 0;
  List<int> bi = [0, 0];
  for (int i = a1.length - 1; i >= 0; i--) {
    temp[i] = a1[i] + a2[i] + c;
    bi = bin(temp[i], 2);
    temp[i] = bi[0];
    c = bi[1];
    bi[0] = 0;
    bi[1] = 0;
  }
  return temp;
}

List<int> twoComp(List<int> t) {
  var res = List<int>.filled(t.length, 0, growable: true);
  res[t.length - 1] = 1;
  for (int i = t.length - 1; i >= 0; i--) {
    t[i] = 1 - t[i];
  }
  t = addBinary(t, res);
  return t;
}

List<List<int>> leftshift(List<int> a1, List<int> a2) {
  int i;
  for (i = 0; i < a1.length - 1; i++) {
    a1[i] = a1[i + 1];
  }
  a1[i] = a2[0];
  for (i = 0; i < a2.length - 1; i++) {
    a2[i] = a2[i + 1];
  }
  a2[i] = -1;
  return [a1, a2];
}

int resMain(int n, int d, double heigh, double fsize) {
  String str = "";
  var a = List<int>.filled(getsize(n) + 1, 0, growable: true);
  var q = List<int>.filled(getsize(n), 0, growable: true);
  var q1 = List<int>.filled(getsize(n) + 1, 0, growable: true);
  var m = List<int>.filled(getsize(n) + 1, 0, growable: true);
  var mc = List<int>.filled(getsize(n) + 1, 1, growable: true);
  q = bin(n, getsize(n));
  q = (q.reversed).toList();
  q1 = bin(n, getsize(n) + 1);
  q1 = (q1.reversed).toList();
  m = bin(d, getsize(n) + 1);
  m = (m.reversed).toList();
  mc = bin(d, getsize(n) + 1);
  mc = (mc.reversed).toList();
  mc = twoComp(mc);
  data = [];
  data1 = [];
  str += "\nInitially A Is Zero : $a\n"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");

  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  str += "Dividend (Q) : $q\n"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  str += "Divisor (M) :  $m\n"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  str += "2's Comp. of Divisor (-M) : $mc\n"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";

  data.add(Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data1,
  ));
  data1 = [];

  int ct = q.length;
  List<List<int>> lefttemp;
  data1.add(Table(
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
              child: Text("STEPS",
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
              child: Text("A",
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
              child: Text("Q",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: fsize / 1.2,
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold))),
        ),
      ])
    ],
  ));

  data.add(Column(
    children: data1,
  ));
  data1 = [];
  str = "";

  data1.add(
    Container(
        height: heigh * 2,
        child: Center(
            child: Text("$str",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat-Light.ttf',
                    fontWeight: FontWeight.bold,
                    fontSize: fsize / 1.2)))),
  );

  data1.add(
    Container(
        height: heigh * 2,
        child: Center(
            child: FittedBox(
          child: Text(
              "$a".replaceAll("[", "").replaceAll("]", "").replaceAll(",", ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat-Light.ttf', fontSize: fsize / 1.2)),
        ))),
  );
  data1.add(
    Container(
        height: heigh * 2,
        child: Center(
            child: FittedBox(
          child: Text(
              "$q"
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll(",", "")
                  .replaceAll("-1", ""),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat-Light.ttf', fontSize: fsize / 1.2)),
        ))),
  );

  data.add(Table(
      border: TableBorder(
          left: BorderSide(width: 2),
          right: BorderSide(width: 2),
          top: BorderSide(width: 2),
          verticalInside: BorderSide(width: 2),
          horizontalInside: BorderSide(width: 2)),
      children: [TableRow(children: data1)]));
  do {
    data1 = [];
    str = "";
    lefttemp = leftshift(a, q);
    a = lefttemp[0];
    q = lefttemp[1];

    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: Text(" Left Shift ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.2)))),
    );

    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text(
                "$a"
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .replaceAll(",", ""),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat-Light.ttf', fontSize: fsize / 1.2)),
          ))),
    );
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text(
                "$q"
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .replaceAll(",", "")
                    .replaceAll("-1", ""),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat-Light.ttf', fontSize: fsize / 1.2)),
          ))),
    );

    data.add(Table(
        border: TableBorder(
            left: BorderSide(width: 2),
            right: BorderSide(width: 2),
            top: BorderSide(width: 2),
            verticalInside: BorderSide(width: 2),
            horizontalInside: BorderSide(width: 2)),
        children: [TableRow(children: data1)]));

    data1 = [];

    str = "";
    if (a[0] == 1) {
      a = addBinary(a, m);
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: Text(" A <- A+M ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold,
                        fontSize: fsize / 1.2)))),
      );

      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$a"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$q"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", "")
                      .replaceAll("-1", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );

      data.add(Table(
          border: TableBorder(
              left: BorderSide(width: 2),
              right: BorderSide(width: 2),
              top: BorderSide(width: 2),
              verticalInside: BorderSide(width: 2),
              horizontalInside: BorderSide(width: 2)),
          children: [TableRow(children: data1)]));

      data1 = [];
    } else {
      a = addBinary(a, mc);
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: Text(" A <- A-M ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat-Light.ttf',
                        fontWeight: FontWeight.bold,
                        fontSize: fsize / 1.2)))),
      );

      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$a"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$q"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", "")
                      .replaceAll("-1", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );

      data.add(Table(
          border: TableBorder(
              left: BorderSide(width: 2),
              right: BorderSide(width: 2),
              top: BorderSide(width: 2),
              verticalInside: BorderSide(width: 2),
              horizontalInside: BorderSide(width: 2)),
          children: [TableRow(children: data1)]));

      data1 = [];
    }
    if (a[0] == 0) {
      q[q.length - 1] = 1;

      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(" Set => Q0 = 1 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.2)),
            ))),
      );

      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$a"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$q"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", "")
                      .replaceAll("-1", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );

      data.add(Table(
          border: TableBorder(
              left: BorderSide(width: 2),
              right: BorderSide(width: 2),
              top: BorderSide(width: 2),
              verticalInside: BorderSide(width: 2),
              horizontalInside: BorderSide(width: 2)),
          children: [TableRow(children: data1)]));

      data1 = [];
    } else {
      q[q.length - 1] = 0;
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(" Set => Q0 = 0 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontWeight: FontWeight.bold,
                      fontSize: fsize / 1.2)),
            ))),
      );

      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$a"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "$q"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", "")
                      .replaceAll("-1", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );

      data.add(Table(
          border: TableBorder(
              left: BorderSide(width: 2),
              right: BorderSide(width: 2),
              top: BorderSide(width: 2),
              verticalInside: BorderSide(width: 2),
              horizontalInside: BorderSide(width: 2)),
          children: [TableRow(children: data1)]));

      data1 = [];
    }

    ct -= 1;
  } while (ct > 0);

  data.add(Container(
    height: 2,
    width: 1000,
    color: Colors.black,
  ));
  if (a[0] == 1) {
    str += ("\n\nAdding Divisor : A <- A+M");

    data1.add(
      Container(
          child: Text("$str",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Montserrat-Light.ttf',
                  fontWeight: FontWeight.bold,
                  fontSize: fsize / 1.2))),
    );
    str = "";
    a = addBinary(a, m);
  }
  int num = 0, temp, i, count = 0;

  str += "\n\nQUOTIENT IN BINARY  : $q"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  for (i = q.length - 1; i > 0; i--) {
    num = num + pow(2, count) * q[i];
    count++;
  }
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  str += "\nQUOTIENT IN DECIMAL : $num"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  num = 0;
  count = 0;
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  str += "\nREMAINDER IN BINARY : $a"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  for (i = a.length - 1; i > 0; i--) {
    num = num + pow(2, count) * a[i];
    count++;
  }
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  str += "\nREMAINDER IN DECIMAL : $num"
      .replaceAll("[", "")
      .replaceAll("]", "")
      .replaceAll(",", "");
  data1.add(
    Container(
        child: Text("$str",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  data.add(Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data1,
  ));
  data1 = [];
  dat = Column(crossAxisAlignment: CrossAxisAlignment.start, children: data);
  return 0;
}

class NonRestoring extends StatefulWidget {
  @override
  _NonRestoringState createState() => _NonRestoringState();
}

class _NonRestoringState extends State<NonRestoring> {
  double inpWidth;
  String DividendInp = "";
  String DivisorInp = "";

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
              title: "NON-RESTORING DIVISION",
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
                            ltxt: "   ENTER DIVIDEND",
                            onInput: (val) => DividendInp = val,
                          )),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "   ENTER DIVISOR",
                            onInput: (val) => DivisorInp = val,
                          )),
                      SizedBox(
                        height: paddingHeight,
                      ),
                      RaisedButton(
                        padding: EdgeInsets.all(paddingHeight / 1.5),
                        onPressed: () {
                          if (DividendInp.length < 1 || DivisorInp.length < 1) {
                            if (DivisorInp.length < 1) {
                              snackStr = "Enter Divisor";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            }
                            if (DividendInp.length < 1) {
                              snackStr = "Enter Dividend";
                              snackbarIcon =
                                  Icon(Icons.warning, color: Colors.white);
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
                          } else if ((RegExp(
                                      r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                                  .hasMatch(DividendInp)) ||
                              DividendInp.contains(" ")) {
                            snackStr = "Invalid Element";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
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
                          } else if ((RegExp(
                                      r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                                  .hasMatch(DivisorInp)) ||
                              DivisorInp.contains(" ")) {
                            snackStr = "Invalid Element";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
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
                          } else if ((int.parse(DividendInp)) < 0 ||
                              (int.parse(DivisorInp)) < 0) {
                            if ((int.parse(DividendInp)) < 0) {
                              snackStr = "Input Should Be Positive";
                              snackbarIcon =
                                  Icon(Icons.warning, color: Colors.white);
                            }
                            if ((int.parse(DivisorInp)) < 0) {
                              snackStr = "Input Should Be Positive";
                              snackbarIcon =
                                  Icon(Icons.warning, color: Colors.white);
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
                          } else if ((int.parse(DivisorInp)) == 0) {
                            snackStr = "Zero Division Error";
                            snackbarIcon =
                                Icon(Icons.warning, color: Colors.white);

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
                          } else if ((int.parse(DividendInp)) <
                              (int.parse(DivisorInp))) {
                            snackStr = "Dividend must be greater than Divisor";
                            snackbarIcon =
                                Icon(Icons.warning, color: Colors.white);

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
                            resMain(
                                int.parse(DividendInp),
                                int.parse(DivisorInp),
                                paddingHeight,
                                font_Size);

                            Navigator.pushNamed(context, '/CA_display',
                                arguments: {"NON-RESTORING DIVISION", dat});
                          }
                        },
                        color: Colors.black,
                        child: FittedBox(
                          child: Text("Divide",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: font_Size / 1.2,
                                fontFamily: 'Montserrat-Light.ttf',
                              )),
                        ),
                      )
                    ],
                  ))))),
    );
  }
}
