import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_admob/firebase_admob.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    FirebaseAdMob.instance
        .initialize(appId: "ca-app-pub-8331419575194577~8128902031");
    super.initState();
    myBanner..load();
    myInterstitial..load();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    childDirected: false, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );

  BannerAd myBanner = BannerAd(
    adUnitId: BannerAd.testAdUnitId,
    size: AdSize.smartBanner,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("BannerAd event is $event");
    },
  );

  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: InterstitialAd.testAdUnitId,
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );

  @override
  Widget build(BuildContext context) {
    double appbar_height = MediaQuery.of(context).size.height / 6;
    double font_Size = (MediaQuery.of(context).size.height / 100) * 2.3;
    double paddingWidth = MediaQuery.of(context).size.width / 10;
    double paddingHeight = MediaQuery.of(context).size.width / 25;
    double inpHeight = MediaQuery.of(context).size.height / 12;
    double inpWidth = MediaQuery.of(context).size.width / 1.7;
    myBanner..show();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appbar_height,
        title: Text("SOLVER",
            style: TextStyle(
                letterSpacing: 3.0,
                fontSize: font_Size * 2,
                fontWeight: FontWeight.bold,
                fontFamily: 'Cinzel',
                color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(paddingHeight / 2),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    myInterstitial..show();
                    Navigator.pushNamed(context, "/OOPS");
                  });
                },
                child: Card(
                    margin: EdgeInsets.all(paddingHeight / 2),
                    elevation: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: EdgeInsets.all(paddingHeight / 2),
                      child: Column(
                        children: [
                          Image(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 4,
                            image: AssetImage('src/OOPS.png'),
                          ),
                          Text("\nData\nStructures",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Light.ttf',
                                  fontSize: font_Size / 1.3,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                    )),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    myInterstitial..show();
                    Navigator.pushNamed(context, "/OS");
                  });
                },
                child: Card(
                    margin: EdgeInsets.all(paddingHeight / 2),
                    elevation: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: EdgeInsets.all(paddingHeight / 2),
                      child: Column(
                        children: [
                          Image(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 4,
                            image: AssetImage('src/OS.png'),
                          ),
                          Text("\nProcess\nScheduler",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Light.ttf',
                                  fontSize: font_Size / 1.3,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                    )),
              ),
            ]),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    myInterstitial..show();
                    Navigator.pushNamed(context, "/CA");
                  });
                },
                child: Card(
                    margin: EdgeInsets.all(paddingHeight / 2),
                    elevation: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: EdgeInsets.all(paddingHeight / 2),
                      child: Column(
                        children: [
                          Image(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 4,
                            image: AssetImage('src/CA.png'),
                          ),
                          Text("\nComputer Architecture",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Light.ttf',
                                  fontSize: font_Size / 1.3,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                    )),
              ),
              FlatButton(
                onPressed: () {
                  setState(() {
                    myInterstitial..show();
                    Navigator.pushNamed(context, "/Daa");
                  });
                },
                child: Card(
                    margin: EdgeInsets.all(paddingHeight / 2),
                    elevation: 5,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2.8,
                      padding: EdgeInsets.all(paddingHeight / 2),
                      child: Column(
                        children: [
                          Image(
                            height: MediaQuery.of(context).size.height / 8,
                            width: MediaQuery.of(context).size.width / 4,
                            image: AssetImage('src/DAA.png'),
                          ),
                          Text("\nAlgorithms",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Montserrat-Light.ttf',
                                  fontSize: font_Size / 1.3,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))
                        ],
                      ),
                    )),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
