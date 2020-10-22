import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:Academicmaster/notesandquantum/firstyearsubject.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import "package:Academicmaster/services/admob_service.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Dpharma2yearsubject extends StatefulWidget {
  @override
  _Dpharma2yearsubjectState createState() => _Dpharma2yearsubjectState();
}

class _Dpharma2yearsubjectState extends State<Dpharma2yearsubject> {
  String dropdownValue = 'unit1';
  // final ams = AdMobService(); //call admobclass from services

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
          backgroundColor: Color(0xFF6F35A5),
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
                        .collection("Dpharma2yearnotes")
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

class Dpharma2yearpaper extends StatefulWidget {
  @override
  _Dpharma2yearpaperState createState() => _Dpharma2yearpaperState();
}

class _Dpharma2yearpaperState extends State<Dpharma2yearpaper> {
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
          backgroundColor: Color(0xFF6F35A5),
          title: Text(
            "Previous Paper",
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
                      .collection("Dpharma2paper")
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
