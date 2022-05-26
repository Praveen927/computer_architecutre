import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';
import 'dart:math';

class SplayTree {
  int data;
  SplayTree left;
  SplayTree right;
}

String snackStr = "";
String preData = "";
String postData = "";
String inData = "";
String lData;
Widget snackbarIcon;
List<String> data2 = [];
List<int> num;

SplayTree head;

SplayTree rightRotate(SplayTree r) {
  SplayTree ptr = r.left;
  r.left = ptr.right;
  ptr.right = r;
  return ptr;
}

SplayTree leftRotate(SplayTree r) {
  SplayTree ptr = r.right;
  r.right = ptr.left;
  ptr.left = r;
  return ptr;
}

SplayTree splayIt(int key, SplayTree root) {
  if (root == null) return null;
  SplayTree header = new SplayTree();
  header.left = header.right = null;
  SplayTree LeftTreeMax = header;
  SplayTree RightTreeMin = header;
  while (true) {
    if (key < root.data) {
      if (root.left == null) break;
      if (key < root.left.data) {
        root = rightRotate(root);
        if (root.left == null) break;
      }
      RightTreeMin.left = root;
      RightTreeMin = RightTreeMin.left;
      root = root.left;
      RightTreeMin.left = null;
    } else if (key > root.data) {
      if (root.right == null) break;
      if (key > root.right.data) {
        root = leftRotate(root);
        if (root.right == null) break;
      }
      LeftTreeMax.right = root;
      LeftTreeMax = LeftTreeMax.right;
      root = root.right;
      LeftTreeMax.right = null;
    } else
      break;
  }
  LeftTreeMax.right = root.left;
  RightTreeMin.left = root.right;
  root.left = header.right;
  root.right = header.left;
  return root;
}

SplayTree newNode(int key) {
  SplayTree temp = new SplayTree();
  temp.data = key;
  temp.left = temp.right = null;
  return temp;
}

SplayTree insertNode(int key, SplayTree root) {
  SplayTree ptr = new SplayTree();
  if (ptr == null)
    ptr = newNode(key);
  else
    ptr.data = key;
  if (root == null) {
    root = ptr;
    ptr = null;
    return root;
  }
  root = splayIt(key, root);
  if (key < root.data) {
    ptr.left = root.left;
    ptr.right = root;
    root.left = null;
    root = ptr;
  } else if (key > root.data) {
    ptr.right = root.right;
    ptr.left = root;
    root.right = null;
    root = ptr;
  } else
    return root;
  ptr = null;
  return root;
}

SplayTree deleteNode(int key, SplayTree root) {
  SplayTree temp;
  if (root == null) return null;
  root = splayIt(key, root);
  if (key != root.data)
    return root;
  else {
    if (root.left == null) {
      temp = root;
      root = root.right;
    } else {
      temp = root;
      root = splayIt(key, root.left);
      root.right = temp.right;
    }
    temp = null;
    return root;
  }
}

SplayTree searchNode(int key, SplayTree root) {
  return splayIt(key, root);
}

void preOrder(SplayTree r) {
  if (r == null) return;
  int tdata = r.data;
  preData += "$tdata  ";
  preOrder(r.left);
  preOrder(r.right);
}

void postOrder(SplayTree r) {
  if (r == null) return;
  postOrder(r.left);
  postOrder(r.right);
  int tdata = r.data;
  postData += "$tdata  ";
}

void inOrder(SplayTree r) {
  if (r == null) return;
  inOrder(r.left);
  int tdata = r.data;
  inData += "$tdata  ";
  inOrder(r.right);
}

SplayTree deleteTree(SplayTree t) {
  if (t == null) return t;
  deleteTree(t.left);
  deleteTree(t.right);
  t = null;
  return t;
}

int _height(SplayTree node) {
  if (node == null)
    return 0;
  else {
    int lheight = _height(node.left);
    int rheight = _height(node.right);

    if (lheight > rheight) {
      return (lheight + 1);
    } else {
      return (rheight + 1);
    }
  }
}

