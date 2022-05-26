import 'package:flutter/material.dart';

class Legend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double paddingWidth = MediaQuery.of(context).size.width / 50;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        8;

    return Container(
      margin: EdgeInsets.symmetric(vertical: paddingHeight),
      child: Column(
        children: [
          Table(children: [
            TableRow(
              children: [
                Container(
                  height: paddingHeight,
                  child: Center(
                    child: Text(" PID : Process ID ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: font_Size / 1.5,
                          fontFamily: 'Sans',
                        )),
                  ),
                ),
                Container(
                  height: paddingHeight,
                  child: Center(
                      child: Text(
                    " AT : Arrival Time ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: font_Size / 1.5,
                      fontFamily: 'Sans',
                    ),
                  )),
                ),
                Container(
                  height: paddingHeight,
                  child: Center(
                      child: Text(
                    " BT : Burst Time ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: font_Size / 1.5,
                      fontFamily: 'Sans',
                    ),
                  )),
                ),
              ],
            ),
            TableRow(
              children: [
                Container(
                  height: paddingHeight,
                  child: Center(
                      child: Text(
                    " PR : Priority ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: font_Size / 1.5,
                      fontFamily: 'Sans',
                    ),
                  )),
                ),
                Container(
                  height: paddingHeight,
                  child: Center(
                    child: Text(" CT : Completion Time ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: font_Size / 1.5,
                          fontFamily: 'Sans',
                        )),
                  ),
                ),
                Container(
                  height: paddingHeight,
                  child: Center(
                      child: Text(
                    " WT : Waiting Time ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: font_Size / 1.5,
                      fontFamily: 'Sans',
                    ),
                  )),
                ),
              ],
            ),
          ]),
          Table(
              //border: TableBorder.all(width: 2, color: Colors.black),
              children: [
                TableRow(children: [
                  Container(
                    height: paddingHeight * 1.2,
                    child: Center(
                      child: Text(" TAT : Turn Around Time ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: font_Size / 1.5,
                            fontFamily: 'Sans',
                          )),
                    ),
                  )
                ])
              ])
        ],
      ),
    );
  }
}
