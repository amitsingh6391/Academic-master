import 'dart:convert';
import 'dart:io';

import 'package:Academicmaster/view/chatrooms.dart';
import 'package:Academicmaster/view/groupchat/bpharmachat.dart';
import 'package:Academicmaster/view/groupchat/btechgroupchat.dart';
import 'package:Academicmaster/view/groupchat/dpharmachat.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import "package:http/http.dart" as http;

int joinnumber = 0;
Stream<QuerySnapshot> members;
Stream<QuerySnapshot> bmembers;
Stream<QuerySnapshot> dmembers;
int back, words;

class Groupchatroom extends StatefulWidget {
  @override
  _GroupchatroomState createState() => _GroupchatroomState();
}

class _GroupchatroomState extends State<Groupchatroom>
    with SingleTickerProviderStateMixin {
  TabController tabcontroller;
  String cuserid;
  @override
  void initState() {
    getmode();

    super.initState();

    tabcontroller = TabController(vsync: this, length: 2);
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
        .doc(cuserid)
        .update({"online": "offline"});
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
          appBar: AppBar(
              backgroundColor: Color(back),
              bottom: TabBar(
                  labelStyle: TextStyle(color: Color(words)),
                  tabs: [
                    Tab(
                      text: "Group Chat",
                    ),
                    Tab(text: "Personal Chat"),
                  ],
                  controller: tabcontroller,
                  indicatorColor: Color(words),
                  indicatorWeight: 5,
                  labelColor: Color(words))),
          body: TabBarView(
            controller: tabcontroller,
            children: <Widget>[Group(), ChatRoom()],
          )),
    );
  }
}

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  String join = "yesjoin";
  String left = "noleft";
  String open = "nopen";
  String totalmem = "yestotal";

  String bjoin = "yesjoin";
  String bleft = "noleft";
  String bopen = "nopen";
  String btotalmem = "yestotal";

  String djoin = "yesjoin";
  String dleft = "noleft";
  String dopen = "nopen";
  String dtotalmem = "yestotal";

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  String name, profilepic;

  @override
  void initState() {
    super.initState();

    groupmember().then((val) {
      setState(() {
        members = val;
      });
    });

    bgroupmember().then((val) {
      setState(() {
        bmembers = val;
      });
    });

    dgroupmember().then((val) {
      setState(() {
        dmembers = val;
      });
    });

    getupdate();
    bgetupdate();
    dgetupdate();
  }

  groupmember() async {
    return FirebaseFirestore.instance
        .collection("groupmember")
        .doc("btech")
        .snapshots();
  }

  bgroupmember() async {
    return FirebaseFirestore.instance
        .collection("groupmember")
        .doc("bpharma")
        .snapshots();
  }

  dgroupmember() async {
    return FirebaseFirestore.instance
        .collection("groupmember")
        .doc("dpharma")
        .snapshots();
  }

  void updatebtechgroupmember(int newmember) async {
    await FirebaseFirestore.instance
        .collection("groupmember")
        .doc("btech")
        .update({"members": newmember, "name": name, "profilepic": profilepic});
  }

  void btechgroupmember() async {
    await FirebaseFirestore.instance
        .collection("chatmember")
        .doc("btech")
        .set({"name": name, "profilepic": profilepic});
  }

  void updatebpharmagroupmember(int newmember) async {
    await FirebaseFirestore.instance
        .collection("chatmember")
        .doc("bpharma")
        .update({"members": newmember, "name": name, "profilepic": profilepic});
  }

  void bpharmagroupmember() async {
    await FirebaseFirestore.instance
        .collection("chatmember")
        .doc("bpharma")
        .update({"name": name, "profilepic": profilepic});
  }

  void updatedpharmagroupmember(int newmember) async {
    await FirebaseFirestore.instance
        .collection("groupmember")
        .doc("dpharma")
        .update({"members": newmember, "name": name, "profilepic": profilepic});
  }

  void dpharmagroupmember() async {
    await FirebaseFirestore.instance
        .collection("groupmember")
        .doc("dpharma")
        .update({"name": name, "profilepic": profilepic});
  }

  Future getupdate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      join = preferences.getString('join');
      print(join);
      left = preferences.getString("left");
      open = preferences.getString("open");
      totalmem = preferences.getString("totalmem");
    });
  }

  Future bgetupdate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      bjoin = preferences.getString('bjoin');

      name = preferences.getString("USERNAMEKEY");
      profilepic = preferences.getString("profilepic");
      print(bjoin);
      bleft = preferences.getString("bleft");
      bopen = preferences.getString("bopen");
      btotalmem = preferences.getString("btotalmem");
    });
  }

  Future dgetupdate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      djoin = preferences.getString('djoin');
      print(djoin);
      dleft = preferences.getString("dleft");
      dopen = preferences.getString("dopen");
      dtotalmem = preferences.getString("dtotalmem");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        //color: Colors.white,
        child: Container(
      color: Color(back),
      child: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              Text(
                "Groups",
                style: TextStyle(fontSize: 15, color: Color(words)),
              ),
            ]),
          ),
          Card(
            color: Color(back),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/btech.png"),
                ),
                SizedBox(width: 10),
                Column(children: [
                  Text(
                    "B.Tech Offcial Group",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(words)),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("groupmember")
                          .doc("btech")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          print("load");
                        }

                        var data = snapshot.data;
                        int st = data["members"];

                        print(st);

                        return Container(
                            // color: Color(back),
                            child: Column(
                          children: [
                            Row(
                              children: [
                                join == "yesjoin"
                                    ? GestureDetector(
                                        onTap: () async {
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setString(
                                              'join', "nojoin");

                                          preferences.setString(
                                              'left', "yesleft");
                                          preferences.setString(
                                            'totalmem',
                                            "nototal",
                                          );
                                          int newmember = st + 1;
                                          updatebtechgroupmember(newmember);
                                          btechgroupmember();

                                          setState(() {
                                            getupdate();
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Join",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          _firebaseMessaging
                                              .unsubscribeFromTopic("btech");
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setString(
                                              'join', "yesjoin");

                                          preferences.setString(
                                              'left', "yesleft");
                                          preferences.setString(
                                            'totalmem',
                                            "yestotal",
                                          );
                                          setState(() {
                                            getupdate();
                                          });
                                          int newmember = st - 1;
                                          updatebtechgroupmember(newmember);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Left",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      ),
                                totalmem == "yestotal"
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Total members: $st",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ))
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 28.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Btechchat()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Open",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      )
                              ],
                            )
                          ],
                        ));
                      }),
                ]),
              ]),
            ),
          ),
          Card(
            color: Color(back),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/bpharma.jpg"),
                ),
                SizedBox(width: 10),
                Column(children: [
                  Text(
                    "B.Pharma Offcial Group",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(words)),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("groupmember")
                          .doc("bpharma")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          print("load");
                        }

                        var data = snapshot.data;
                        int st = data["members"];

                        print(st);

                        return Container(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                bjoin == "yesjoin"
                                    ? GestureDetector(
                                        onTap: () async {
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setString(
                                              'bjoin', "nojoin");

                                          preferences.setString(
                                              'bleft', "yesleft");
                                          preferences.setString(
                                            'btotalmem',
                                            "nototal",
                                          );
                                          int newmember = st + 1;
                                          updatebpharmagroupmember(newmember);
                                          bpharmagroupmember();

                                          setState(() {
                                            bgetupdate();
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Join",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          _firebaseMessaging
                                              .unsubscribeFromTopic("bpharma");
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setString(
                                              'bjoin', "yesjoin");

                                          preferences.setString(
                                              'bleft', "yesleft");
                                          preferences.setString(
                                            'btotalmem',
                                            "yestotal",
                                          );
                                          setState(() {
                                            bgetupdate();
                                          });
                                          int newmember = st - 1;
                                          updatebpharmagroupmember(newmember);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Left",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      ),
                                btotalmem == "yestotal"
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Total members: $st",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ))
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 28.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Bpharma()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Open",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      )
                              ],
                            )
                          ],
                        ));
                      }),
                ])
              ]),
            ),
          ),
          Card(
            color: Color(back),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("images/dpharmapic.jpg"),
                ),
                SizedBox(width: 10),
                Column(children: [
                  Text(
                    "D.Pharma Offcial Group",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(words)),
                  ),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("groupmember")
                          .doc("dpharma")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          print("load");
                        }

                        var data = snapshot.data;
                        int st = data["members"];

                        print(st);

                        return Container(
                            child: Column(
                          children: [
                            Row(
                              children: [
                                djoin == "yesjoin"
                                    ? GestureDetector(
                                        onTap: () async {
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setString(
                                              'djoin', "nojoin");

                                          preferences.setString(
                                              'dleft', "yesleft");
                                          preferences.setString(
                                            'dtotalmem',
                                            "nototal",
                                          );
                                          int newmember = st + 1;
                                          updatedpharmagroupmember(newmember);
                                          dpharmagroupmember();

                                          setState(() {
                                            dgetupdate();
                                          });
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Join",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () async {
                                          _firebaseMessaging
                                              .unsubscribeFromTopic("news");
                                          SharedPreferences preferences =
                                              await SharedPreferences
                                                  .getInstance();
                                          preferences.setString(
                                              'djoin', "yesjoin");

                                          preferences.setString(
                                              'dleft', "yesleft");
                                          preferences.setString(
                                            'dtotalmem',
                                            "yestotal",
                                          );
                                          setState(() {
                                            dgetupdate();
                                          });
                                          int newmember = st - 1;
                                          updatedpharmagroupmember(newmember);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: Text(
                                                  "Left",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              )),
                                        ),
                                      ),
                                dtotalmem == "yestotal"
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Total members: $st",
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ))
                                    : Padding(
                                        padding:
                                            const EdgeInsets.only(left: 28.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Dpharmachat()));
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF6F35A5),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Open",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )),
                                        ),
                                      )
                              ],
                            )
                          ],
                        ));
                      }),
                ])
              ]),
            ),
          ),
          Container(height: 250, color: Color(back))
        ],
      )),
    ));
  }
}
