import 'package:Academicmaster/Bcomcourse/selectbcomyear.dart';
import 'package:Academicmaster/Bpharmacourse/selectbpharmyear.dart';
import 'package:Academicmaster/Bsccourse/selectbscyear.dart';
import 'package:Academicmaster/aktuerp.dart';
import 'package:Academicmaster/branch.dart';
import 'package:Academicmaster/freecourse/fetchcourse.dart';

import 'package:Academicmaster/pages/videotutriols.dart';
import 'package:Academicmaster/view/helper/authnicate.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:Academicmaster/pages/commentspage.dart';

import 'package:Academicmaster/pages/createpost.dart';

import 'package:Academicmaster/services/admob_service.dart';

import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:cached_network_image/cached_network_image.dart";

import 'package:gallery_saver/gallery_saver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../firstslide.dart';
import "commentspage.dart";
import "package:link_text/link_text.dart";

import "package:intl/intl.dart";
import 'package:like_button/like_button.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:Academicmaster/services/crud.dart";
import "alluserprofile.dart";

Color x = Colors.white;

Color textcolor = Colors.black;

CrudMethods crudMethods = new CrudMethods();
Color whitescreen = Colors.white;
Color blackscreen = Colors.black;

int newfollower;
String currentuserid;

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

  final ams = AdMobService(); //call admobclass for use fntction

  //call admobclass for use fntction

  @override
  void initState() {
    Admob.initialize(ams.getAdMobAppId());

    crudMethods.getData().then((result) {
      //here i get the blogs..

      setState(() {
        blogsStream = result;
      });
    });
    getCurrentUser();

    super.initState();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      currentuserid = uid.toString();
    });

    onlinestatus();
  }

  onlinestatus() async {
    await Firestore.instance
        .collection("onlinestatus")
        .document(currentuserid)
        .setData({"online": "online"});
  }

  offline() async {
    await Firestore.instance
        .collection("onlinestatus")
        .document(currentuserid)
        .updateData({"online": "offline"});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    InterstitialAd newTripAd =
        ams.getnewTripInterstitial(); //first save in the variablesto use adds

    newTripAd.load();
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
                      offline();
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
          drawer: NavDrawer(),
          backgroundColor: x,
          floatingActionButton: FloatingActionButton(
            tooltip: "upload a new post",
            backgroundColor: Colors.black,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateBlog()));
            },
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                      child: Row(children: [
                    Column(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                x = blackscreen;
                                textcolor = Colors.white;
                              });
                            },
                            child: Icon(Icons.brightness_2, color: Colors.red)),
                        SizedBox(height: 30),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                x = whitescreen;
                                textcolor = Colors.black;
                              });
                            },
                            child: Icon(Icons.brightness_4, color: Colors.red)),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FreecoursePage()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        // width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            shadowColor: Colors.white,
                            elevation: 10,
                            margin: EdgeInsets.all(5),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                // Image(
                                //     image: NetworkImage(
                                //         "http://stat.overdrive.in/wp-content/uploads/2020/04/BMW-R-18-1.jpg")),
                                CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBWqp6yQrYluVo15VJZ2ZI3z2taRZcgB6fTQ&usqp=CAU")),

                                Text(
                                  "Free Courses code",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Dancing"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Videotutorials(
                                      collection: "videotutorials")));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 6,
                          //width: MediaQuery.of(context).size.width / 2,
                          width: size.width * 0.4,
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                                shadowColor: Colors.black,
                                elevation: 10,
                                margin: EdgeInsets.all(5),
                                color: Colors.white,
                                child: Column(
                                  children: <Widget>[
                                    CircleAvatar(
                                        radius: 45,
                                        backgroundImage:
                                            AssetImage("images/video.png")),
                                    Text("Video Courses",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Dancing")),
                                  ],
                                )),
                          ),
                        )),
                   
                   
                    GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Branch()));

                       
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        //width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              margin: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 45,
                                      backgroundImage:AssetImage(
                                          "images/btech.png")),
                                  Text("Btech",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Dancing")),
                                ],
                              )),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bscyear()));

                       
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        //width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              margin: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 45,
                                      backgroundImage:AssetImage(
                                          "images/bse.png")),
                                  Text("Bsc",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Dancing")),
                                ],
                              )),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bpharmyear()));

                       
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        //width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              margin: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 45,
                                      backgroundImage:AssetImage(
                                          "images/bpharma.jpg")),
                                  Text("Bpharma ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Dancing")),
                                ],
                              )),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bcomyear()));

                       
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        //width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              margin: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 45,
                                      backgroundImage:AssetImage(
                                          "images/bcom1.png")),
                                  Text("Bcom ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Dancing")),
                                ],
                              )),
                        ),
                      ),
                    ),
                     GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        var x = "https://aktu.ac.in/";
                        var y = "Aktu Official";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Aktuerp(link: x, bar: y)));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        // width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            shadowColor: Colors.black,
                            elevation: 10,
                            margin: EdgeInsets.all(5),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                    radius: 45,
                                    backgroundImage: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTAWghF0oxKuBiRjJf8jXfLTu1j2mfzA7Mtyg&usqp=CAU")),
                                Text("Aktu Offcial",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Dancing")),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                     GestureDetector(
                      onTap: () {
                        newTripAd.show(
                            //show the full screen adds when second year pressed
                            anchorType: AnchorType.bottom,
                            anchorOffset: 0.0,
                            horizontalCenterOffset: 0.0,
                          );

                        var y =
                            "https://erp.aktu.ac.in/WebPages/OneView/OneView.aspx";
                        var x = "Check Your result";
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Aktuerp(link: y, bar: x)));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 6,
                        //width: MediaQuery.of(context).size.width / 2,
                        width: size.width * 0.4,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                              shadowColor: Colors.black,
                              elevation: 10,
                              margin: EdgeInsets.all(5),
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 45,
                                      backgroundImage: NetworkImage(
                                          "https://akm-img-a-in.tosshub.com/sites/btmt/images/stories/bseb_class_10_result_660_120620033728.jpg")),
                                  Text("Result ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Dancing")),
                                ],
                              )),
                        ),
                      ),
                    ),
                  ])),
                ),

               

                Container(
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection("videoupload")
                          .snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            reverse: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            itemCount: snapshot.data.documents.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              // _updateLike = int.tryParse(
                              //     "${snapshot.data.documents[index].data["like"].toString}");
                              //     print(_updateLike);
                              return Column(
                                children: <Widget>[
                                  Videotile(
                                    // url: "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"
                                    url: snapshot
                                        .data.documents[index].data['url'],

                                    title: snapshot
                                        .data.documents[index].data["title"],
                                  ),
                                ],
                              );
                            });
                      }),
                ),

                AdmobBanner(
            adUnitId:"ca-app-pub-5023637575934146/2815076541",
             adSize: AdmobBannerSize.LEADERBOARD
             ),

                Container(
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
                                    // _updateLike = int.tryParse(
                                    //     "${snapshot.data.documents[index].data["like"].toString}");
                                    //     print(_updateLike);
                                    return Column(
                                      children: <Widget>[
                                        BlogsTile(
                                          authorName: snapshot
                                              .data
                                              .documents[index]
                                              .data['authorName'],
                                          title: snapshot.data.documents[index]
                                              .data["title"],
                                          description: snapshot.data
                                              .documents[index].data['desc'],
                                          imgUrl: snapshot.data.documents[index]
                                              .data['imgUrl'],
                                          iconUrl: snapshot.data
                                              .documents[index].data['iconUrl'],
                                          posttime: snapshot
                                              .data
                                              .documents[index]
                                              .data["posttime"],
                                          postid: snapshot.data.documents[index]
                                              .data["documentID"],
                                          postLike: snapshot.data
                                              .documents[index].data["like"],
                                          disLike: snapshot.data
                                              .documents[index].data["dislike"],
                                          userid: snapshot.data.documents[index]
                                              .data["userid"],
                                        ),
                                      ],
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
              ]),
            ),
          )),
    );
  }
}

