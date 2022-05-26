import 'package:flutter/material.dart';
import 'package:flutter_application_1/CA_pack/Booth.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';
import 'dart:math';

List<Widget> data = [];
List<Widget> data1 = [];
Widget dat;
List<int> a = new List(24);
List<int> b1 = new List(12);
List<int> b = new List(12);
List<int> q;
String snackStr = "";
Widget snackbarIcon;

int getsize(int x) {
  return (log(x) ~/ log(2)) + 1;
}

int max(int x, int y) {
  if (x < y)
    return (y);
  else
    return (x);
}

int resMain(int Q, int M, double heigh, double fsize) {
  int Z, c1, i, x, y, ch, S, G, P;
  int carry = 0, count = 0;
  int num;
  String str_temp = "";
  y = getsize(Q);
  x = getsize(M);
  Z = max(x, y);
  int temp = 2 * Z + 1;
  data = [];
  data1 = [];

  str_temp += "\nInitially A Is Zero : ";
  int ct = 0;
  for (i = 0; i <= Z; i++) {
    a[i] = 0;
    temp = a[i];
    str_temp += "$temp";
    ct++;
  }
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";
  for (i = Z; i >= 0; i--) {
    b1[i] = M % 2;
    b[i] = M % 2;
    M = M ~/ 2;
    b1[i] = 1 - b1[i];
  }
  carry = 1;
  for (i = Z; i >= 0; i--) {
    c1 = b1[i] ^ carry;
    if (b1[i] != 0 && carry != 0)
      carry = 1;
    else
      carry = 0;
    b1[i] = c1;
  }
  for (i = 2 * Z; i > Z; i--) {
    a[i] = Q % 2;
    Q = Q ~/ 2;
  }

  str_temp += "\nDivisor (M) : ";
  for (i = 0; i <= Z; i++) {
    temp = b[i];
    str_temp = str_temp + "$temp";
  }
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";
  str_temp += "\n2's Comp. of Divisor (-M) : ";
  for (i = 0; i <= Z; i++) {
    temp = b1[i];
    str_temp = str_temp + "$temp";
  }
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";
  str_temp += "\nDividend (Q) : ";

  for (i = Z + 1; i <= 2 * Z; i++) {
    temp = a[i];
    str_temp = str_temp + "$temp";
  }
  data1.add(
    Container(
        child: Text("$str_temp\n",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";

  data.add(Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data1,
  ));
  data1 = [];

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
  data1.add(
    Container(
        height: heigh * 2,
        child: Center(
            child: Text("$str_temp",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat-Light.ttf',
                    fontSize: fsize / 1.2)))),
  );
  str_temp = "";
  for (i = 0; i <= Z; i++) {
    temp = a[i];
    str_temp = str_temp + "$temp";
  }
  data1.add(
    Container(
        height: heigh * 2,
        child: Center(
            child: FittedBox(
          child: Text("$str_temp",
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontSize: fsize / 1.2)),
        ))),
  );
  str_temp = "";
  for (i = Z + 1; i <= 2 * Z; i++) {
    temp = a[i];
    str_temp = str_temp + "$temp";
  }
  data1.add(
    Container(
        height: heigh * 2,
        child: Center(
            child: FittedBox(
          child: Text("$str_temp",
              textAlign: TextAlign.center,
              style: TextStyle(
                  letterSpacing: 2,
                  fontFamily: 'Montserrat-Light.ttf',
                  fontSize: fsize / 1.2)),
        ))),
  );
  str_temp = "";

  data.add(Table(
      border: TableBorder(
          left: BorderSide(width: 2),
          right: BorderSide(width: 2),
          top: BorderSide(width: 2),
          verticalInside: BorderSide(width: 2),
          horizontalInside: BorderSide(width: 2)),
      children: [TableRow(children: data1)]));

  data1 = [];

  count = Z;
  double wid = 0;

  do {
    str_temp = "";
    for (i = 0; i < 2 * Z; i++) a[i] = a[i + 1];
    str_temp += "Left Shift";
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: Text("$str_temp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)))),
    );
    str_temp = "";
    for (i = 0; i <= Z; i++) {
      temp = a[i];
      str_temp += "$temp";
    }
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text("$str_temp",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'Montserrat-Light.ttf',
                    fontSize: fsize / 1.2)),
          ))),
    );
    str_temp = "";
    for (i = Z + 1; i < 2 * Z; i++) {
      temp = a[i];
      str_temp += "$temp";
    }
    carry = 0;
    for (i = Z; i >= 0; i--) {
      S = a[i] ^ (b1[i] ^ carry);
      if (a[i] != 0 && b1[i] != 0)
        G = 1;
      else
        G = 0;
      P = a[i] ^ b1[i];
      if (G != 0 || (P != 0 && carry != 0))
        carry = 1;
      else
        carry = 0;
      a[i] = S;
    }
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text("$str_temp",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'Montserrat-Light.ttf',
                    fontSize: fsize / 1.2)),
          ))),
    );
    data.add(Table(
        border: TableBorder(
            bottom: BorderSide(width: wid),
            left: BorderSide(width: 2),
            right: BorderSide(width: 2),
            top: BorderSide(width: 2),
            verticalInside: BorderSide(width: 2),
            horizontalInside: BorderSide(width: 2)),
        children: [TableRow(children: data1)]));

    data1 = [];
    str_temp = "";
    str_temp += "A <- A-M";
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: Text("$str_temp",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)))),
    );

    str_temp = "";
    for (i = 0; i <= Z; i++) {
      temp = a[i];
      str_temp += "$temp";
    }
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text("$str_temp",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'Montserrat-Light.ttf',
                    fontSize: fsize / 1.2)),
          ))),
    );
    str_temp = "";
    for (i = Z + 1; i < 2 * Z; i++) {
      temp = a[i];
      str_temp += "$temp";
    }
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text("$str_temp",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontFamily: 'Montserrat-Light.ttf',
                    fontSize: fsize / 1.2)),
          ))),
    );
    str_temp = "";
    data.add(Table(
        border: TableBorder(
            bottom: BorderSide(width: wid),
            left: BorderSide(width: 2),
            right: BorderSide(width: 2),
            top: BorderSide(width: 2),
            verticalInside: BorderSide(width: 2),
            horizontalInside: BorderSide(width: 2)),
        children: [TableRow(children: data1)]));

    data1 = [];
    ch = a[0];
    str_temp += "Set =>";
    switch (ch) {
      case 0:
        a[2 * Z] = 1;
        str_temp += " Q0 = 1      ";
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        for (i = 0; i <= Z; i++) {
          temp = a[i];
          str_temp += "$temp";
        }
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        for (i = Z + 1; i <= 2 * Z; i++) {
          temp = a[i];
          str_temp += "$temp";
        }
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        data.add(Table(
            border: TableBorder(
                bottom: BorderSide(width: wid),
                left: BorderSide(width: 2),
                right: BorderSide(width: 2),
                top: BorderSide(width: 2),
                verticalInside: BorderSide(width: 2),
                horizontalInside: BorderSide(width: 2)),
            children: [TableRow(children: data1)]));

        data1 = [];
        break;
      case 1:
        a[2 * Z] = 0;
        str_temp += " Q0 = 0      ";
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        for (i = 0; i <= Z; i++) {
          temp = a[i];
          str_temp += "$temp";
        }
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        for (i = Z + 1; i < 2 * Z; i++) {
          temp = a[i];
          str_temp += "$temp";
        }
        carry = 0;
        for (i = Z; i >= 0; i--) {
          S = a[i] ^ (b[i] ^ carry);
          if (a[i] != 0 && b[i] != 0)
            G = 1;
          else
            G = 0;
          P = a[i] ^ b[i];
          if (G != 0 || (P != 0 && carry != 0))
            carry = 1;
          else
            carry = 0;
          a[i] = S;
        }
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        data.add(Table(
            border: TableBorder(
                bottom: BorderSide(width: wid),
                left: BorderSide(width: 2),
                right: BorderSide(width: 2),
                top: BorderSide(width: 2),
                verticalInside: BorderSide(width: 2),
                horizontalInside: BorderSide(width: 2)),
            children: [TableRow(children: data1)]));

        data1 = [];

        str_temp += "A <- A+M";
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: Text("$str_temp",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat-Light.ttf',
                          fontSize: fsize / 1.2)))),
        );
        str_temp = "";
        for (i = 0; i <= Z; i++) {
          temp = a[i];
          str_temp += "$temp";
        }
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        for (i = Z + 1; i <= 2 * Z; i++) {
          temp = a[i];
          str_temp += "$temp";
        }
        data1.add(
          Container(
              height: heigh * 2,
              child: Center(
                  child: FittedBox(
                child: Text("$str_temp",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontFamily: 'Montserrat-Light.ttf',
                        fontSize: fsize / 1.2)),
              ))),
        );
        str_temp = "";
        data.add(Table(
            border: TableBorder(
                bottom: BorderSide(width: wid),
                left: BorderSide(width: 2),
                right: BorderSide(width: 2),
                top: BorderSide(width: 2),
                verticalInside: BorderSide(width: 2),
                horizontalInside: BorderSide(width: 2)),
            children: [TableRow(children: data1)]));

        data1 = [];
        break;
    }
    count--;
    str_temp = "";
  } while (count != 0);
  data1.add(Container(
    height: 2,
    width: 1000,
    color: Colors.black,
  ));
  num = 0;
  str_temp += "\n\n\nQUOTIENT IN BINARY  : ";

  for (i = Z + 1; i <= 2 * Z; i++) {
    temp = a[i];
    str_temp += "$temp";
    num = num + pow(2, 2 * Z - i) * a[i];
  }
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );

  str_temp = "";
  str_temp += "\nQUOTIENT IN DECIMAL : $num";
  num = 0;
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";
  str_temp += "\nREMAINDER IN BINARY : ";
  for (i = 0; i <= Z; i++) {
    temp = a[i];
    str_temp += "$temp";
    num = num + pow(2, Z - i) * a[i];
  }
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";
  str_temp += "\nREMAINDER IN DECIMAL : $num";
  data1.add(
    Container(
        child: Text("$str_temp",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Montserrat-Light.ttf',
                fontSize: fsize / 1.2))),
  );
  str_temp = "";
  data.add(Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: data1,
  ));
  dat = Column(crossAxisAlignment: CrossAxisAlignment.start, children: data);
  return 0;
}

class Restoring extends StatefulWidget {
  @override
  _RestoringState createState() => _RestoringState();
}

class _RestoringState extends State<Restoring> {
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
              title: "RESTORING DIVISION",
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
                            data = [];
                            resMain(
                                int.parse(DividendInp),
                                int.parse(DivisorInp),
                                paddingHeight,
                                font_Size);

                            Navigator.pushNamed(context, '/CA_display',
                                arguments: {"RESTORING DIVISION", dat});
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
