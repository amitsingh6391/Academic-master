import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:Academicmaster/services/admob_service.dart';
import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/viewservices/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';

import "package:flutter/material.dart";

import "package:cached_network_image/cached_network_image.dart";

import 'package:url_launcher/url_launcher.dart';
import "package:link_text/link_text.dart";

Color x = Colors.white;
Color textcolor = Colors.black;

class Mechnical2yearPage extends StatefulWidget {
  @override
  _Mechnical2yearPageState createState() => _Mechnical2yearPageState();
}

class _Mechnical2yearPageState extends State<Mechnical2yearPage> {
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
    crudMethods.getmechnical2yearData().then((result) {
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
                                  .data()['subjectname'],
                              link: snapshot.data.documents[index]
                                  .data()['title'],
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
                    style: TextStyle(fontSize: 16, color: Color(0xF816111B)),
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
                          color: Color(0xFF50DF0E), size: 20))
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
