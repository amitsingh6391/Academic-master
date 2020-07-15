import 'dart:io';
import 'dart:typed_data';
import 'package:Academicmaster/services/admob_service.dart';
import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';

import "package:flutter/material.dart";

import "package:cached_network_image/cached_network_image.dart";

import 'package:url_launcher/url_launcher.dart';
import "package:link_text/link_text.dart";

import 'addcourse.dart';

Color x = Colors.white;
Color textcolor = Colors.black;

class FreecoursePage extends StatefulWidget {
  @override
  _FreecoursePageState createState() => _FreecoursePageState();
}

class _FreecoursePageState extends State<FreecoursePage> {
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
    crudMethods.getfreecourseData().then((result) {
      setState(() {
        blogsStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      },
      child: Scaffold(

          //define a button to select the ne w post
          backgroundColor: x,
          floatingActionButton: FloatingActionButton(
            tooltip: "upload a new ece contents",
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateBlog()));
            },
          ),
          appBar: AppBar(
            title: Text(
              "Free Coupens for Paid Courses",
              style: TextStyle(
                color: Colors.black,
                  fontSize: 23,
                  fontFamily: "Dancing",
                  fontWeight: FontWeight.bold),
            ),
            flexibleSpace: Image(
              image: AssetImage("images/triangle-green-and-yellow-gradient-banner-vector-16145264.jpg"),
              fit:BoxFit.cover,
            ),
            // leading: IconButton(
            //       icon: Icon(Icons.cancel, color: Colors.white, size: 50),
            //       onPressed: () {
            //         exit(0);
            //       }),
            actions: <Widget>[
              GestureDetector(
                  onTap: () {
                    setState(() {
                      x = Colors.white;
                      textcolor = Colors.black;
                    });
                  },
                  child: Icon(
                    Icons.brightness_2,
                    color: Colors.white,
                    size: 40,
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      x = Colors.black;
                      textcolor = Colors.white;
                    });
                  },
                  child: Icon(
                    Icons.brightness_4,
                    color: Colors.black,
                    size: 40,
                  ))
            ],
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
                                return BlogsTile(
                                  authorName: snapshot
                                      .data.documents[index].data['authorName'],
                                  title: snapshot
                                      .data.documents[index].data["title"],
                                  description: snapshot
                                      .data.documents[index].data['desc'],
                                  imgUrl: snapshot
                                      .data.documents[index].data['imgUrl'],
                                  iconUrl: snapshot
                                      .data.documents[index].data['iconUrl'],
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
          )),
    );
  }
}

class BlogsTile extends StatefulWidget {
  String title, description, imgUrl, iconUrl, authorName;

  BlogsTile(
      {@required this.imgUrl,
      @required this.iconUrl,
      @required this.title,
      @required this.description,
      @required this.authorName});

  @override
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
  BuildContext context;

  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController commentsEditingController = new TextEditingController();

  QuerySnapshot searchResultSnapshot;

  CrudMethods crudMethods = new CrudMethods();

  launchurl() async {
    const url = "https://abesit.in/library/question-paper-bank/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " could not launch $url";
    }
  }

  final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 30),

      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),

      height: 440,
      //color: Colors.red,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(children: [
              ClipOval(
                  child: CachedNetworkImage(
                      imageUrl: widget.iconUrl,
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover)),
              SizedBox(width: 10),
              Text(widget.authorName,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Dancing",
                      color: textcolor))
            ] // fontWeight: FontWeight
                ),
          ),
          Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            child: LinkText(
              text: widget.title,
              textStyle: TextStyle(
                  fontSize: 17,
                  //fontWeight: FontWeight.w500,
                  color: textcolor),
            ),
          ),
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
                imageUrl: widget.imgUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill),
          ),
          Container(
            // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40)),
                  //color:Colors.red,
                  child: IconButton(
                    tooltip: "share post with your friends",
                    icon: Icon(
                      Icons.share,
                    ),
                    //color: Colors.white,
                    iconSize: 30,
                    onPressed: () async =>
                        await _shareImageFromUrl(widget.imgUrl),
                  ),
                ),
              ],
            ),
          ),
          // AdmobBanner(
          //     adUnitId: "ca-app-pub-5023637575934146/4028634600",
          //     adSize: AdmobBannerSize.BANNER),
        ],
      ),
    );
  }

  Future<void> _shareImageFromUrl(String imgURL) async {
    try {
      var request = await HttpClient().getUrl(Uri.parse(imgURL));
      var response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      await Share.file('Academic master', 'amlog.jpg', bytes, 'image/jpg');
    } catch (e) {
      print('error: $e');
    }
  }
}
