import 'package:Academicmaster/notesandquantum/thirdyearsubject.dart';

import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/viewservices/database.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import "package:flutter/material.dart";

class CivilsecondyearPage extends StatefulWidget {
  @override
  _CivilsecondyearPageState createState() => _CivilsecondyearPageState();
}

class _CivilsecondyearPageState extends State<CivilsecondyearPage> {
  CrudMethods crudMethods = new CrudMethods();

  Stream blogsStream;

  //now we are declare code section here

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  @override
  void initState() {
    crudMethods.getcivil2yearData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6F35A5),
        title: Text(
          "Get Civil contents",
          style: TextStyle(
              fontSize: 23, fontFamily: "Dancing", fontWeight: FontWeight.bold),
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