class BlogsTile extends StatefulWidget {
  String title,
      description,
      imgUrl,
      iconUrl,
      authorName,
      posttime,
      postid,
      postLike,
      disLike,
      userid;

  BlogsTile({
    @required this.imgUrl,
    @required this.iconUrl,
    @required this.title,
    @required this.description,
    @required this.authorName,
    @required this.posttime,
    @required this.postLike,
    @required this.postid,
    @required this.disLike,
    @required this.userid,
  });

  @override
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
  BuildContext context;

  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController commentsEditingController = new TextEditingController();

  QuerySnapshot searchResultSnapshot;

  CrudMethods crudMethods = new CrudMethods();
  DateTime now = DateTime.now();

  var url;
  passtwouserprofile() {}

  addcomment() async {
    if (commentsEditingController.text.isNotEmpty) {
      Map<String, dynamic> postcomments = {
        "comments_by": Constants.myName,
        "comments": commentsEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
        "commenttime": DateFormat("yyyy-MM-dd - kk:mm").format(now)
      };

      crudMethods.addcomments(postcomments).then((result) {});
      //Navigator.push(context,MaterialPageRoute(builder:(context)=>Comments()));
    } else {
      print("no data");
    }
  }

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

  final dbref = Firestore.instance;
  void updatepost(String newlike) async {
    await dbref.collection("blogs").document(widget.postid).updateData({
      "like": newlike,
      "dislike": widget.disLike,
      "imgUrl": widget.imgUrl,
      "iconUrl": widget.iconUrl,
      "authorName": widget.authorName,
      "title": widget.title,
      "desc": widget.description,
      'time': DateTime.now().millisecondsSinceEpoch,
      "posttime": DateFormat("MM-dd - kk:mm").format(now),
      "documentID": widget.postid
    });

    print("ok");
    print(widget.postid);
  }

//increase foolowers