void printCurrentLevel(SplayTree root, int level) {
  if (root == null) {
    lData += "X  " * pow(2, level - 1);
    return;
  }
  if (level == 1)
    lData += "${root.data}  ";
  else if (level > 1) {
    printCurrentLevel(root.left, level - 1);
    printCurrentLevel(root.right, level - 1);
  }
}

void printLevelOrder(SplayTree root) {
  int h = _height(root);
  int i;
  for (i = 1; i <= h; i++) printCurrentLevel(root, i);
}

int delSearch(SplayTree r, int data) {
  if (r == null) {
    return 0;
  } else if (data < r.data)
    return delSearch(r.left, data);
  else if (data > r.data)
    return delSearch(r.right, data);
  else if (data == r.data) {
    return 1;
  }
}

class Splay extends StatefulWidget {
  @override
  _SplayState createState() => _SplayState();
}

class _SplayState extends State<Splay> {
  double inpWidth;
  String InsInp = "";
  String DelInp = "";
  String SerInp = "";
  @override
  Widget build(BuildContext context) {
    double fHeight = MediaQuery.of(context).size.height / 27;
    double paddingWidth = MediaQuery.of(context).size.width / 10;
    double paddingHeight = MediaQuery.of(context).size.width / 8;
    double inpHeight = MediaQuery.of(context).size.height / 17;
    double inpWidth = MediaQuery.of(context).size.width / 1.7;
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height /
            MediaQuery.of(context).size.width) *
        11;
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
            title: "SPLAY TREE",
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
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: inpHeight,
                        width: inpWidth,
                        color: Colors.white,
                        child: Input(
                          onInput: (val) => InsInp = val,
                        ),
                      ),
                      RaisedButton.icon(
                          disabledColor: Colors.black,
                          color: Colors.black,
                          disabledElevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(font_Size))),
                          onPressed: () {
                            if (InsInp.length < 1) {
                              snackStr = "Enter Any Element To Insert";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else if (RegExp(
                                    r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                                .hasMatch(InsInp)) {
                              snackStr = "Invalid Element";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else {
                              for (int i = 0; i < InsInp.length;) {
                                int num;
                                String str = "";
                                while (i != InsInp.length && InsInp[i] != " ") {
                                  str = str + InsInp[i++];
                                }
                                if (str != "") {
                                  num = int.parse(str);
                                  head = insertNode(num, head);
                                } else
                                  i++;
                              }
                              snackStr =
                                  "Insertion Successful\nRoot Element : ${head.data}";
                              snackbarIcon =
                                  Icon(Icons.check, color: Colors.white);
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
                                                  'Montserrat-Light.ttf',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                )));
                          },
                          icon: Icon(
                            Icons.add_circle,
                            color: Colors.white,
                            size: font_Size,
                          ),
                          label: Text(
                            "INSERT",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat-Light.ttf',
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(height: paddingHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: inpHeight,
                        width: inpWidth,
                        color: Colors.white,
                        child: Input(
                          onInput: (val) => DelInp = val,
                          ltxt: "   ENTER ELEMENT",
                        ),
                      ),
                      RaisedButton.icon(
                          label: Text(
                            "DELETE",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat-Light.ttf',
                                fontWeight: FontWeight.bold),
                          ),
                          disabledColor: Colors.black,
                          color: Colors.black,
                          disabledElevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(font_Size))),
                          onPressed: () {
                            if (DelInp.length < 1) {
                              snackStr = "Enter Any Element To Delete";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else if (head == null) {
                              snackStr = "Empty Tree";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else if ((RegExp(
                                        r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                                    .hasMatch(DelInp)) ||
                                DelInp.contains(" ")) {
                              snackStr = "Invalid Element";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else if ((delSearch(head, int.parse(DelInp)) !=
                                1)) {
                              snackStr = "Element Not Found To Delete";
                              snackbarIcon = Icon(
                                Icons.warning,
                                color: Colors.white,
                              );
                            } else {
                              int num = int.parse(DelInp);

                              head = deleteNode(num, head);

                              snackStr =
                                  "Deletion Successful\nRoot Element : ${head.data}";
                              snackbarIcon = Icon(Icons.delete_sweep_sharp,
                                  color: Colors.white);
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
                                              fontFamily:
                                                  'Montserrat-Light.ttf',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    )
                                  ],
                                )));
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: font_Size,
                          ))
                    ],
                  ),
                  SizedBox(height: paddingHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: inpHeight,
                        width: inpWidth,
                        color: Colors.white,
                        child: Input(
                          onInput: (val) => SerInp = val,
                          ltxt: "   ENTER ELEMENT",
                        ),
                      ),
                      RaisedButton.icon(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(font_Size))),
                        label: Text(
                          "SEARCH",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat-Light.ttf',
                              fontWeight: FontWeight.bold),
                        ),
                        disabledColor: Colors.black,
                        color: Colors.black,
                        disabledElevation: 5,
                        onPressed: () {
                          if (SerInp.length < 1) {
                            snackStr = "Enter Any Element To Search";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
                          } else if (head == null) {
                            snackStr = "Empty Tree";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
                          } else if ((RegExp(
                                      r'[!@#<>?":_`~;.,[\]\\|=+)(*&^%A-Za-z-]')
                                  .hasMatch(SerInp)) ||
                              SerInp.contains(" ")) {
                            snackStr = "Invalid Element";
                            snackbarIcon = Icon(
                              Icons.warning,
                              color: Colors.white,
                            );
                          } else {
                            head = searchNode(int.parse(SerInp), head);
                            if (int.parse(SerInp) == head.data) {
                              snackStr =
                                  "Data Element Found\nRoot Element : ${head.data}";
                              snackbarIcon =
                                  Icon(Icons.search, color: Colors.white);
                            } else {
                              snackStr =
                                  "Data Element Not Found\nRoot Element : ${head.data}";
                              snackbarIcon =
                                  Icon(Icons.search_off, color: Colors.white);
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
                                            fontFamily: 'Montserrat-Light.ttf',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              )));
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: font_Size,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: paddingHeight,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RaisedButton(
                            onPressed: () {
                              setState(() {
                                data2 = [];
                                preData = "";
                                postData = "";
                                inData = "";
                                lData = "";
                                preOrder(head);
                                postOrder(head);
                                inOrder(head);
                                printLevelOrder(head);
                                data2 = [
                                  "SPLAY TREE",
                                  preData,
                                  postData,
                                  inData,
                                  lData
                                ];
                                //  sleep(Duration(seconds: 2));
                                if (preData.length > 0) {
                                  Navigator.pushNamed(context, '/OOPS_display',
                                      arguments: data2);
                                } else {
                                  Scaffold.of(contextSnack)
                                      .showSnackBar(SnackBar(
                                          duration: Duration(seconds: 1),
                                          backgroundColor: Colors.black,
                                          content: Row(
                                            children: [
                                              Icon(Icons.warning,
                                                  color: Colors.white),
                                              Padding(
                                                padding: EdgeInsets.all(
                                                    paddingHeight / 3),
                                                child: Text(
                                                  "Empty Tree",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          'Montserrat-Light.ttf',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          )));
                                }
                              });
                            },
                            color: Colors.black,
                            child: FittedBox(
                              child: Text(
                                "DISPLAY TREE",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat-Light.ttf',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                        RaisedButton(
                            hoverElevation: 20,
                            onPressed: () {
                              setState(() {
                                head = deleteTree(head);
                                data2 = [];
                                Scaffold.of(contextSnack).showSnackBar(SnackBar(
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.black,
                                    content: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.all(paddingHeight / 3),
                                          child: FittedBox(
                                            child: Text(
                                              "Tree Deleted Successfully",
                                              style: TextStyle(
                                                  fontFamily:
                                                      'Montserrat-Light.ttf',
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        )
                                      ],
                                    )));
                              });
                            },
                            color: Colors.black,
                            child: FittedBox(
                              child: Text(
                                "DELETE TREE",
                                style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Montserrat-Light.ttf',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ]),
                  SizedBox(
                    height: paddingHeight,
                  ),
                  FittedBox(
                    child: Text(
                      "Note : Elements Must Be Space Separated.",
                      style: TextStyle(
                          fontFamily: 'Montserrat-Light.ttf',
                          fontSize: font_Size / 1.8,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
