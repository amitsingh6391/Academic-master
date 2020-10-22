import 'package:Academicmaster/services/admob_service.dart';
import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/viewservices/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';

import "package:flutter/material.dart";

import "package:cached_network_image/cached_network_image.dart";

import 'package:url_launcher/url_launcher.dart';
import "package:link_text/link_text.dart";

import 'mechnical2yearfetchdata.dart';

Color x = Colors.white;
Color textcolor = Colors.black;

class Mechnical3yearPage extends StatefulWidget {
  @override
  _Mechnical3yearPageState createState() => _Mechnical3yearPageState();
}

class _Mechnical3yearPageState extends State<Mechnical3yearPage> {
  CrudMethods crudMethods = new CrudMethods();

  Stream blogsStream;

  //now we are declare code section here

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  // Color x=Colors.white;
  // Color textcolor=Colors.black;
  @override
  void initState() {
    crudMethods.getmechnical3yearData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //define a button to select the ne w post
      backgroundColor: x,

      appBar: AppBar(
        backgroundColor: Color(0xFF6F35A5),
        title: Text(
          "Explore Mechnical contents",
          style: TextStyle(
              fontSize: 20, fontFamily: "Dancing", fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          child: blogsStream != null
              ? Container(
                  child: StreamBuilder(
                    stream: blogsStream,
                    builder: (context, snapshot) {
                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Subjecttile(
                              subjectname: snapshot.data.documents[index]
                                  .data()['authorName'],
                              link: snapshot.data.documents[index]
                                  .data()["title"],
                            );
                          });
                    },
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
