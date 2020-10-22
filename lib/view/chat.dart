import 'dart:convert';
import 'dart:math';

import 'package:Academicmaster/view/viewservices/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import "package:intl/intl.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import "package:http/http.dart" as http;

String name = "";
int words, back;

Color backgroundcolor = Colors.white;
Color textcolor = Colors.black;

class Chat extends StatefulWidget {
  final String chatRoomId;
  final String userName;

  final String to;

  final String friendpic;

  Chat(
      {this.chatRoomId,
      this.userName,
      @required this.to,
      @required this.friendpic});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;
  User user;

  DateTime now = DateTime.now();

  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  final _controller = ScrollController();
  String load = "no";

  fetchUser() async {
    User u = await auth.currentUser;
    setState(() {
      user = u;
    });
  }

  String value = "";
  handleInput(String input) {
    print("hiii");
    print("mai input");
    print(input);

    db.collection("userstoken").doc(widget.to).collection("notifications").add({
      "message": input,
      "title": user.email,
      "date": FieldValue.serverTimestamp()
    }).then((doc) {
      // messageEditingController.clear();
    });
  }

  showAttachmentBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Image'),
                    onTap: () {
                      setState(() {
                        load = "yes";
                        print(load);
                      });
                      getimageAndUpload();
                    }),
                ListTile(
                    leading: Icon(Icons.videocam),
                    title: Text('Video'),
                    onTap: () {
                      // getvideoAndUpload();
                      setState(() {
                        load = "yes";
                      });
                      getPdfAndUpload();
                    }),
                ListTile(
                  leading: Icon(Icons.insert_drive_file),
                  title: Text('File'),
                  onTap: () {
                    setState(() {
                      load = "yes";
                    });
                    getPdfAndUpload();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future getimageAndUpload() async {
    var rng = new Random();

    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(
      type: FileType.any,
    );
    String fileName = '${randomName}.png';
    print(fileName);
    print('${file.readAsBytesSync()}');
    saveMedia(file.readAsBytesSync(), fileName);
    setState(() {
      load = "yes";
      print(load);
    });
  }

  Future getPdfAndUpload() async {
    var rng = new Random();
    String randomName = "";
    for (var i = 0; i < 20; i++) {
      print(rng.nextInt(100));
      randomName += rng.nextInt(100).toString();
    }
    File file = await FilePicker.getFile(
      type: FileType.any,
    );
    String fileName = '${randomName}.pdf';
    print(fileName);
    print('${file.readAsBytesSync()}');
    saveMedia(file.readAsBytesSync(), fileName);
  }

  Future saveMedia(List<int> asset, String name) async {
    StorageReference reference = FirebaseStorage.instance.ref().child(name);
    StorageUploadTask uploadTask = reference.putData(asset);
    String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    print(url);
    documentFileUpload(url);
    return url;
  }

  void documentFileUpload(String str) {
    var data = {
      "message": str,
      "sendby": name,
      'time': DateTime.now().millisecondsSinceEpoch,
      "msgtime": DateFormat("MM-dd - kk:mm").format(now),
    };

    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(widget.chatRoomId)
        .collection("chats")
        .add(data)
        .then((value) {
      setState(() {
        load = "no";
      });
      Navigator.pop(context);
    });
  }

  getname() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('name');
      back = preferences.getInt("back");
      words = preferences.getInt("words");
    });
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      message: snapshot.data.documents[index].data()["message"],
                      sendByMe: name ==
                          snapshot.data.documents[index].data()["sendby"],
                      username: snapshot.data.documents[index].data()["sendby"],
                      msgtime:
                          snapshot.data.documents[index].data()["msgtime"]);
                })
            : Container();
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendby": name,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        "msgtime": DateFormat("MM-dd - kk:mm").format(now)
      };

      DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    fetchUser();
    getname();
    DatabaseMethods().getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,

      backgroundColor: Color(back),

      appBar: AppBar(
        backgroundColor: Color(back),
        leading: ClipOval(child: Image(image: NetworkImage(widget.friendpic))),
        title: Text(
          widget.userName,
          style: TextStyle(fontSize: 22, fontFamily: "Dancing"),
        ),
        actions: <Widget>[
          SizedBox(width: 50),
          load == "yes" ? CircularProgressIndicator() : Text(" "),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: chatMessages()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                color: Color(0xFF272424),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.attachment_outlined, color: Color(words)),
                      tooltip: "Select file or image from phone",
                      onPressed: () {
                        showAttachmentBottomSheet(context);
                      },
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        onChanged: (text) {
                          setState(() {
                            value = text;
                          });
                        },
                        controller: messageEditingController,
                        style: TextStyle(color: Color(words)),
                        decoration: InputDecoration(
                            hintText: "Send a message ...",
                            hintStyle: TextStyle(
                              color: Color(words),
                              fontSize: 16,
                            ),
                            border: InputBorder.none),
                        // onSubmitted: handleInput(messageEditingController.text),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    FloatingActionButton(
                      onPressed: () {
                        addMessage();
                        handleInput(value);
                      },
                      child: Icon(Icons.send, color: Color(words)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
        //),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final String msgtime;
  final String username;

  MessageTile(
      {@required this.message,
      @required this.sendByMe,
      @required this.username,
      @required this.msgtime});

  Widget data(BuildContext context) {
    if (message.contains(".pdf")) {
      return Container(
          child: Container(
              // color: Colors.greenAccent,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                children: [
                  Image(
                      image: AssetImage("images/pdfimage.jpg"),
                      fit: BoxFit.fill),
                  IconButton(
                    onPressed: () async {
                      if (await canLaunch(message)) {
                        await launch(message);
                      } else {
                        throw "Could not download";
                      }
                    },
                    icon: Icon(Icons.download_sharp,
                        color: Color(0xFF006400), size: 50),
                  ),
                  SizedBox(height: 5),
                  Container(
                      child: Row(children: [
                    Text(username.toString(), style: TextStyle(fontSize: 10)),
                    SizedBox(width: 5),
                    Text(msgtime.toString(), style: TextStyle(fontSize: 10))
                  ]))
                ],
              )));
    } else if (message.contains(".png")) {
      return Card(
        elevation: 10,
        child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Column(children: [
              sendByMe
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.topRight,
                      child: Column(children: [
                        Image(
                          image: NetworkImage(message),
                          fit: BoxFit.fill,
                        ),
                        Row(children: [
                          Text(username.toString()),
                          SizedBox(width: 5),
                          Text(msgtime.toString())
                        ])
                      ]),
                    )
                  : Container(
                      width: MediaQuery.of(context).size.width * 0.75,
                      alignment: Alignment.topLeft,
                      child: Column(children: [
                        Image(
                          image: NetworkImage(message),
                          fit: BoxFit.fill,
                        ),
                        Row(children: [
                          Text(username.toString()),
                          SizedBox(width: 5),
                          Text(msgtime.toString())
                        ])
                      ])),
            ])),
      );
    } else {
      return Column(children: [
        Container(
          margin:
              sendByMe ? EdgeInsets.only(left: 30) : EdgeInsets.only(right: 30),
          padding: EdgeInsets.only(top: 17, bottom: 17, left: 20, right: 20),
          decoration: BoxDecoration(
            borderRadius: sendByMe
                ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23))
                : BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomRight: Radius.circular(23)),
            color: sendByMe ? Colors.yellow : Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3))
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                msgtime.toUpperCase(),
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: -0.5),
              ),
              SizedBox(height: 7.0),
              LinkText(
                  text: message,
                  textAlign: TextAlign.start,
                  textStyle: TextStyle(fontSize: 17.0, color: Colors.black)),
            ],
          ),
        ),
        SizedBox(child: Text(username, style: TextStyle(color: Colors.black)))
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: Colors.lightBlue,
        padding: EdgeInsets.only(
            top: 4,
            bottom: 4,
            left: sendByMe ? 0 : 24,
            right: sendByMe ? 24 : 0),
        alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: data(context));
  }
}
