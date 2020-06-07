import 'package:Academicmaster/aktuerp.dart';
import 'package:Academicmaster/pages/homescreen.dart';
import 'package:Academicmaster/view/forgot_password.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import "package:Academicmaster/view/viewmain.dart";
import 'package:url_launcher/url_launcher.dart';
import "Loginscreen/loginscreen.dart";

import "branch.dart";
import 'package:esys_flutter_share/esys_flutter_share.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {

  launchurl() async{
 const url = "https://play.google.com/store/apps/details?id=com.academic.master";
 if (await canLaunch(url)){
   await launch(url);
 }else{
   throw "could not launch $url";
 }


}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                "Academic Master",
                style: GoogleFonts.caveat(
                    fontWeight: FontWeight.bold, fontSize: 40),
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00fd80), Color(0xFF00068b)],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(context),
                  ));
            },
          ),
           ListTile(
            leading: Icon(Icons.star),
            title: Text("Rate us"),
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => About(context),
              //     ));
              launchurl();
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () {
              sharelink();
            },
          ),
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feedback()));
            },
            //trailing: Icon(Icons.dashboard),
          ),
          ListTile(
            leading: Icon(Icons.person_outline),
            title: Text("profile"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
            //trailing: Icon(Icons.dashboard),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text("privacy"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Privacy()));
            },
            //trailing: Icon(Icons.dashboard),
          ),
        ],
      ),
    );
  }
}

 
  Future<void>sharelink() async {
  try {
    Share.text('Academic Maste',
        'https://play.google.com/store/apps/details?id=com.academic.master', 'text/plain');
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
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      
      onWillPop: ()async => true,
          child: Scaffold(
            
        appBar: AppBar(
          backgroundColor: Color(0xFF8cc8fa),
          title: Text("About Us ",
              style: GoogleFonts.novaMono(
                color: Colors.black,
                fontSize: 40,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color(0xFF8cc8fa),
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  height: 10,
                ),
                Text(
                    " Founded in 2020 Academic Master  provides a platform that helps each and every student to learn .  Inside our app we have tried to cover all the notes and important question regarding to your examination in our reach ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    " * you can also chat with your friends  in chat section  and ask your querries, our response team will try to respond ",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text(
                    "*  videos are provided for your convinience we have tried our best  to give you  a better platform to study free of cost",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Container(
                  height: 10,
                ),
                Container(
                    height: 36,
                    child: Row(children: <Widget>[
                      Text("Created by:",
                          style: GoogleFonts.bitter(
                              fontSize: 30,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold)),
                    ])),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Amit Singh",
                          style: GoogleFonts.indieFlower(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Neeraj Gailakoti",
                          style: GoogleFonts.indieFlower(
                              fontSize: 27, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
                Container(
                    height: 36,
                    child: Row(children: <Widget>[
                      Text("Suported by:",
                          style: GoogleFonts.bitter(
                              fontSize: 30,
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold)),
                    ])),
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Chandan Mal",
                          style: GoogleFonts.indieFlower(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      
                        Text(
                          "Sanal Yadav",
                          style: GoogleFonts.indieFlower(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Vishal",
                          style: GoogleFonts.indieFlower(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Sapna singh",
                          style: GoogleFonts.indieFlower(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyApp(),
                    ));
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
              Box(100, 30),
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
              Box(50, 50),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Submmit()));
                },
                child: Text("submmit", style: TextStyle(color: Colors.white)),
                color: Colors.grey,
              ),

              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Text(feedbackcontroller.text),
              )
            ],
          ),
        ));
  }

  
}