  void updatefollower(int newfollower) async {
    await dbref.collection("userprofile").document(widget.userid).updateData({
      "follower": newfollower,
    });

    print("ok");
    print(widget.userid);
  }
  //delte data from firestore.....

  //now increase following..

  void updatefollowing(int newfollowing) async {
    await dbref.collection("userprofile").document(currentuserid).updateData({
      "following": newfollowing,
    });

    print("ok");
    print(widget.userid);
  }

  void deletepost() async {
    await Firestore.instance
        .collection("blogs")
        .document(widget.postid)
        .delete();

    print("ok");
    print("delete");
  }

//update for dislike....

  void updatedislike(String newdislike) async {
    await dbref.collection("blogs").document(widget.postid).updateData({
      "like": widget.postLike,
      "dislike": newdislike,
      "imgUrl": widget.imgUrl,
      "iconUrl": widget.iconUrl,
      "authorName": widget.authorName,
      "title": widget.title,
      "desc": widget.description,
      'time': DateTime.now().millisecondsSinceEpoch,
      "posttime": DateFormat("MM-dd - kk:mm").format(now),
      "documentID": widget.postid
    });

    print("ok");
    print(widget.postid);
  }

  Color likecolor = Colors.brown;
  Color dislikecolor = Colors.brown;

  bool follow = false;

  var prefollower;

  var prefollowing;
  var userprofilepic;

