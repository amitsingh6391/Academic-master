import 'package:Academicmaster/Bcomcourse/selectbcomyear.dart';
import 'package:Academicmaster/Bpharmacourse/selectbpharmyear.dart';

import 'package:Academicmaster/Bsccourse/selectbscyear.dart';

import 'package:Academicmaster/branch.dart';
import 'package:Academicmaster/dpharmacourse/dpharmayear.dart';
import 'package:Academicmaster/freecourse/fetchcourse.dart';

import 'package:Academicmaster/pages/commentpage.dart';

import 'package:Academicmaster/services/homenotification.dart';
import 'package:Academicmaster/services/payment.dart';
import 'package:Academicmaster/view/groupchat/notify.dart' as notif;

import 'dart:io';
import 'dart:typed_data';

import 'package:Academicmaster/pages/createpost.dart';
import 'package:Academicmaster/services/admob_service.dart';

import 'package:Academicmaster/view/viewservices/database.dart';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";

import "package:cached_network_image/cached_network_image.dart";
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

import '../firstslide.dart';

import "package:link_text/link_text.dart";

import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';

import "alluserprofile.dart";

import 'package:velocity_x/velocity_x.dart';

int newfollower;
String currentuserid;

int back;
int words;
String username, userprofile;

class ProjectWidget extends StatelessWidget {
  final String title;

  const ProjectWidget({Key key, @required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.17,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Card(
          elevation: 10,
          child: Column(children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.65,
                child: Image(image: AssetImage(title), fit: BoxFit.fill)),
            // Text(title)
          ]),
        ));
  }
}

class HomPage extends StatefulWidget {
  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  // CrudMethods crudMethods = new CrudMethods();

  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController commentsEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final ams = AdMobService(); //call admobclass for use fntction

