import 'package:Academicmaster/view/chat.dart';

import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/helper/helperfunction.dart';

import 'package:Academicmaster/view/search.dart';

import 'package:Academicmaster/view/viewservices/database.dart';

import "dart:io";
import "package:flutter/material.dart";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import 'package:shared_preferences/shared_preferences.dart';

int back, words;

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  String currentuserid;
  Stream chatRooms;

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    userName: snapshot.data.documents[index]
                        .data()['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId:
                        snapshot.data.documents[index].data()["chatRoomId"],
                    userid: snapshot.data.documents[index].data()["userid"],
                    friendpic:
                        snapshot.data.documents[index].data()["friendpic"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    getCurrentUser();
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

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    //final FirebaseUser user = await _auth.currentUser();
    User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      currentuserid = uid.toString();
    });
  }

  offline() async {
    await FirebaseFirestore.instance
        .collection("onlinestatus")
        .doc(currentuserid)
        .update({"online": "offline"});
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    Constants.myEmail = await HelperFunctions.getUserEmailSharedPreference();

    DatabaseMethods().getUserChats(Constants.myName).then((snapshots) {
      setState(() {
        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      });
    });
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
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(back),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
                color: Color(back),
                // height: 300,
                width: 100,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(back),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3))
                          ]),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("All Users",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color(words),
                                  fontFamily: "Dancing",
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ])),
          ),
        ),
        body: Container(child: chatRoomsList()),
        floatingActionButton: FloatingActionButton(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Search()));
            },
            backgroundColor: Color(0xFF6F35A5)),
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  final userid;

  final String friendpic;

  ChatRoomsTile(
      {this.userName,
      @required this.chatRoomId,
      @required this.userid,
      @required this.friendpic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chat(
                      chatRoomId: chatRoomId,
                      userName: userName,
                      to: userid,
                      friendpic: friendpic,
                    )));
      },
      child: Column(
        children: <Widget>[
          Container(
            color: Color(back),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 60,
                  child: CircleAvatar(backgroundImage: NetworkImage(friendpic)),
                ),
                SizedBox(
                  width: 12,
                ),
                Text(userName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Color(words),
                      fontSize: 25,

                      // fontWeight: FontWeight.bold
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
