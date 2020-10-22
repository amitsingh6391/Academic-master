import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import "package:Academicmaster/services/admob_service.dart";

//import "package:Academicmaster/thirdAndfourthyearnotesandquantum/thirdAndfourthyearnotes.dart";

import "dart:math";
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Fourthyearsubject extends StatefulWidget {
  @override
  _FourthyearsubjectState createState() => _FourthyearsubjectState();
}

class _FourthyearsubjectState extends State<Fourthyearsubject> {
  String dropdownValue = 'unit1';
  //final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    // Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF4A0FEC),
          title: Text(
            "Subject",
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection("Fourthyearnotes")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading");
                      }
                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Subjecttile(
                              subjectname: snapshot.data.documents[index]
                                  .data()['subjectname'],
                              link:
                                  snapshot.data.documents[index].data()["link"],
                            );
                          });
                    }),
              ),
            ],
          )),
        ));
  }
}

//here we declare all the quantum in firstyear year

class Fourthyearquantum extends StatefulWidget {
  @override
  _FourthyearquantumState createState() => _FourthyearquantumState();
}

class _FourthyearquantumState extends State<Fourthyearquantum> {
  //final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    //Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Important Questions",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Dancing",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Fourthyearquantum")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }
                    return ListView.builder(
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Subjecttile(
                            subjectname: snapshot.data.documents[index]
                                .data()['subjectname'],
                            link: snapshot.data.documents[index].data()["link"],
                          );
                        });
                  }),
            ),
          ]),
        )));
  }
}

class Subjecttile extends StatefulWidget {
  final String subjectname, link;
  Subjecttile({@required this.subjectname, @required this.link});
  @override
  _SubjecttileState createState() => _SubjecttileState();
}

class _SubjecttileState extends State<Subjecttile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFf2f2f2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3))
                  ]),
              child: Row(
                children: <Widget>[
                  Text(
                    widget.subjectname,
                    style: TextStyle(fontSize: 17, color: Color(0xFF441777)),
                  ),
                  SizedBox(width: 5),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: GestureDetector(
                        onTap: () {
                          var x = widget.link;

                          var y = widget.subjectname;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Subjectwebview(link: x, bar: y)));
                        },
                        child: Icon(Icons.arrow_forward, color: Colors.black)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        urllauncher(widget.link);
                      },
                      child: Icon(Icons.file_download,
                          color: Color(0xFF4BD414), size: 20))
                ],
              ),
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

urllauncher(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
