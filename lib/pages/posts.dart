
import 'dart:io';
import 'dart:typed_data';
import 'package:Academicmaster/pages/commentspage.dart';
import 'package:Academicmaster/pages/createpost.dart';
import 'package:Academicmaster/services/admob_service.dart';
import "package:Academicmaster/services/crud.dart";
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import "package:cached_network_image/cached_network_image.dart";

import 'package:gallery_saver/gallery_saver.dart';

import 'package:url_launcher/url_launcher.dart';

import '../firstslide.dart';
import "commentspage.dart";
import "package:link_text/link_text.dart";

import "package:intl/intl.dart";
import 'package:like_button/like_button.dart';
import 'package:pinch_zoom_image_updated/pinch_zoom_image_updated.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:Academicmaster/services/crud.dart";


Color x = Colors.white;
Color textcolor = Colors.black;
CrudMethods crudMethods = new CrudMethods();
Color whitescreen = Colors.black;
Color blackscreen = Colors.white;


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
  
 
  @override
  void initState() {
    crudMethods.getData().then((result) {
      //here i get the blogs..

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
           drawer: NavDrawer(
           ),
          backgroundColor: x,
          floatingActionButton: FloatingActionButton(
            tooltip: "upload a new post",
            backgroundColor: Color(0xffd6b060),
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateBlog()));
            },
          ),
          appBar: AppBar(

            /*title: Text(
              "Explore",
              style: GoogleFonts.grenze(
                  fontSize: 25,
                color: Colors.black
                  ),
            ),*/
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        Colors.brown[200],
                        Colors.yellow[200]
                      ])
              ),
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
                      // likebydefault = Colors.black;
                      // dislikebydefault = Colors.black;
                     
                    });
                  },
                  child: Icon(
                    Icons.brightness_2,
                    color: Colors.white,
                    size: 35,
                  )),
              GestureDetector(
                  onTap: () {
                    setState(() {
                      x = Colors.black;
                      textcolor = Colors.white;
                      // likebydefault = Colors.white;
                      // dislikebydefault = Colors.white;
                   
                    });
                  },
                  child: Icon(
                    Icons.brightness_4,
                    color: Colors.black,
                    size: 35,
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
                                // _updateLike = int.tryParse(
                                //     "${snapshot.data.documents[index].data["like"].toString}");
                                //     print(_updateLike);
                                return Column(
                                  children: <Widget>[
                                    BlogsTile(
                                      authorName: snapshot.data.documents[index]
                                          .data['authorName'],
                                      title: snapshot
                                          .data.documents[index].data["title"],
                                      description: snapshot
                                          .data.documents[index].data['desc'],
                                      imgUrl: snapshot
                                          .data.documents[index].data['imgUrl'],
                                      iconUrl: snapshot.data.documents[index]
                                          .data['iconUrl'],
                                      posttime: snapshot.data.documents[index]
                                          .data["posttime"],
                                      postid: snapshot.data.documents[index]
                                          .data["documentID"],
                                      postLike: snapshot
                                          .data.documents[index].data["like"],
                                      disLike: snapshot.data.documents[index]
                                          .data["dislike"],
                                        
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
      disLike;

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
  
    
        await dbref.collection("blogs").document(widget.postid).setData({
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

  //delte data from firestore.....

   void deletepost() async {
   
   await  Firestore.instance.collection("blogs").document(widget.postid).delete();

    print("ok");
    print("delete");
  }

//update for dislike....

  void updatedislike(String newdislike) async {

    
      
      await dbref.collection("blogs").document(widget.postid).setData({
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
    }
    
    );
      
  
   
    
    print("ok");
    print(widget.postid);
  }


Color likecolor = Colors.brown;
Color dislikecolor = Colors.brown; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 670,
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
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Dancing",
                      color: textcolor))
            ] // fontWeight: FontWeight
                ),
          ),
          Container(
            height: 125,
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
            height: 375,
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
                  color:likecolor,
                  onPressed: () {
                    var x = int.parse(widget.postLike);
                    x = x + 1;
                    String newlike;
                    newlike = x.toString();
                    setState(() {
                      updatepost(newlike);
                      //likebydefault = Colors.blue;
                       likecolor=Colors.blue;

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
                  SizedBox(width:15),
              Text(
                widget.disLike,
                style: TextStyle(
                    fontSize: 20,
                    color: textcolor,
                    fontWeight: FontWeight.bold),
              ),
               SizedBox(width:85),
               IconButton(icon: Icon(Icons.delete,size: 30,color: Colors.red,), 
               onPressed: (){
                 deletepost();
               }
               )
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
