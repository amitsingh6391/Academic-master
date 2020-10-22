import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import 'package:Academicmaster/pages/socialmedia.dart';

import "package:cloud_firestore/cloud_firestore.dart";
import 'package:shared_preferences/shared_preferences.dart';

int back, words;

class Alluserprofile extends StatefulWidget {
  String userid;
  Alluserprofile({@required this.userid});
  @override
  _AlluserprofileState createState() => _AlluserprofileState();
}

class _AlluserprofileState extends State<Alluserprofile> {
  @override
  void initState() {
    print(widget.userid);
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
        appBar: AppBar(
            backgroundColor: Color(back),
            title: Text("Account Status",
                style: TextStyle(
                    color: Color(words),
                    fontSize: 20,
                    fontFamily: "Dancing",
                    fontWeight: FontWeight.bold))),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
          Column(children: <Widget>[
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("userprofile")
                    .doc(widget.userid)
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
                                imageUrl: snapshot.data["profileimageurl"],
                                height: 150,
                                width: 150,
                                fit: BoxFit.cover)),
                        SizedBox(width: 5),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                              color: Colors.black,
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
                              color: Colors.black,
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
                                Text(snapshot.data["following"].toString(),
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
                              backgroundImage: AssetImage("images/github.png"),
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
                            ))
                      ]),
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
                  .collection(widget.userid)
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
                            title:
                                snapshot.data.documents[index].data()["title"],
                            imgUrl:
                                snapshot.data.documents[index].data()['imgUrl'],
                            posttime: snapshot.data.documents[index]
                                .data()["posttime"],
                          ),
                        ],
                      );
                    });
              },
            )
          ])
        ]))));
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
        child: Card(
      child: Column(children: [
        Image(
          image: NetworkImage(widget.imgUrl),
        ),
        SizedBox(height: 10),
        Text(widget.title,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                fontFamily: "Dancing")),
        Row(
          children: <Widget>[
            Text(
              "PostDate:",
            ),
            Text(widget.posttime,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ),
      ]),
    ));
  }
}
