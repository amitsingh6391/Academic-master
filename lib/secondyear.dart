import 'package:Academicmaster/os.dart';
import 'package:Academicmaster/pages/videotutriols.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'notesandquantum/secondyearsubject.dart';

import "package:Academicmaster/services/admob_service.dart";

int back, words; //git install hi na//thik hi

class Secondyear extends StatefulWidget {
  @override
  _SecondyearState createState() => _SecondyearState();
}

class _SecondyearState extends State<Secondyear> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //mgr vs code se link nahi hai  //github open kr

      home: Secondyearhome(), //merpe login bhi nahi hua hai  //account hi na//
    );
  }
}

class Secondyearhome extends StatefulWidget {
  @override
  _SecondyearhomeState createState() => _SecondyearhomeState();
}

class _SecondyearhomeState extends State<Secondyearhome> {
  @override
  void initState() {
    getmode();
    super.initState();
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Secondyearbody(),
      backgroundColor: Color(back),
    );
  }
}

class Secondyearbody extends StatefulWidget {
  @override
  _SecondyearbodyState createState() => _SecondyearbodyState();
}

class _SecondyearbodyState extends State<Secondyearbody> {
  final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    ams.createReawrdAdAndLoad();
    getmode();
    super.initState();
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Container(
          color: Color(back),
          child: Column(
            children: <Widget>[
              Container(
                height: 20,
                decoration: BoxDecoration(
                  color: Color(back),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    color: Color(back),
                    child: Image.asset(
                      "images/1_-VK_9x-T9NfoUJ5D-tJl4w.png",
                    )),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Color(back),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  //color: Colors.yellow,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "📚",
                        style: TextStyle(fontSize: 80),
                      ),
                      FlatButton(
                        child: Text(
                          "Syllabus",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              color: Color(words),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => Viewpdf(),
                          //     ));
                          RewardedVideoAd.instance..show();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(back),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  height: 200,
                  // color: Colors.pink,

                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.book,
                        size: 80,
                        color: Colors.pink,
                      ),
                      FlatButton(
                        child: Text(
                          "Notes",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              color: Color(words),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          RewardedVideoAd.instance..show();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Secondyearsubject(),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(back),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  height: 200,
                  // color: Colors.pink,

                  child: Row(
                    children: <Widget>[
                      // Image.network(

                      //     "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
                      //     width: 170,),
                      Text(
                        "📄",
                        style: TextStyle(fontSize: 80),
                      ),
                      FlatButton(
                        child: Text(
                          "Previous year paper",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              color: Color(words),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>launchurl(),));
                          RewardedVideoAd.instance..show();

                          launchurl();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.pink,
                  decoration: BoxDecoration(
                      color: Color(back),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  height: 200,

                  child: Row(
                    children: <Widget>[
                      Text(
                        "🎥",
                        style: TextStyle(fontSize: 80),
                      ),
                      FlatButton(
                        child: Text(
                          "video lecture",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              color: Color(words),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          RewardedVideoAd.instance..show();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Videotutorials(collection: "2yearvideo"),
                              ));
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  // color: Colors.green,
                  decoration: BoxDecoration(
                      color: Color(back),
                      border: Border.all(
                          color: Colors.black, style: BorderStyle.solid)),
                  height: 200,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "📑",
                        style: TextStyle(fontSize: 80),
                      ),
                      FlatButton(
                        child: Text(
                          "Important question",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontSize: 23,
                              color: Color(words),
                              fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          RewardedVideoAd.instance..show();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Secondyearquantum(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        color: Colors.black12);
  }

  //launchurl
  launchurl() async {
    const url = "https://abesit.in/library/question-paper-bank/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " could not launch $url";
    }
  }
}
