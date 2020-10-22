import 'package:Academicmaster/pages/videotutriols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import "notesandquantum/firstyearsubject.dart";

import "package:Academicmaster/services/admob_service.dart";
import "package:firebase_admob/firebase_admob.dart";

int back, words;

class Firstyear extends StatefulWidget {
  @override
  _FirstyearState createState() => _FirstyearState();
}

class _FirstyearState extends State<Firstyear> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstyearhome(),
    );
  }
}

class Firstyearhome extends StatefulWidget {
  @override
  _FirstyearhomeState createState() => _FirstyearhomeState();
}

class _FirstyearhomeState extends State<Firstyearhome> {
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
      backgroundColor: Color(back),
      body: Firstyearbody(),
    );
  }
}

class Firstyearbody extends StatefulWidget {
  @override
  _FirstyearbodyState createState() => _FirstyearbodyState();
}

class _FirstyearbodyState extends State<Firstyearbody> {
  //initilzed adds

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
      color: Color(back),
      child: Container(
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
                    width: MediaQuery.of(context).size.width,
                    color: Color(back),
                    child: Image.asset(
                      "images/1_-VK_9x-T9NfoUJ5D-tJl4w.png",
                    ))),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(back),
                    border: Border.all(
                        color: Colors.black, style: BorderStyle.solid)),
                child: Row(
                  children: <Widget>[
                    Text(
                      "📚",
                      style: TextStyle(fontSize: 100),
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
                height: 100,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.book,
                      size: 100,
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
                              builder: (context) => Firstyearsubject(),
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
                height: 100,
                child: Row(
                  children: <Widget>[
                    // Image.network(
                    //   "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
                    //   width: 170,
                    // ),
                    Text(
                      "📄",
                      style: TextStyle(fontSize: 100),
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
                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>QuestionPaper(),));
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
                            fontSize: 25,
                            color: Color(words),
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        RewardedVideoAd.instance..show();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Videotutorials(collection: "firstyearvideo"),
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
                child: Row(
                  children: <Widget>[
                    Text(
                      "📑",
                      style: TextStyle(fontSize: 100),
                    ),
                    FlatButton(
                      child: Text(
                        "Important question",
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
                              builder: (context) => Firstyearquantum(),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // color: Colors.black12,
    );
  }

  launchurl() async {
    const url = "https://abesit.in/library/question-paper-bank/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " could not launch $url";
    }
  }
}
