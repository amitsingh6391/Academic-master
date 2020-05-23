import 'package:Academicmaster/pages/commentspage.dart';
import 'package:Academicmaster/pages/createpost.dart';
import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import "package:flutter/material.dart";

import "package:cached_network_image/cached_network_image.dart";
import "commentspage.dart";



class HomPage extends StatefulWidget {
  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  CrudMethods crudMethods = new CrudMethods();

  Stream blogsStream;

  //now we are declare code section here

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  String x;

  @override
  void initState() {
    crudMethods.getData().then((result) {
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

    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.green,
      child: Icon(Icons.add_a_photo),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CreateBlog()));
      },
    ),
    appBar: AppBar(
      backgroundColor: Colors.green,
      title: Text(
        "explore information",
        style: TextStyle(
            fontSize: 30,
            fontFamily: "Dancing",
            fontWeight: FontWeight.bold),
      ),
      actions: <Widget>[
        Icon(
          Icons.school,
          size: 50,
          color: Colors.red,
        ),
      ],
    ),
    body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.black],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: blogsStream != null
            ? Column(
                children: <Widget>[
                  StreamBuilder(
                    stream: blogsStream,
                    builder: (context, snapshot) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return BlogsTile(
                              authorName: snapshot.data.documents[index]
                                  .data['authorName'],
                              title: snapshot
                                  .data.documents[index].data["title"],
                              description: snapshot
                                  .data.documents[index].data['desc'],
                              imgUrl: snapshot
                                  .data.documents[index].data['imgUrl'],
                             
                              
                            );
                          });
                    },
                  ),

                  
                ],
              )
            : Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
      ),
    ],
        ),
      ));
  }
}

class BlogsTile extends StatelessWidget {
  String imgUrl, title, description, authorName;

  BuildContext context;
  BlogsTile(
      {@required this.imgUrl,
      @required this.title,
      @required this.description,
      @required this.authorName});

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  CrudMethods crudMethods = new CrudMethods();

  //add comments in database

  addcomment() async {
    if (commentsEditingController.text.isNotEmpty) {
      Map<String, dynamic> postcomments = {
        "comments_by": Constants.myName,
        "comments": commentsEditingController.text,
        'time': DateTime.now().toLocal()
      };

      crudMethods.addcomments(postcomments).then((result) {});
      //Navigator.push(context,MaterialPageRoute(builder:(context)=>Comments()));
    } else {
      print("no data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 30),

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),

        height: 960,
        //color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Column(
    children: <Widget>[
      Container(
        height: 550,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
        height: 50,
        child: Text(
          "tags.. $title",
          //textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Dancing",
              color: Colors.white),
        ),
      ),
      Container(
        height: 50,
        child: Text(
          "postby..  $authorName",
          // textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Dancing",
              color: Colors.white),
        ),
      ),
      Container(
        height: 100,
        child: Text(
          "Captions:  $description",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              fontFamily: "Dancing",
              color: Colors.white),
        ),
      ),

     // for comments only
      // SizedBox(
      //   height: 10,
      // ),
      // Container(
      //   height: 40,
      //   color: Colors.black,
      //   child: Expanded(
      //     child: Row(
      //       children: <Widget>[
      //       IconButton(
      //           icon: Icon(
      //             Icons.thumb_up,
      //             color: Colors.blue,
      //             size: 42,
      //           ),
      //           tooltip: "thanks for likemy post ...$authorName"),
      //         SizedBox(
      //           width: 10,
      //         ),
      //         IconButton(
      //           icon: Icon(
      //             Icons.thumb_down,
      //             color: Colors.red,
      //             size: 42,
      //           ),
      //           tooltip: "we try better next time $authorName",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      SizedBox(
        height: 10,
      ),

      Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Colors.green,
            ]),
            borderRadius: BorderRadius.circular(30)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: commentsEditingController,
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    hintText: "Do comments ...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    )),
              ),
            ),
            GestureDetector(
              onTap: () {
                addcomment();
                Navigator.push(context,
                    MaterialPageRoute(builder: (conetxt) => Comments()));
              },
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Colors.pink,
                          Colors.yellow,
                        ],
                        begin: FractionalOffset.topLeft,
                        end: FractionalOffset.bottomRight),
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.all(12),
                child: Icon(Icons.send),
              ),
            )
          ],
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 20,
        color: Colors.white,
      )
    ],
        ),
      );
  }
}