  @override
  void initState() {
    ams.createReawrdAdAndLoad();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");

        notif.Notification notification = new notif.Notification();
        notification.showNotificationWithoutSound(message);

        // showMessage("Notification", "$message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        notif.Notification notification = new notif.Notification();
        notification.showNotificationWithoutSound(message);

        // showMessage("Notification", "$message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        notif.Notification notification = new notif.Notification();
        notification.showNotificationWithoutSound(message);

        // showMessage("Notification", "$message");
      },
    );

    if (Platform.isIOS) {
      _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: false),
      );
    }

    getCurrentUser();

    super.initState();
  }

  getCurrentUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    back = preferences.getInt('back');
    words = preferences.getInt('words');

    final FirebaseAuth _auth = FirebaseAuth.instance;

    User user = FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print("yes");
    print(uid);
    setState(() {
      currentuserid = uid.toString();
    });

    onlinestatus();
  }

  onlinestatus() async {
    await FirebaseFirestore.instance
        .collection("onlinestatus")
        .doc(currentuserid)
        .set({"online": "online"});
  }

  offline() async {
    await FirebaseFirestore.instance
        .collection("onlinestatus")
        .doc(currentuserid)
        .update({"online": "offline"});
  }

  showMessage(title, description) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text(title),
            content: Text(description),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: Text("Dismiss"),
              )
            ],
          );
        });
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
                backgroundColor: Color(back),
                title:
                    Text("Confirm Exit", style: TextStyle(color: Color(words))),
                content: Text("Are you sure you want to exit?",
                    style: TextStyle(color: Color(words))),
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
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: AppBar(
              automaticallyImplyLeading: false,
              leading: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NavDrawer()));
                  },
                  child: Icon(
                    Icons.menu,
                    color: Color(words),
                  )),
              flexibleSpace: Container(
                color: Color(back),
                height: 350,
                width: 100,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48.0),
                    child: Text("     Academic Master",
                        style: TextStyle(
                            fontSize: size.width * 0.08,
                            color: Color(words),
                            fontFamily: "Dancing",
                            fontWeight: FontWeight.bold)),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.notification_important,
                      size: 30,
                      color: Color(words),
                    ),
                    onPressed: () {
                      RewardedVideoAd.instance..show();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Usernotification()));
                    },
                  ),
                  Column(children: [
                    SizedBox(height: 50),
                    Text("Membership",
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(words),
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Payment()));
                      },
                      child: Icon(
                        Icons.account_balance_wallet,
                        size: 30,
                        color: Color(words),
                      ),
                    )
                  ])
                ]),
              ),
            ),
          ),
          drawer: NavDrawer(),
          backgroundColor: Color(back),
          floatingActionButton: FloatingActionButton(
              onPressed: () {
                RewardedVideoAd.instance..show();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Uploaddata()));
              },
              tooltip: "upload a new post",
              backgroundColor: Color(words),
              child: Icon(
                Icons.add,
                color: Color(back),
              )),
          body: EasyRefresh(
            onRefresh: () {
              setState(() {
                print("refresh");
              });
            },
            child: SingleChildScrollView(
              // physics: ScrollPhysics(),

              child: Column(children: [
                Container(
                  height: size.height * 0.2,
                  child: Expanded(
                      child: VxSwiper(
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    items: [
                      GestureDetector(
                        onTap: () {
                          RewardedVideoAd.instance..show();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Branch()));
                        },
                        child: ProjectWidget(title: "images/btech.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          // newTripAd.show(
                          //   //show the full screen adds when second year pressed
                          //   anchorType: AnchorType.bottom,
                          //   anchorOffset: 0.0,
                          //   horizontalCenterOffset: 0.0,
                          // );
                          RewardedVideoAd.instance..show();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bpharmyear()));
                        },
                        child: ProjectWidget(title: "images/bpharma.jpg"),
                      ),
                      GestureDetector(
                        onTap: () {
                          // newTripAd.show(
                          //   //show the full screen adds when second year pressed
                          //   anchorType: AnchorType.bottom,
                          //   anchorOffset: 0.0,
                          //   horizontalCenterOffset: 0.0,
                          // );
                          RewardedVideoAd.instance..show();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FreecoursePage()));
                        },
                        child: ProjectWidget(title: "images/freecourses.jpg"),
                      ),
                      GestureDetector(
                        onTap: () {
                          RewardedVideoAd.instance..show();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dpharmayear()));
                        },
                        child: ProjectWidget(title: "images/dpharmapic.jpg"),
                      ),
                      GestureDetector(
                        onTap: () => {
                          RewardedVideoAd.instance..show(),
                          // newTripAd.show(
                          //   //show the full screen adds when second year pressed
                          //   anchorType: AnchorType.bottom,
                          //   anchorOffset: 0.0,
                          //   horizontalCenterOffset: 0.0,
                          // ),
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bscyear()))
                        },
                        child: ProjectWidget(title: "images/bse.png"),
                      ),
                      GestureDetector(
                        onTap: () {
                          // newTripAd.show(
                          //   //show the full screen adds when second year pressed
                          //   anchorType: AnchorType.bottom,
                          //   anchorOffset: 0.0,
                          //   horizontalCenterOffset: 0.0,
                          // );
                          RewardedVideoAd.instance..show();

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Bcomyear()));
                        },
                        child: ProjectWidget(title: "images/bcom1.png"),
                      ),
                    ],
                    height: 120,
                    viewportFraction: context.isMobile ? 0.75 : 0.4,
                    autoPlay: true,
                    autoPlayInterval: Duration(
                      seconds: 3,
                    ),
                    autoPlayAnimationDuration: 1.seconds,
                  )),
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("userprofile")
                      .doc(currentuserid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("", style: TextStyle(color: Color(words)));
                    }

                    var Profiledetail = snapshot.data;
                    print("username set ------------********* $username");

                    username = Profiledetail["userName"];
                    print("username set ------------********* $username");
                    userprofile = Profiledetail["profileimageurl"];

                    return Text("");
                  },
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("blogs")
                      .orderBy("time")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Column(children: [
                        CircularProgressIndicator(
                          backgroundColor: Color(words),
                        ),
                        Text("Loading", style: TextStyle(color: Color(words)))
                      ]);
                    }

                    return ListView.builder(
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Posttile(
                            authorName: snapshot.data.documents[index]
                                .data()['authorName'],
                            title:
                                snapshot.data.documents[index].data()["title"],
                            imgUrl:
                                snapshot.data.documents[index].data()['imgUrl'],
                            iconUrl: snapshot.data.documents[index]
                                .data()['iconUrl'],
                            posttime: snapshot.data.documents[index]
                                .data()["posttime"],
                            postid: snapshot.data.documents[index]
                                .data()["documentID"],
                            userid:
                                snapshot.data.documents[index].data()["userid"],
                          );
                        });
                  },
                ),
              ]),
            ),
          )),
    );
  }
}

