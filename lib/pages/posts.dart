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

import "package:cached_network_image/cached_network_image.dart";

import 'package:gallery_saver/gallery_saver.dart';

import 'package:url_launcher/url_launcher.dart';

import "commentspage.dart";
import "package:link_text/link_text.dart";

Color x = Colors.white;
Color textcolor = Colors.black;

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
      }
    );
    
  },

          child: Scaffold(

          //define a button to select the ne w post
          backgroundColor: x,
          floatingActionButton: FloatingActionButton(
            tooltip: "upload a new post",
            backgroundColor: Colors.green,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CreateBlog()));
            },
          ),
          appBar: AppBar(
            backgroundColor: Color(0xFF0000A0),
            leading: Icon(Icons.face),
            title: Text(
              "explore information",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "Dancing",
                  fontWeight: FontWeight.bold),
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
                                  description:
                                      snapshot.data.documents[index].data['desc'],
                                  imgUrl: snapshot
                                      .data.documents[index].data['imgUrl'],
                                  iconUrl: snapshot
                                      .data.documents[index].data['iconUrl'],
                                  posttime:snapshot.data.documents[index].data["posttime"]
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
  String title, description, imgUrl, iconUrl, authorName,posttime;

  BlogsTile(
      {@required this.imgUrl,
      @required this.iconUrl,
      @required this.title,
      @required this.description,
      @required this.authorName,
      @required this.posttime});

  @override
  _BlogsTileState createState() => _BlogsTileState();
}

class _BlogsTileState extends State<BlogsTile> {
  BuildContext context;

  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController commentsEditingController = new TextEditingController();

  QuerySnapshot searchResultSnapshot;

  CrudMethods crudMethods = new CrudMethods();

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

  launchurl() async {
    const url = "https://abesit.in/library/question-paper-bank/";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw " could not launch $url";
    }
  }

  var likes = 0;
  var dislikes = 0;
  var likecolor = Colors.black;
  var discolor = Colors.black;

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
      height: 750,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(children: [
              ClipOval(
                  child: CachedNetworkImage(
                      imageUrl: widget.iconUrl,
                      height: 70,
                      width: 70,
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
            height: 395,
            width: MediaQuery.of(context).size.width,
            child: CachedNetworkImage(
                imageUrl: widget.imgUrl,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill),
          ),
          Container(
              child: Row(
            children: <Widget>[
              GestureDetector(
                child: Icon(
                  Icons.thumb_up,
                  size: 35,
                  color: likecolor,
                ),
                onTap: () {
                  setState(() {
                    likecolor = Colors.blue;
                  });
                },
                onLongPress: () {
                  setState(() {
                    likecolor = Colors.black;
                  });
                },
              ),
              SizedBox(width: 10),
              GestureDetector(
                child: Icon(
                  Icons.thumb_down,
                  size: 35,
                  color: discolor,
                ),
                onTap: () {
                  setState(() {
                    discolor = Colors.red;
                  });
                },
                onLongPress: () {
                  setState(() {
                    discolor = Colors.black;
                  });
                },
              ),
              SizedBox(width: 170,),
              Text(
               
                widget.posttime,style: TextStyle(fontSize:13,color: textcolor),)
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
          AdmobBanner(
              adUnitId: "ca-app-pub-4709741532241387/1729285651",
              //adUnitId:"ca-app-pub-3940256099942544/6300978111",
              adSize: AdmobBannerSize.BANNER),
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
