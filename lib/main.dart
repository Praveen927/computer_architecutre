import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Home.dart';
import 'OOPS_pack/OOPS.dart';
import 'OOPS_pack/AVL.dart';
import 'OOPS_pack/Splay.dart';
import 'OOPS_pack/OOPS_display.dart';
import 'CA_pack/CA.dart';
import 'CA_pack/Restoring.dart';
import 'CA_pack/NonRestoring.dart';
import 'CA_pack/Booth.dart';
import 'CA_pack/CA_display.dart';
import 'OS_pack/OS.dart';
import 'OS_pack/OS_display.dart';
import 'OS_pack/FCFS.dart';
import 'OS_pack/SJFP.dart';
import 'OS_pack/SJFNP.dart';
import 'OS_pack/PriorityP.dart';
import 'OS_pack/PriorityNP.dart';
import 'OS_pack/RR.dart';
import 'DAA/daa.dart';
import 'DAA/LCS.dart';
import 'DAA/KMP.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.grey[200],
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => Home(),
      "/OOPS": (context) => Oops(),
      "/AVL": (context) => AVL(),
      "/Splay": (context) => Splay(),
      "/OOPS_display": (context) => OOPS_Display(),
      "/CA": (context) => CA(),
      "/Restoring": (context) => Restoring(),
      "/NonRestoring": (context) => NonRestoring(),
      "/Booth": (context) => Booth(),
      "/CA_display": (context) => CA_Display(),
      "/OS": (context) => OS(),
      "/FCFS": (context) => FCFS(),
      "/SJFP": (context) => SJFP(),
      "/SJFNP": (context) => SJFNP(),
      "/PRIORITYP": (context) => PRIORITYP(),
      "/PRIORITYNP": (context) => PRIORITYNP(),
      "/RR": (context) => RR(),
      "/OS_display": (context) => OS_Display(),
      "/Daa": (context) => DAA(),
      "/Lcs": (context) => LCS(),
      "/Kmp": (context) => KMP()
    },
  ));
}
