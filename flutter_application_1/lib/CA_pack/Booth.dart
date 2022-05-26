import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';

List<Widget> data = [];
List<Widget> data1 = [];
Widget dat;
String str = "";
String snackStr = "";
Widget snackbarIcon;

int getsize(int x) {
  return (log(x) ~/ log(2)) + 1;
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

List<int> bin(int x, int len) {
  int r, i = 0, p = x;
  //var arr = List<int>.filled(len,0);
  var c = List<int>.filled(len, 0);
  c[len - 1] = 1;
  var temp = List<int>.filled(len, 0, growable: true);
  if (x < 0) x = x * -1;
  while (i <= len - 1) {
    r = x % 2;
    temp[i] = r;
    x = x ~/ 2;
    i++;
  }
  if (p < 0) {
    for (i = 0; i < len; i++) temp[i] = 1 - temp[i];
    temp = addBinary(temp.reversed.toList(), c);
    temp = temp.reversed.toList();
  }
  return temp;
}

List<List<int>> rightShift(List<int> a1, List<int> a2) {
  int i;
  for (i = a2.length - 1; i > 0; i--) {
    a2[i] = a2[i - 1];
  }
  a2[0] = a1[a1.length - 1];
  for (i = a1.length - 1; i > 0; i--) {
    a1[i] = a1[i - 1];
  }
  return [a1, a2];
}

void resMain(a, b, double heigh, double fsize) {
  int q = 0, i, j;
  int p1 = a, p2 = b;
  if (a < 0) p1 = a * -1;
  if (b < 0) p2 = b * -1;
  int l = max(p1, p2);
  List<List<int>> t;
  int alen = getsize(l) + 1;
  var A = List<int>.filled(alen, 0);
  var C = List<int>.filled(alen, 0);
  C[alen - 1] = 1;
  var C1 = List<int>.filled(alen * 2, 0);
  C1[alen * 2 - 1] = 1;
  num s = 0;
  int z = 0, x = 0, c = 0;
  var Q = List<int>.filled(alen, 0);
  var M = List<int>.filled(alen, 0);
  var temp1 = List<int>.filled(alen, 0);
  var ans = List<int>.filled(alen * 2, 0);
  M = bin(a, alen);
  Q = bin(b, alen);
  M = M.reversed.toList();
  Q = Q.reversed.toList();
  for (i = 0; i < alen; i++) temp1[i] = 1 - M[i];
  temp1 = addBinary(temp1, C);

  data = [];
  data1 = [];
  str += "\nInitially A Is Zero : $A\n"
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
  str += "Multiplicand (M) : $A\n"
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
  str += "Multiplier (Q) :  $Q\n"
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
  str += "2's Comp. of Multiplicand (-M) : $temp1\n"
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
        Container(
          color: Colors.grey[350],
          height: heigh * 2,
          child: Center(
              child: Text("Q'",
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
              "$A".replaceAll("[", "").replaceAll("]", "").replaceAll(",", ""),
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
              "$Q"
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll(",", "")
                  .replaceAll("-1", ""),
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
  for (j = 0; j < alen; j++) {
    if ((Q[alen - 1] == 0) && (q == 1)) {
      A = addBinary(A, M);
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  "A=A+M"
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                  "$A"
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
                  "$Q"
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
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );
      str = "";
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
    if ((Q[alen - 1] == 1) && (q == 0)) {
      A = addBinary(A, temp1);
      data1.add(
        Container(
            height: heigh * 2,
            child: Center(
                child: FittedBox(
              child: Text(
                  " A=A+M "
                      .replaceAll("[", "")
                      .replaceAll("]", "")
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                  " $A "
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
                  "$Q"
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
                      .replaceAll(",", ""),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat-Light.ttf',
                      fontSize: fsize / 1.2)),
            ))),
      );
      str = "";
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
    q = Q[alen - 1];
    t = rightShift(A, Q);
    A = t[0];
    Q = t[1];
    data1.add(
      Container(
          height: heigh * 2,
          child: Center(
              child: FittedBox(
            child: Text(
                " Right Shift "
                    .replaceAll("[", "")
                    .replaceAll("]", "")
                    .replaceAll(",", ""),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
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
                "$A"
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
                "$Q"
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
                    .replaceAll(",", ""),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat-Light.ttf', fontSize: fsize / 1.2)),
          ))),
    );
    str = "";
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
  data.add(Container(
    height: 2,
    width: 1000,
    color: Colors.black,
  ));
  data1 = [];
  str += ("\nTHE ANSWER IN BINARY IS : ");
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
  for (i = 0; i < alen; i++) ans[i] = A[i];
  for (i = 0; i < alen; i++) ans[i + alen] = Q[i];
  if (((a < 0) && (b > 0)) || ((a > 0) && (b < 0))) {
    str += ("\nAfter taking 2's Comp. => ");
    for (i = 0; i < alen * 2; i++) ans[i] = 1 - ans[i];
    for (i = (alen * 2) - 1; i >= 0; i--) {
      x = ans[i];
      ans[i] = c ^ x ^ C1[i];
      if (((c == 1) && (x == 1)) ||
          ((x == 1) && (C1[i] == 1)) ||
          ((C1[i] == 1) && (c == 1)))
        c = 1;
      else
        c = 0;
    }
  }
  str += ("$ans");
  data1.add(
    Container(
        child: Text(
            "$str".replaceAll("[", "").replaceAll("]", "").replaceAll(",", ""),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: 'Montserrat-Light.ttf',
                fontWeight: FontWeight.bold,
                fontSize: fsize / 1.2))),
  );
  str = "";
  for (i = (alen * 2) - 1; i >= 0; i--) {
    s = s + (pow(2, z) * ans[i]);
    z = z + 1;
  }
  if (((a < 0) && (b > 0)) || ((a > 0) && (b < 0)))
    str += ("\nTHE ANSWER IN DECIMAL IS : -$s\n");
  else
    str += ("\nTHE ANSWER IN DECIMAL IS : $s\n");
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
}

class Booth extends StatefulWidget {
  @override
  _BoothState createState() => _BoothState();
}

class _BoothState extends State<Booth> {
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
              title: "BOOTH MULTIPLICATION",
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
                            ltxt: "   ENTER MULTIPLICAND",
                            onInput: (val) => DividendInp = val,
                          )),
                      Container(
                          height: inpHeight,
                          padding: EdgeInsets.symmetric(
                              vertical: paddingHeight,
                              horizontal: paddingHeight * 2),
                          child: Input(
                            ltxt: "   ENTER MULTIPLIER",
                            onInput: (val) => DivisorInp = val,
                          )),
                      SizedBox(
                        height: paddingHeight,
                      ),
                      RaisedButton(
                          padding: EdgeInsets.all(paddingHeight / 1.5),
                          onPressed: () {
                            if (DividendInp.length < 1 ||
                                DivisorInp.length < 1) {
                              if (DivisorInp.length < 1) {
                                snackStr = "Enter Multiplier";
                                snackbarIcon = Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                );
                              }
                              if (DividendInp.length < 1) {
                                snackStr = "Enter Multiplicand";
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
                                        child: Text(
                                          "$snackStr",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
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
                                  arguments: {"BOOTH MULTIPLICATION", dat});
                            }
                          },
                          color: Colors.black,
                          child: FittedBox(
                            child: Text(
                              "Multiply",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Montserrat-Light.ttf',
                                  fontSize: font_Size / 1.2),
                            ),
                          )),
                    ],
                  ))))),
    );
  }
}
