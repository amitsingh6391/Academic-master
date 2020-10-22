import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import "package:flutter/material.dart";
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:intl/intl.dart';

import 'package:link_text/link_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

String name = " ";
int back, words;

class Comment extends StatefulWidget {
  String postid, posturl, description;
  Comment(
      {@required this.postid,
      @required this.posturl,
      @required this.description});
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  DateTime now = DateTime.now();

  Stream<QuerySnapshot> comment;
  TextEditingController messageEditingController = new TextEditingController();

  final _controller = ScrollController();

  Widget chatMessages() {
    return StreamBuilder(
      stream: comment,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                controller: _controller,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Commenttile(
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

  addcomment() async {
    if (messageEditingController.text.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection("postcomment")
          .doc(widget.postid)
          .collection("particularpost")
          .add({
        "Sendby": name,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        "msgtime": DateFormat("MM-dd - kk:mm").format(now)
      });

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  getname() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences preferences = await SharedPreferences.getInstance();
    name = preferences.getString('name');
    print("------------*********** $name ");
    back = preferences.getInt('back');
    words = preferences.getInt('words');
  }

  @override
  void initState() {
    postcomment(widget.postid).then((val) {
      setState(() {
        comment = val;
      });
    });
    print(widget.postid);

    getname();
    super.initState();
  }

  postcomment(String postid) async {
    return FirebaseFirestore.instance
        .collection("postcomment")
        .doc(postid)
        .collection("particularpost")
        .orderBy("time")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1),
        () => _controller.jumpTo(_controller.position.maxScrollExtent));

    return Scaffold(
      backgroundColor: Color(back),
      // resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text("Comments",
                      style: TextStyle(color: Color(words), fontSize: 25))),
            ),
            color: Color(0xFF272424),
          ),
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
                    SizedBox(width: 5),
                    Expanded(
                      child: TextField(
                        controller: messageEditingController,
                        style: TextStyle(color: Color(words)),
                        decoration: InputDecoration(
                            hintText: "ask any query ...",
                            hintStyle: TextStyle(
                              color: Color(words),
                              fontSize: 16,
                            ),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(width: 12.0),
                    GestureDetector(
                      onTap: () {
                        addcomment();
                        messageEditingController.clear();
                      },
                      child: Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50)),
                        child: Center(
                            child: Icon(Icons.send, color: Color(0xff203152))),
                      ),
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

class Commenttile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final String msgtime;
  final String username;

  Commenttile(
      {@required this.message,
      @required this.sendByMe,
      @required this.username,
      @required this.msgtime});

  Widget data(BuildContext context) {
    if (message.contains(".pdf")) {
      return Container(
          child: Container(
              color: Colors.greenAccent,
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.2,
              child: Column(
                children: [
                  Text(username,
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.none,
                      )),
                  Expanded(
                    child:
                        Container(color: Colors.blue, child: Text("PDF File")),
                  ),
                ],
              )));
    } else {
      return Container(
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
          color: sendByMe ? Color(back) : Color(back),
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
                  color: Color(words),
                  decoration: TextDecoration.none,
                  letterSpacing: -0.5),
            ),
            SizedBox(height: 7.0),
            LinkText(
                text: message,
                textAlign: TextAlign.start,
                textStyle: TextStyle(
                  fontSize: 15.0,
                  color: Color(words),
                  decoration: TextDecoration.none,
                )),
            Row(children: [
              SizedBox(width: 200),
              Text(username.toString(),
                  style: TextStyle(
                      color: Color(words),
                      decoration: TextDecoration.none,
                      fontSize: 10))
            ])
          ],
        ),
      );
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
