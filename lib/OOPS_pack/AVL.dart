import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/res/TitleBar.dart';
import '../res/Input.dart';

class AVLNode {
  int data;
  AVLNode left;
  AVLNode right;
}

//List<Widget> data1 = [Text("")];
String snackStr = "";
Widget snackbarIcon;
String preData = "";
String postData = "";
String inData = "";
String lData;
List<String> data2 = [];
//List<int> num;

AVLNode head = null;

AVLNode newNode(int data) {
  AVLNode temp = new AVLNode();
  temp.data = data;
  temp.left = null;
  temp.right = null;
  return temp;
}

int max(int lh, int rh) {
  if (lh > rh)
    return lh;
  else
    return rh;
}

int height(AVLNode r) {
  if (r == null) {
    return -1;
  }
  int lh, rh;
  lh = height(r.left);
  rh = height(r.right);
  return max(lh, rh) + 1;
}

int getBalanceFactor(AVLNode r) {
  return height(r.left) - height(r.right);
}

AVLNode leftRotate(AVLNode r) {
  //cout<<"\nLeft Rotation"<<endl;
  AVLNode ptr = r.right;
  r.right = ptr.left;
  ptr.left = r;
  return ptr;
}

AVLNode rightRotate(AVLNode r) {
  //cout<<"\nRight Rotation"<<endl;
  AVLNode ptr = r.left;
  r.left = ptr.right;
  ptr.right = r;
  return ptr;
}

AVLNode insertNode(AVLNode r, int data) {
  if (r == null)
    return newNode(data);
  else if (data < r.data) {
    r.left = insertNode(r.left, data);
  } else if (data > r.data) {
    r.right = insertNode(r.right, data);
  }
  int bf;
  bf = getBalanceFactor(r);
  if (bf > 1 && data < r.left.data)
    r = rightRotate(r);
  else if (bf > 1 && data > r.left.data) {
    r.left = leftRotate(r.left);
    r = rightRotate(r);
  } else if (bf < -1 && data > r.right.data) {
    r = leftRotate(r);
  } else if (bf < -1 && data < r.right.data) {
    r.right = rightRotate(r.right);
    r = leftRotate(r);
  }
  return r;
}

AVLNode minNode(AVLNode r) {
  if (r == null) return r;
  if (r.left == null)
    return r;
  else
    return minNode(r.left);
}

AVLNode deleteNode(AVLNode r, int data) {
  AVLNode temp;
  if (r == null) {
    return r;
  } else if (data < r.data) {
    r.left = deleteNode(r.left, data);
  } else if (data > r.data) {
    r.right = deleteNode(r.right, data);
  } else {
    if (r.left == null) {
      temp = r.right;
      return temp;
    } else if (r.right == null) {
      temp = r.left;
      return temp;
    } else {
      temp = minNode(r.right);
      r.data = temp.data;
      r.right = deleteNode(r.right, temp.data);
    }
  }
  int bf;
  bf = getBalanceFactor(r);
  if (bf > 1 && getBalanceFactor(r.left) >= 0)
    return rightRotate(r);
  else if (bf > 1 && getBalanceFactor(r.left) == -1) {
    r.left = leftRotate(r.left);
    return rightRotate(r);
  } else if (bf < -1 && getBalanceFactor(r.right) <= 0) {
    return leftRotate(r);
  } else if (bf < -1 && getBalanceFactor(r.right) == 1) {
    r.right = rightRotate(r.right);
    return leftRotate(r);
  }
  return r;
}

void searchNode(AVLNode r, int data) {
  if (r == null) {
    snackStr = "Element Not Found";
    snackbarIcon = Icon(Icons.search_off_sharp, color: Colors.white);
  } else if (data < r.data)
    searchNode(r.left, data);
  else if (data > r.data)
    searchNode(r.right, data);
  else if (data == r.data) {
    snackStr = "Data Element Found";
    snackbarIcon = Icon(Icons.search_sharp, color: Colors.white);
  }
  return;
}

int delSearch(AVLNode r, int data) {
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

void preOrder(AVLNode r) {
  if (r == null) return;
  int tdata = r.data;
  preData += "$tdata  ";
  preOrder(r.left);
  preOrder(r.right);
}

void postOrder(AVLNode r) {
  if (r == null) return;
  postOrder(r.left);
  postOrder(r.right);
  int tdata = r.data;
  postData += "$tdata  ";
}

void inOrder(AVLNode r) {
  if (r == null) return;
  inOrder(r.left);
  int tdata = r.data;
  inData += "$tdata  ";
  inOrder(r.right);
}

int _height(AVLNode node) {
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

void printCurrentLevel(AVLNode root, int level) {
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

void printLevelOrder(AVLNode root) {
  int h = _height(root);
  int i;
  for (i = 1; i <= h; i++) printCurrentLevel(root, i);
}

AVLNode deleteTree(AVLNode t) {
  if (t == null) return t;
  deleteTree(t.left);
  deleteTree(t.right);
  t = null;
  return t;
}

class AVL extends StatefulWidget {
  @override
  _AVLState createState() => _AVLState();
}

class _AVLState extends State<AVL> {
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
            title: "AVL TREE",
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
                                  head = insertNode(head, num);
                                } else
                                  i++;
                              }
                              snackStr = "Insertion Successful";
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

                              head = deleteNode(head, num);

                              snackStr = "Deletion Successful";
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
                            searchNode(head, int.parse(SerInp));
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
                                  "AVL TREE",
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
