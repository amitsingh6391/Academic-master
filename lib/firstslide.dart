import 'package:Academicmaster/aktuerp.dart';
import 'package:Academicmaster/pages/homescreen.dart';

import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:esys_flutter_share/esys_flutter_share.dart';

int walls, fonts;

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  launchurl() async {
    const url =
        "https://play.google.com/store/apps/details?id=com.academic.master";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    getmode();
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      walls = preferences.getInt('back');
      fonts = preferences.getInt('words');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
                child: Column(children: [
              Text(
                "Academic Master",
                style: GoogleFonts.caveat(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color(fonts)),
              ),
              Text(
                "A new way of Learning",
                style: GoogleFonts.caveat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(fonts)),
              ),
            ])),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(walls),
                  Color(walls),
                ],
              ),
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(Icons.info, color: Color(fonts)),
              title: Text("About", style: TextStyle(color: Color(fonts))),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => About(context),
                    ));
              },
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(Icons.star, color: Color(fonts)),
              title: Text(
                "Rate us",
                style: TextStyle(color: Color(fonts)),
              ),
              onTap: () {
                launchurl();
              },
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(Icons.share, color: Color(fonts)),
              title: Text(
                "Share",
                style: TextStyle(color: Color(fonts)),
              ),
              onTap: () {
                sharelink();
              },
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(Icons.security, color: Color(fonts)),
              title: Text(
                "privacy",
                style: TextStyle(color: Color(fonts)),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Privacy()));
              },
              //trailing: Icon(Icons.dashboard),
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(Icons.update, color: Color(fonts)),
              title: Text(
                "Update app",
                style: TextStyle(color: Color(fonts)),
              ),
              onTap: () {
                launchurl();
              },
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(Icons.brightness_4, color: Color(fonts)),
              title: Text(
                "Dark mode",
                style: TextStyle(color: Color(fonts)),
              ),
              onTap: () {
                modedark();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
            ),
          ),
          Container(
            color: Color(walls),
            child: ListTile(
              leading: Icon(
                Icons.brightness_2_outlined,
                color: Color(fonts),
              ),
              title: Text(
                "Light mode",
                style: TextStyle(color: Color(fonts)),
              ),
              onTap: () {
                modelight();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
            ),
          ),
          Container(
            color: Color(walls),
            height: 200,
          )
        ],
      ),
    );
  }
}

modedark() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('back', 0xFF000000);
  preferences.setInt('words', 0xFFFFFFFF);
}

modelight() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setInt('back', 0xFFFFFFFF);
  preferences.setInt('words', 0xFF000000);
}

Future<void> sharelink() async {
  try {
    Share.text(
        'Academic Master',
        'https://play.google.com/store/apps/details?id=com.academic.master',
        'text/plain');
  } catch (e) {
    print('error: $e');
  }
}

SizedBox box(double x, double y) {
  return SizedBox(
    height: x,
    width: y,
  );
}

class About extends StatefulWidget {
  About(BuildContext context);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  contact() async {
    final Uri params = Uri(scheme: "mailto", path: "amitsingh506142@gmail.com");

    String url = params.toString();

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Color(walls),
        appBar: AppBar(
          backgroundColor: Color(walls),
          title: Text("About Us ",
              style: GoogleFonts.novaMono(
                color: Color(fonts),
                fontSize: 40,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(walls),
            // decoration: BoxDecoration(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "Academic Master is students most loved learning app . We are on a mission for enable learning, the missing part of indian education system.\nAcademic Master for android has a user-friendly, intuitive interface for notes, video lectures, syllabus, previous year papers, ebooks, free video courses and internships offers,Academic master offers following features :\n \n -👨🏻‍🎓 Read notes and watch lectures of different colleges and professors to ensure that you may get every topic cleared.\n -📚 Access curriculum books prescribed in your syllabus from top authors. \n -📑 Previous year question papers for the subjects of every branch, year, and courses. \n -🗣️ Interact with your peers and seniors, see what they are unto in their careers. \n -👨🏻‍🎓 Apply to top internships and accelerate your careers. \n -📑Share your well-written notes and become 🌟 star of your Academic master.",
                        style: TextStyle(color: Color(fonts))),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        "We the community of learners ensure you to provide best study material from top sources. Connect with us and get a chance to represent your college in the community and share your learnings.Receive gratitude and love from learners. We can all contribute in different ways to help one other succeed!",
                        style: TextStyle(color: Color(fonts))),
                  )),
                ),
                Container(
                    height: 36,
                    child: Row(children: <Widget>[
                      Text("Offered BY: ",
                          style: GoogleFonts.bitter(
                              fontSize: 20,
                              color: Color(0xFF6F35A5),
                              fontWeight: FontWeight.bold)),
                    ])),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "AmitAPPS INC. ",
                          style: GoogleFonts.indieFlower(
                              color: Color(fonts),
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )),
                Container(
                    child: Row(children: [
                  Text(
                    "Contact us",
                    style: GoogleFonts.indieFlower(
                        color: Color(fonts),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      contact();
                    },
                    child: Icon(
                      Icons.mail,
                      color: Color(fonts),
                      size: 40,
                    ),
                  )
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  TextEditingController feedbackcontroller = new TextEditingController();

  Container Submmit() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.blue[100],
            Colors.pink[100],
            Colors.yellow[100],
          ],
        ),
      ),
      child: AlertDialog(
        title: Text("Thanks"),
        content: Text(
            "we are happy to see that u are give us your valuble feedback"),
        actions: <Widget>[
          RaisedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => MyApp(),
                //     ));
                // Navigator.pop(context);
              },
              child: Text("ok"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            //color:Colors.white12,
            gradient: LinearGradient(
              colors: [
                Colors.blue[100],
                Colors.pink[100],
                Colors.yellow[100],
              ],
            ),
          ),
          child: Column(
            children: <Widget>[
              //Box(100, 30),
              Container(
                child: TextField(
                  controller: feedbackcontroller,
                  decoration: InputDecoration(
                      hintText: "write your feedback",
                      icon: Icon(
                        Icons.feedback,
                        color: Colors.black,
                      ),
                      enabled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide:
                              BorderSide(color: Colors.black, width: 50))),
                ),
              ),
              // Submit(),
            ],
          ),
        ));
  }
}
