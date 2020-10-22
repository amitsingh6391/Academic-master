import 'dart:io';

import 'package:Academicmaster/view/chat.dart';
import 'package:Academicmaster/view/chatrooms.dart';

import 'package:Academicmaster/view/helper/constants.dart';

import 'package:Academicmaster/view/viewservices/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

// int back, words;

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  int back, words;

  initiateSearch() async {
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      await databaseMethods
          .searchByName(searchEditingController.text)
          .then((snapshot) {
        searchResultSnapshot = snapshot;
        print("$searchResultSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchResultSnapshot.docs.length,
            itemBuilder: (context, index) {
              return userTile(
                  searchResultSnapshot.docs[index].data()["username"],
                  searchResultSnapshot.docs[index].data()["email"],
                  searchResultSnapshot.docs[index]
                      .data()["profilepic"]
                      .toString(),
                  searchResultSnapshot.docs[index].data()["userid"]);
            })
        : Container();
  }

  /// 1.create a chatroom, send user to the chatroom, other userdetails
  sendMessage(String userName, var userid, String profilepic) {
    List<String> users = [Constants.myName, userName];

    String chatRoomId = getChatRoomId(Constants.myName, userName);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId": chatRoomId,
      "userid": userid,
      "friendpic": profilepic
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Chat(
                  chatRoomId: chatRoomId,
                  userName: userName,
                  to: userid,
                  friendpic: profilepic,
                )));
  }

  Widget userTile(
      String userName, String userEmail, String profilepic, String userid) {
    return Column(
      children: <Widget>[
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
          child: Row(
            children: [
              CircleAvatar(
                  radius: 30,
                  child: Image(
                      image: NetworkImage(profilepic.toString()),
                      fit: BoxFit.fill)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(userName,
                        //style: TextStyle(color: Colors.black, fontSize: 18),
                        style: TextStyle(color: Color(words))),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(4.0),
                  //   child: Text(
                  //     userid,
                  //     style: TextStyle(color: Colors.black, fontSize: 7),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(userEmail,
                        //: TextStyle(color: Colors.black, fontSize: 12),
                        style: TextStyle(color: Color(words))),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  print(userid);
                  sendMessage(userName, userid, profilepic);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  child: Center(
                    child: Text(
                      "Message",
                      style: TextStyle(color: Color(0xFF6F35A5), fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    getmode();
    super.initState();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        // showMessage("Notification", "$message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        // showMessage("Notification", "$message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        // showMessage("Notification", "$message");
      },
    );

    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: false),
      );
    }
  }

  showMessage(title, description) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Dismiss"),
              )
            ],
          );
        });
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
                  padding: const EdgeInsets.only(top: 48.0),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Search user name",
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(words),
                              fontFamily: "Dancing",
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ])),
        ),
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // color: Color(0xFF9B9090),
                              decoration: BoxDecoration(
                                  // color: Color(back),
                                  color: Color(0xFF9B9090),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3))
                                  ]),
                              child: TextField(
                                controller: searchEditingController,
                                style: TextStyle(
                                    color: Color(words),
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    hintText: "search username ...",
                                    hintStyle: TextStyle(
                                      color: Color(words),
                                      fontSize: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(words)),
                                    )),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                initiateSearch();
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [Colors.white, Colors.white],
                                        begin: FractionalOffset.topLeft,
                                        end: FractionalOffset.bottomRight),
                                    borderRadius: BorderRadius.circular(40)),
                                padding: EdgeInsets.all(12),
                                child: Icon(
                                  Icons.search,
                                  color: Color(0xFF6F35A5),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  userList(),
                ],
              ),
            ),
    );
  }
}

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

int words, back;

class _UserScreenState extends State<UserScreen> {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  List<DocumentSnapshot> users;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  /// 1.create a chatroom, send user to the chatroom, other userdetails
  sendMessage(String userName, var userid, String profilepic) {
    List<String> users = [Constants.myName, userName];

    String chatRoomId = getChatRoomId(Constants.myName, userName);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId": chatRoomId,
      "userid": userid,
      "friendpic": profilepic
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Chat(
                  chatRoomId: chatRoomId,
                  userName: userName,
                  to: userid,
                  friendpic: profilepic,
                )));
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    fetchUsers();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showMessage("Notification", "$message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        showMessage("Notification", "$message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        showMessage("Notification", "$message");
      },
    );

    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: false),
      );
    }

    super.initState();
  }

  fetchUsers() async {
    QuerySnapshot snapshot = await db.collection("userstoken").get();
    SharedPreferences preferences = await SharedPreferences.getInstance();

    setState(() {
      users = snapshot.docs;
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
  }

  showMessage(title, description) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(
              title,
            ),
            content: Text(
              description,
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Dismiss"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  padding: const EdgeInsets.only(top: 38.0),
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
              ])),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Search()));
          },
          backgroundColor: Color(0xFF6510BB)),
      body: Container(
        child: users != null
            ? ListView.builder(
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 8),
                    child: Container(
                      child: ListTile(
                          leading: ClipOval(
                              // radius: 30,
                              child: Image(
                                  image: NetworkImage(users[index]
                                      .data()["profilepic"]
                                      .toString()),
                                  fit: BoxFit.fill)),
                          title: Text(
                              users[index].data()["username"].toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Color(words))),
                          subtitle: Text(users[index].data()["email"],
                              style:
                                  TextStyle(fontSize: 10, color: Color(words))),
                          trailing: GestureDetector(
                            onTap: () {
                              //print(userid);
                              sendMessage(
                                  users[index].data()["username"],
                                  users[index].data()["userid"],
                                  users[index].data()["profilepic"]);
                            },
                            child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3))
                                  ]),
                              child: Center(
                                child: Text(
                                  "Message",
                                  style: TextStyle(
                                      color: Color(0xFF6F35A5), fontSize: 16),
                                ),
                              ),
                            ),
                          )),
                    ),
                  );
                },
                itemCount: users.length,
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}

//notification screen

class NotificationScreen extends StatefulWidget {
  final DocumentSnapshot to;

  NotificationScreen({
    @required this.to,
  });

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  TextEditingController _messageController = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    User u = await auth.currentUser;
    setState(() {
      user = u;
    });
  }

  handleInput(String input) {
    print(input);

    db
        .collection("userstoken")
        .doc(widget.to.id)
        .collection("notifications")
        .add({
      "message": input,
      "title": user.email,
      "date": FieldValue.serverTimestamp()
    }).then((doc) {
      _messageController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.to.data()["email"]),
      ),
      body: Container(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Flexible(
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: "Write message here",
                  ),
                  textInputAction: TextInputAction.send,
                  onSubmitted: handleInput(_messageController.text),
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  handleInput(_messageController.text);
                },
                child: Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
    );
  }
}