class Posttile extends StatefulWidget {
  String title, imgUrl, iconUrl, authorName, posttime, postid, userid;

  Posttile({
    @required this.imgUrl,
    @required this.iconUrl,
    @required this.title,
    @required this.authorName,
    @required this.posttime,
    @required this.postid,
    @required this.userid,
  });

  @override
  _PosttileState createState() => _PosttileState();
}

class _PosttileState extends State<Posttile> {
  launchurl() async {
    const url = "https://abesit.in/library/question-paper-bank/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " could not launch $url";
    }
  }

  final dbref = FirebaseFirestore.instance;

  void updatefollower(int newfollower) async {
    await dbref.collection("userprofile").doc(widget.userid).update({
      "follower": newfollower,
    });

    print("ok");
    print(widget.userid);
  }
  //delte data from firestore.....

  //now increase following..

  void updatefollowing(int newfollowing) async {
    await dbref.collection("userprofile").doc(currentuserid).update({
      "following": newfollowing,
    });

    print("ok");
    print(widget.userid);
  }

  void deletepost() async {
    await FirebaseFirestore.instance
        .collection("blogs")
        .doc(widget.postid)
        .delete();

    print("ok");
    print("delete");
  }

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

//for videoplayer

  VideoPlayerController _videoPlayerController1;

  ChewieController _chewieController;
  final ams = AdMobService();

  @override
  void initState() {
    print(
        "its user name ----------->>>>>>>>> $username   and **********8 $userprofile");
    ams.createReawrdAdAndLoad();
    super.initState();
    _videoPlayerController1 = VideoPlayerController.network(widget.imgUrl);

    _chewieController = ChewieController(
      //fullScreenByDefault: true,
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 3,

      autoPlay: false,
      looping: false,
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

    setnameandpic();
  }

  setnameandpic() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    preferences.setString("name", username);
    preferences.setString("profilepic", userprofile);
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();

    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
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
                          color: Color(words))),
                  SizedBox(width: 5),
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("onlinestatus")
                          .doc(widget.userid)
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
                          Text(st,
                              style: TextStyle(
                                  //  color: textcolor
                                  )),
                          SizedBox(width: 10),
                          Container(
                              child: y != false
                                  ? CircleAvatar(
                                      radius: 10, backgroundColor: Colors.green)
                                  : CircleAvatar(
                                      radius: 10, backgroundColor: Colors.red))
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
                    color: Color(words)),
              ),
            ),
            SizedBox(height: 10),
            widget.imgUrl.contains("video")
                ? Container(
                    color: Colors.black,
                    child: Card(
                      color: Colors.black,
                      elevation: 10,
                      child: Chewie(
                        controller: _chewieController,
                      ),
                    ),
                  )
                : Container(
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Comment",
                      style: TextStyle(
                        color: Color(words),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    RewardedVideoAd.instance..show();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Comment(
                                postid: widget.postid,
                                posturl: widget.imgUrl,
                                description: widget.title)));
                  },
                  child: Icon(Icons.question_answer,
                      size: 35, color: Color(words)),
                ),
                SizedBox(width: 20),
                IconButton(
                  icon: Icon(Icons.share_sharp, color: Color(words)),
                  onPressed: () async =>
                      await _shareImageFromUrl(widget.imgUrl),
                ), // IconButton(

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
          ],
        ));
  }
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
