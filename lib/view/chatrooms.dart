

import 'package:Academicmaster/firstslide.dart';
import 'package:Academicmaster/view/chat.dart';

import 'package:Academicmaster/view/helper/authnicate.dart';
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/helper/helperfunction.dart';
import 'package:Academicmaster/view/helper/theme.dart';
import 'package:Academicmaster/view/search.dart';
import 'package:Academicmaster/view/viewservices/auth.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:Academicmaster/view/widgets/widget.dart';
import "dart:io";
import "package:flutter/material.dart";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";


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
                    userName: snapshot.data.documents[index].data['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(Constants.myName, ""),
                    chatRoomId:
                        snapshot.data.documents[index].data["chatRoomId"],
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
    super.initState();
  }


   getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      currentuserid = uid.toString();
    });
  }


 offline() async{

    await Firestore.instance.collection("onlinestatus").document(currentuserid).updateData({

      "online":"offline"

    });

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
<<<<<<< HEAD
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
          backgroundColor: Colors.white,
          appBar: AppBar(
            
            flexibleSpace: Image(image: AssetImage("images/livechat.jpg"),
            fit: BoxFit.cover,),
   

      centerTitle: true,
      // actions: [
      //   GestureDetector(
      //     onTap: () {
      //       AuthService().signOut();
      //       Navigator.pushReplacement(context,
      //           MaterialPageRoute(builder: (context) => Authenticate()));
      //     },
      //     child: Container(
      //         padding: EdgeInsets.symmetric(horizontal: 16),
      //         child: Icon(Icons.exit_to_app,color: Colors.brown,)),
      //   ),
      // ],
          ),
          body: Container(
            
      child: chatRoomsList(),
          ),
          floatingActionButton: FloatingActionButton(
      child: Icon(Icons.search,color: Colors.black,),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search()));
        },
        backgroundColor: Color(0xff605959),  ),
        ),
    );
=======
    return Scaffold(
      
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          flexibleSpace: Image(image: AssetImage("images/download 11.jpg"),
          fit: BoxFit.cover,),
    title: Text(
      "yourfriends",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: "Dancing",
        fontSize: 30,
        color: Colors.brown
      ),
    ),

    centerTitle: true,
    actions: [
      GestureDetector(
        onTap: () {
          AuthService().signOut();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Authenticate()));
        },
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.exit_to_app,color: Colors.brown,)),
      ),
    ],
        ),
        body: Container(
    child: chatRoomsList(),
        ),
        floatingActionButton: FloatingActionButton(
    child: Icon(Icons.search,color: Colors.orange,),
    onPressed: () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Search()));
      },
      backgroundColor: Color(0xff605959),  ),
      );
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;

  ChatRoomsTile({this.userName, @required this.chatRoomId});

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
                    )));
      },
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 30,
                  child: CircleAvatar(
                      backgroundImage: AssetImage("images/thirdgif3.gif")),
                ),
               
                SizedBox(
                  width: 12,
                ),
                Text(userName,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 35,
                        fontFamily: 'Dancing',
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}





