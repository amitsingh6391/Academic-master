import 'dart:io';

import 'package:Academicmaster/firstslide.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "package:flutter/material.dart";

import 'package:Academicmaster/pages/socialmedia.dart';
import 'package:Academicmaster/pages/uploaduserprofile.dart';

import 'package:Academicmaster/view/SignIn.dart';

import 'package:Academicmaster/view/viewservices/auth.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "package:link_text/link_text.dart";
import 'package:url_launcher/url_launcher.dart';

int back, words;

class Profilescreen extends StatefulWidget {
  @override
  _ProfilescreenState createState() => _ProfilescreenState();
}

class _ProfilescreenState extends State<Profilescreen> {
  String userid;
  //String instagram,linkdin,github;

  @override
  void initState() {
    // TODO: implement initState
    getmode();
    getCurrentUser();
    super.initState();
  }

  getCurrentUser() async {
    User user = await FirebaseAuth.instance.currentUser;

    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
  }

  offline() async {
    await FirebaseFirestore.instance
        .collection("onlinestatus")
        .doc(userid)
        .update({"online": "offline"});
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

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          return showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color(back),
                  title: Text("Confirm Exit",
                      style: TextStyle(color: Color(words))),
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
            drawer: NavDrawer(),
            appBar: AppBar(
                backgroundColor: Color(back),
                title: Text("Account Status",
                    style: TextStyle(
                        color: Color(words),
                        fontSize: 20,
                        fontFamily: "Dancing",
                        fontWeight: FontWeight.bold))),
            body: Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(children: <Widget>[
                Column(children: <Widget>[
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("userprofile")
                          .doc(userid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return Text("Loading");
                        }

                        var Profiledetail = snapshot.data;
                        var instagram = Profiledetail["insta"];
                        var linkdin = Profiledetail["linkdin"];
                        var github = Profiledetail["github"];

                        //print( snapshot.data["profileimageurl"]);

                        return Column(
                          children: <Widget>[
                            Row(children: [
                              ClipOval(
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          snapshot.data["profileimageurl"],
                                      height: 150,
                                      width: 150,
                                      fit: BoxFit.cover)),
                              SizedBox(width: 5),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    color: Color(back),
                                    child: Column(children: [
                                      Text("Followers",
                                          style: TextStyle(
                                              color: Color(words),
                                              fontSize: 20,
                                              fontFamily: "Dancing",
                                              fontWeight: FontWeight.bold)),
                                      Text(snapshot.data["follower"].toString(),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold))
                                    ])),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    color: Color(back),
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text("Following".toString(),
                                            style: TextStyle(
                                                color: Color(words),
                                                fontSize: 18,
                                                fontFamily: "Dancing",
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(
                                          snapshot.data["following"].toString(),
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold))
                                    ])),
                              )
                            ]),
                            Row(children: [
                              Text(snapshot.data["userName"],
                                  style: TextStyle(
                                      color: Color(words),
                                      fontSize: 20,
                                      fontFamily: "Dancing",
                                      fontWeight: FontWeight.bold)),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Socialmedia(link: github)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("images/github.png"),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Socialmedia(link: instagram)));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage("images/instaicon.jpg"),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Socialmedia(link: linkdin)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 25,
                                      backgroundImage:
                                          AssetImage("images/linkdinicon.jpg"),
                                    ),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    sharelink();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 25,
                                        child: Icon(Icons.share,
                                            color: Color(words))),
                                  ))
                            ]),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  SizedBox(width: 80),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  UploaduserProfile()));
                                    },
                                    child: Card(
                                      child: Container(
                                          height: 30,
                                          child: Text("EditProfile",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "Dancing",
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.green))),
                                    ),
                                  ),
                                  SizedBox(width: 50),
                                  GestureDetector(
                                    onTap: () async {
                                      SharedPreferences preferences =
                                          await SharedPreferences.getInstance();
                                      preferences.setString('logedin', "no");
                                      AuthService().signOut();
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignIn()));
                                    },
                                    child: Container(
                                        height: 30,
                                        child: Text("LogOut",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "Dancing",
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red))),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Your Refer Code: $userid",
                                  style: TextStyle(
                                      color: Color(words),
                                      fontSize: 13,
                                      //fontFamily: "Dancing",
                                      fontWeight: FontWeight.bold)),
                            ),
                            Row(
                              children: <Widget>[
                                Text("Bio :",
                                    style: TextStyle(
                                        color: Color(words),
                                        fontSize: 20,
                                        fontFamily: "Dancing",
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 80),
                                SizedBox(width: 50),
                              ],
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Text(snapshot.data["bio"],
                                  style: TextStyle(
                                      color: Color(words),
                                      fontSize: 17,
                                      fontFamily: "Dancing")),
                            ),
                            SizedBox(height: 5),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Text("College:",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(words),
                                                fontFamily: "Dancing",
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 10),
                                        Text(snapshot.data["usercollege"],
                                            style: TextStyle(
                                                color: Color(words),
                                                fontSize: 17,
                                                fontFamily: "Dancing")),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Text("Your-email:",
                                            style: TextStyle(
                                                color: Color(words),
                                                fontSize: 17,
                                                fontFamily: "Dancing",
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 10),
                                        Text(snapshot.data["userEmail"],
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(words),
                                                fontFamily: "Dancing")),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Stream :",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(words),
                                                fontFamily: "Dancing",
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 10),
                                        Text(snapshot.data["userbranch"],
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(words),
                                                fontFamily: "Dancing")),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text("Year :",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(words),
                                                fontFamily: "Dancing",
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(snapshot.data["useryear"],
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Color(words),
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        );
                      }),
                  Text("Your Posts: ",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(words),
                          fontFamily: "Dancing")),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection(userid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("Loading");
                      }
                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Column(
                              children: <Widget>[
                                BlogsTile(
                                  title: snapshot.data.documents[index]
                                      .data()["title"],
                                  imgUrl: snapshot.data.documents[index]
                                      .data()['imgUrl'],
                                  posttime: snapshot.data.documents[index]
                                      .data()["posttime"],
                                ),
                              ],
                            );
                          });
                    },
                  )
                ])
              ]))),
            )));
  }
}

class BlogsTile extends StatefulWidget {
  String title, imgUrl, posttime;
  BlogsTile({
    @required this.title,
    @required this.imgUrl,
    @required this.posttime,
  });
  @override
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(back),
        child: Card(
          color: Color(back),
          child: Column(children: [
            Image(
              image: NetworkImage(widget.imgUrl),
            ),
            SizedBox(height: 10),
            LinkText(
              text: widget.title,
              textStyle: TextStyle(
                  fontSize: 17,
                  fontFamily: "Dancing",
                  //fontWeight: FontWeight.w500,
                  color: Color(words)),
            ),
            Row(
              children: <Widget>[
                Text("PostDate:",
                    style: TextStyle(
                      color: Color(words),
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )),
                Text(widget.posttime,
                    style: TextStyle(
                      color: Color(words),
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
          ]),
        ));
  }
}

Future<void> sharelink() async {
  try {
    Share.text(
        'Academic Maste',
        'https://play.google.com/store/apps/details?id=com.academic.master',
        'text/plain');
  } catch (e) {
    print('error: $e');
  }
}

class Profiletile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
