import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:Academicmaster/view/chat.dart';

import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

String name = " ";

int back, words;

class Btechchat extends StatefulWidget {
  @override
  _BtechchatState createState() => _BtechchatState();
}

class _BtechchatState extends State<Btechchat> {
  DateTime now = DateTime.now();

  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  final _controller = ScrollController();
  String load = "no";

  var value;

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Future<void> sendNotification(subject, title) async {
    final postUrl = 'https://fcm.googleapis.com/fcm/send';

    String toParams = "/topics/" + 'btech';

    print("messageaarhahi");
    print("This is subject ****** $subject  and this one title *********88  $title");

    final data = {
      "notification": {"body": subject, "title": name},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
        "sound": 'default',
        "screen": "news",
      },
      "to": "$toParams"
    };

    final headers = {
      'content-type': 'application/json',
      'Authorization':
          'key=AAAA7tIyIjU:APA91bFhv4HnqTdM3x9eMln2DJxmqKAFy2fp2op2TuawcorZITqTVdTpI79yz5-TJetNinhbvU4MlvOvxorkmn355DSzAc0Ss8DMSSR83_hXoNjnaq5wH6ZNdRpPo4f7560YBHnAsUOo'
    };

    final response = await http.post(postUrl,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
// on success do
      print("true");
    } else {
// on failure do
      print(response.statusCode);
      print("nhi");
      print("false");
    }
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
    String fileName = '$randomName.png';
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
    String fileName = '$randomName.pdf';
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
      "Sendby": name,
      'time': DateTime.now().millisecondsSinceEpoch,
      "msgtime": DateFormat("MM-dd - kk:mm").format(now),
    };

    FirebaseFirestore.instance.collection("btechchat").add(data).then((value) {
      setState(() {
        load = "no";
      });
      Navigator.pop(context);
    });
  }

  Widget chatMessages() {
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                controller: _controller,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      message: snapshot.data.documents[index].data()["message"],
                      sendByMe: name ==
                          snapshot.data.documents[index].data()["Sendby"],
                      username: snapshot.data.documents[index].data()["Sendby"],
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
        "Sendby": name,
        "message": messageEditingController.text,
        'time': DateTime.now(),
        "msgtime": DateFormat("MM-dd - kk:mm").format(now)
      };

      DatabaseMethods().addbtechMessage(chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  getname() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
    back = preferences.getInt("back");
    words = preferences.getInt("words");
  }

  @override
  void initState() {
    //  getCurrentUser();
    DatabaseMethods().chats("btechchat").then((val) {
      setState(() {
        chats = val;
      });
    });

    getname();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1),
        () => _controller.jumpTo(_controller.position.maxScrollExtent));

    return Scaffold(
        backgroundColor: Color(back),
        body: Column(
          // Column(

          children: [
            Container(
                color: Color(back),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Row(children: [
                      CircleAvatar(
                        radius: 29,
                        backgroundImage: AssetImage("images/btech.png"),
                      ),
                      SizedBox(width: 15),
                      Column(children: [
                        Text(
                          "B.Tech Offcial",
                          style: TextStyle(
                            fontSize: 20, color: Color(words),
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "(Desc: This group for B.tech,don't send any spam )",
                          style: TextStyle(
                            fontSize: 10, color: Color(words),
                            // fontWeight: FontWeight.bold
                          ),
                        ),
                      ]),
                      load == "yes" ? CircularProgressIndicator() : Text(" ")
                    ]),
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
                          int members = data["members"];

                          return Container(
                              child: Text(
                            "Total Members : $members",
                            style: TextStyle(color: Color(words)),
                          ));
                        })
                  ],
                )),
            Expanded(child: chatMessages()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                  color: Color(0xFF272424),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.attachment_outlined,
                            color: Colors.white),
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
                          style: TextStyle(color: Colors.amber),
                          decoration: InputDecoration(
                              hintText: "Send a message ...",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      GestureDetector(
                        onTap: () {
                          addMessage();
                          _firebaseMessaging.subscribeToTopic("btech");
                          sendNotification(value, "title");
                        },
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50)),
                          child: Center(
                              child: Icon(Icons.send, color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
          //),
        ));
  }
}
