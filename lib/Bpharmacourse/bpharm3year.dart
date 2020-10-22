import 'package:Academicmaster/Bpharmacourse/Bpharmnotes/thirdyearsubject.dart';
import 'package:Academicmaster/Bsccourse/Bscnotes/firstyearsubject.dart';
import 'package:Academicmaster/aktuerp.dart';
import 'package:Academicmaster/pages/homepage.dart';
import 'package:Academicmaster/pages/videotutriols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import "package:Academicmaster/services/admob_service.dart";

int back, words;

class Bpharma3year extends StatefulWidget {
  @override
  _Bpharma3yearState createState() => _Bpharma3yearState();
}

class _Bpharma3yearState extends State<Bpharma3year> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bpharma3yearhome(),
    );
  }
}

class Bpharma3yearhome extends StatefulWidget {
  @override
  _Bpharma3yearhomeState createState() => _Bpharma3yearhomeState();
}

class _Bpharma3yearhomeState extends State<Bpharma3yearhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Bpharma3yearbody(),
    );
  }
}

class Bpharma3yearbody extends StatefulWidget {
  @override
  _Bpharma3yearbodyState createState() => _Bpharma3yearbodyState();
}

class _Bpharma3yearbodyState extends State<Bpharma3yearbody> {
  //initilzed adds

  //final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
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
                      "images/bpharma.jpg",
                    ))),
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
                            color: Color(words),
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bpharm3yearsubject(),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bpharm3yearpaper(),
                            ));
                        // launchurl();
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Videotutorials(
                                  collection: "Bpharma3yearvideo"),
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
