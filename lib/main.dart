import 'dart:io';

import 'package:Academicmaster/view/SignIn.dart';
import 'package:firebase_core/firebase_core.dart';
import "package:flutter/material.dart";

import "package:Academicmaster/pages/homescreen.dart";
import 'package:intro_slider/slide_object.dart';
import "dart:async";

import 'package:shared_preferences/shared_preferences.dart';
import 'package:intro_slider/intro_slider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  await Firebase.initializeApp();
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
      Duration(seconds: 3),
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        SharedPreferences preferences = await SharedPreferences.getInstance();

        var logedin = preferences.getString('logedin');

        print(logedin);
        print("aooooo");

        if (logedin == "yes") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homescreen()));
        }
//IntroScreen
        if (logedin == "no") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SignIn()));
        } //SignIn
        if (logedin != "yes" && logedin == null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => IntroScreen()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/splashlogo.jpg"), fit: BoxFit.fill)),
    ));
  }
}

//introsreen...

class IntroScreen extends StatefulWidget {
  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  getintro() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('logedin', "no");
  }

  @override
  void initState() {
    getintro();

    super.initState();

    slides.add(
      new Slide(
        title: "Academic master",
        description: "Academic Master students most loving learning app. ",
        pathImage: "images/login.png",
        backgroundColor: Color(0xfff5a623),
      ),
    );
    slides.add(
      new Slide(
        title: "Easy To Find notes,books,papers",
        description:
            "We are on a mission for enable the missing part of indian education system",
        pathImage: "images/signup.png",
        backgroundColor: Color(0xff203152),
      ),
    );
    slides.add(
      new Slide(
        title: "",
        description: "Let's Get Start",
        pathImage: "images/third.jpg",
        backgroundColor: Color(0xff9932CC),
      ),
    );
  }

  void onDonePress() {
// Do what you want

    Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
      child: new IntroSlider(
        slides: this.slides,
        onDonePress: this.onDonePress,
      ),
    );
  }
}
