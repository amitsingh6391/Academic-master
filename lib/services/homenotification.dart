import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:link_text/link_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

int back, words;

class Usernotification extends StatefulWidget {
  @override
  _UsernotificationState createState() => _UsernotificationState();
}

class _UsernotificationState extends State<Usernotification> {
  @override
  void initState() {
    // TODO: implement initState
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
                color: Color(back),
                height: 300,
                width: 100,
                child: Center(
                    child: Text("Notification",
                        style: TextStyle(color: Color(words), fontSize: 20)))),
          ),
        ),
        floatingActionButton: GestureDetector(
            onTap: () {
              setState(() {
                print("refersh");
              });
            },
            child: Icon(Icons.refresh, size: 40, color: Colors.purple)),
        body: EasyRefresh(
          onRefresh: () {
            setState(() {
              print("refresh");
            });
          },
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("usernotification")
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                      child: Text("You did not Recive any Notification"));
                }
                return ListView.builder(
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: snapshot.data.documents.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(right: 30),
                            padding: EdgeInsets.only(
                                top: 17, bottom: 17, left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(23),
                                    topRight: Radius.circular(23),
                                    bottomLeft: Radius.circular(23)),
                                color: Color(back),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 5,
                                      blurRadius: 4,
                                      offset: Offset(0, 3))
                                ]),
                            child: LinkText(
                              text:
                                  snapshot.data.documents[index].data()["msg"],
                              textStyle: TextStyle(
                                fontSize: 17,
                                color: Color(words),
                                fontFamily: "Dancing",
                              ),
                            ),
                          ),
                          Text(snapshot.data.documents[index].data()["time"],
                              style: TextStyle(color: Color(words))),
                        ]),
                      );
                    });
              }),
        ));
  }
}
