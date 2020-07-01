import "package:flutter/material.dart";

import "package:Academicmaster/pages/homescreen.dart";
import "dart:async";
import "package:firebase_admob/firebase_admob.dart";
import "package:Academicmaster/services/admob_service.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  runApp(TheMitian());
}

class TheMitian extends StatefulWidget {
  @override
  _TheMitianState createState() => _TheMitianState();
}

class _TheMitianState extends State<TheMitian> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: "Academic master",
      //home:Homescreen(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homescreen(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            child: Center(
                child: Column(
              children: <Widget>[
                SizedBox(height: 200),
                Container(
                  height: 200,
                  child: Image(
                    image: AssetImage("images/ic_launcher.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  "Academic Master",
                  style: TextStyle(
                      fontSize: 40, fontFamily: "Dancing", color: Colors.white),
                ),
                Icon(
                  Icons.play_circle_filled,
                  size: 70,
                  color: Colors.white,
                ),
                SizedBox(height: 30),
                Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                ),
                SizedBox(height: 100),
              ],
            ))));
  }
}