  void _showDialog(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Success"),
          content: new Text("Now you are follow him 👌👌"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showDialogwhensame(BuildContext context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Failed"),
          content: new Text(" Sry , you Can't follow Yourself  😜😜"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("ok"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 670,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          StreamBuilder(
            stream: Firestore.instance
                .collection("userprofile")
                .document(widget.userid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print("load");
              }
              var data = snapshot.data;
              prefollower = data["follower"];
              userprofilepic = data["profileimageurl"];
              print(data["follower"]);

              return Container(
//child:Image(image:NetworkImage(userprofilepic),
                  // )
                  );
            },
          ),

          StreamBuilder(
            stream: Firestore.instance
                .collection("userprofile")
                .document(currentuserid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print("load");
              }
              var data = snapshot.data;
              prefollowing = data["following"];

              print(data["following"]);
              print(userprofilepic);

              return Container();
            },
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (conetxt) =>
                          Alluserprofile(userid: widget.userid)));
            },
            child: Container(
              child: Row(children: [
                // CircleAvatar(
                //   radius: 30,
                //   child: Image(image:NetworkImage(userprofilepic))),
                ClipOval(
                    child: CachedNetworkImage(
                        imageUrl: widget.iconUrl,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover)),
                SizedBox(width: 10),
                Text(widget.authorName,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Dancing",
                        color: textcolor)),
                SizedBox(width: 5),
                StreamBuilder(
                    stream: Firestore.instance
                        .collection("onlinestatus")
                        .document(widget.userid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print("load");
                      }
                      var data = snapshot.data;

                      var st = data["online"];
                      print(st);
                      bool y = false;
                      if (st == "online") {
                        y = true;
                      } else {
                        y = false;
                      }

                      return Container(
                          child: Row(children: <Widget>[
                        Text(st, style: TextStyle(color: textcolor)),
                        SizedBox(width: 10),
                        Container(
                            child: y != false
                                ? CircleAvatar(
                                    radius: 10, backgroundColor: Colors.green)
                                : CircleAvatar(
                                    radius: 10, backgroundColor: Colors.black))
                      ]));
                    }),
              ] // fontWeight: FontWeight
                  ),
            ),
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  if (widget.userid != currentuserid) {
                    _showDialog(context);

                    // print(widget.follower);
                    int x = prefollower + 1;
                    int y = prefollowing + 1;
                    print(x);
                    setState(() {
                      follow = true;
                    });

                    updatefollower(x);
                    updatefollowing(y);
                  } else {
                    _showDialogwhensame(context);
                  }
                },
                child: Container(
                  // color:Colors.green,
                  child: follow
                      ? Text(
                          "Following",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Dancing",
                              color: Colors.green),
                        )
                      : Text(
                          "Follow",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Dancing",
                              color: Colors.green),
                        ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                  child: follow
                      ? Image(
                          height: 20,
                          width: 20,
                          image: AssetImage("images/correct.png"))
                      : Container())
            ],
          ),
          SizedBox(height: 10),
          Container(
            //height: 125,
            width: MediaQuery.of(context).size.width,
            child: LinkText(
              text: widget.title,
              textStyle: TextStyle(
                  fontSize: 17,
                  fontFamily: "Dancing",
                  //fontWeight: FontWeight.w500,
                  color: textcolor),
            ),
          ),

          SizedBox(height: 10),

          Container(
            //  height: 375,
            width: MediaQuery.of(context).size.width,
            child: PinchZoomImage(
              image: Image.network(widget.imgUrl),
              zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
              hideStatusBarWhileZooming: true,
              onZoomStart: () {
                print('Zoom started');
              },
              onZoomEnd: () {
                print('Zoom finished');
              },
            ),
          ),

          Container(
              child: Row(
            children: <Widget>[
              SizedBox(width: 10),
              IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    size: 40,
                  ),
                  color: likecolor,
                  onPressed: () {
                    var x = int.parse(widget.postLike);
                    x = x + 1;
                    String newlike;
                    newlike = x.toString();
                    setState(() {
                      updatepost(newlike);
                      //likebydefault = Colors.blue;
                      likecolor = Colors.blue;
                    });
                    // likecolor = Colors.blue;
                  }),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.postLike,
                style: TextStyle(
                    fontSize: 20,
                    color: textcolor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    size: 40,
                  ),
                  color: dislikecolor,
                  onPressed: () {
                    var x = int.parse(widget.disLike);
                    x = x + 1;
                    String newdislike;
                    newdislike = x.toString();
                    setState(() {
                      updatedislike(newdislike);
                    });
                    dislikecolor = Colors.red;
                  }),
              SizedBox(width: 15),
              Text(
                widget.disLike,
                style: TextStyle(
                    fontSize: 20,
                    color: textcolor,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 85),
              IconButton(
                  icon: Icon(
                    Icons.delete,
                    size: 30,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    if (widget.userid == currentuserid) {
                      deletepost();
                    } else {
                      print("no delete");
                    }
                  })
            ],
          )),

          Container(
            // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: commentsEditingController,
                    style: TextStyle(
                        color: textcolor, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        hintText: "Do comments ...",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: textcolor, width: 3)),
                        hintStyle: TextStyle(
                          color: textcolor,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: textcolor),
                        )),
                  ),
                ),
                Container(
                  //s  height: 40,
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
          SizedBox(height: 10),
          // AdmobBanner(
          //     adUnitId: "ca-app-pub-5023637575934146/5339692753",
          //     //adUnitId:"ca-app-pub-3940256099942544/6300978111",
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

  Future<void> _saveNetworkImage(String imgUrl) async {
    String path =
        "https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg";

    try {
      GallerySaver.saveImage(path).then(
        (bool success) {
          // // setState(() {
          // //   print('Image is saved');
          // // },
          // );
          print("complete");
          print(imgUrl);
        },
      );
    } catch (e) {
      print("amit $e");
    }
  }
}

class Videotile extends StatefulWidget {
  String url, title;
  Videotile({@required this.url, @required this.title});
  @override
  _BlogstileState createState() => _BlogstileState();
}

class _BlogstileState extends State<Videotile> {
  VideoPlayerController _videoPlayerController1;

  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(widget.url);

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: false,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.grey,
      ),
      autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.black,
          child: Card(
            color: Colors.black,
            elevation: 10,
            child: Chewie(
              controller: _chewieController,
            ),
          ),
        ),
        SizedBox(height: 10),
        LinkText(
          text: widget.title,
          textStyle: TextStyle(
              fontSize: 17,
              fontFamily: "Dancing",
              //fontWeight: FontWeight.w500,
              color: textcolor),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
