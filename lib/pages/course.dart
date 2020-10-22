import 'dart:io';
import 'package:Academicmaster/Bsccourse/selectbscyear.dart';
import 'package:Academicmaster/Bcomcourse/selectbcomyear.dart';
import 'package:Academicmaster/Bpharmacourse/selectbpharmyear.dart';
import 'package:Academicmaster/dpharmacourse/dpharmayear.dart';
import 'package:Academicmaster/branch.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";

import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:Academicmaster/services/admob_service.dart';

int back, words;

class Course extends StatefulWidget {
  //krna //kr rha open
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final ams = AdMobService();
  String cuserid; //call admobclass for use fntction

  @override
  void initState() {
    //intilazied the appid

    ams.createReawrdAdAndLoad();
    super.initState();
    getCurrentUser();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    SharedPreferences preferences = await SharedPreferences.getInstance();

    back = preferences.getInt('back');
    words = preferences.getInt('words');
    User user = await FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      cuserid = uid.toString();
    });
  }

  offline() async {
    await FirebaseFirestore.instance
        .collection("onlinestatus")
        .doc(cuserid)
        .update({"online": "offline"});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // InterstitialAd newTripAd =
    //     ams.getnewTripInterstitial(); //first save in the variablesto use adds

    //newTripAd.load();
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: Color(back),
                title:
                    Text("Confirm Exit", style: TextStyle(color: Color(words))),
                content: Text("Are you sure you want to exit?",
                    style: TextStyle(color: Color(words))),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      offline();
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
      child: Scaffold(
          backgroundColor: Color(back),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                urllauncher();
              },
              child: Image(image: AssetImage("images/whatsup.png"))),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      height: size.height * 0.25,
                      width: size.width * 1,
                      child: Card(
                          child: Image(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://www.downingstudents.com/wp-content/uploads/2017/04/Tech-Study-banner.jpg"))),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 50, right: 50, top: 50),
                      child: Text(
                        "Academic Master",
                        style: TextStyle(
                            color: Color(back),
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 70, right: 50, top: 90),
                      child: Text(
                        "A new way of Learning",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Dancing",
                          color: Color(back),
                        ),
                      ),
                    ),
                  ]),
                  Container(
                    // height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    // color: Colors.black,
                    child: Column(
                      children: <Widget>[
                        Container(
                          // padding: EdgeInsets.
                          color: Colors.transparent,
                          height: 60,
                          child: Text(
                            "Select your Course",
                            style: GoogleFonts.grenze(
                              textStyle: Theme.of(context).textTheme.display1,
                              fontSize: 30,
                              color: Color(words),
                            ),
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyContainer("images/btech.png", context),
                            ),
                            // box(),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyContainer("images/bpharma.jpg", context),
                            ),
                            //box(),
                          ],
                        ),
                        box(),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  MyContainer("images/dpharmapic.jpg", context),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyContainer("images/bcom1.png", context),
                            ),
                          ],
                        ),
                        box(),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MyContainer("images/bse.png", context),
                            ),

                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: MyContainer("images/bcom1.png", context),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }

  Widget MyContainer(String Course, context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        RewardedVideoAd.instance..show();
        if (Course == "images/bse.png") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Bscyear()));
        } else if (Course == "images/bcom1.png") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Bcomyear()));
        } else if (Course == "images/bpharma.jpg") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Bpharmyear()));
        } else if (Course == "images/dpharmapic.jpg") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dpharmayear()));
        } else if (Course == "images/btech.png") {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Branch()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Branch()));
        }
      },
      child: Center(
        child: CircleAvatar(backgroundImage: AssetImage(Course), radius: 80),
      ),
    );
  }

  SizedBox box() {
    return SizedBox(
      height: 20,
      width: 20,
    );
  }

  urllauncher() async {
    const url = 'https://chat.whatsapp.com/FJi7AJUMw9VL8fwEM9dmTR';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
