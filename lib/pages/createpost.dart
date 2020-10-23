import 'dart:math';

import 'package:Academicmaster/pages/homescreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart"; //chek it flutter analyze
import "dart:io";
import "package:Academicmaster/services/crud.dart";
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:image_cropper/image_cropper.dart';
import "package:intl/intl.dart";
import 'package:shared_preferences/shared_preferences.dart';

int back, words;
String iconimg;

class Uploaddata extends StatefulWidget {
  @override
  _UploaddataState createState() => _UploaddataState();
}

class _UploaddataState extends State<
        Uploaddata> //lets hope evrything fine . i m totally wasite my 2 days
    with
        SingleTickerProviderStateMixin {
  TabController tabcontroller;
  @override
  void initState() {
    getmode();

    super.initState();

    tabcontroller = TabController(vsync: this, length: 2);
  }

  getmode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    iconimg = preferences.getString('profilepic');
    setState(() {
      back = preferences.getInt('back');
      words = preferences.getInt('words');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(back),
        appBar: AppBar(
            backgroundColor: Color(back),
            bottom: TabBar(
                labelStyle: TextStyle(color: Color(words)),
                tabs: [
                  Tab(
                    text: "Image Post",
                  ),
                  Tab(text: "Video Post"),
                ],
                controller: tabcontroller,
                indicatorColor: Color(words),
                indicatorWeight: 5,
                labelColor: Color(words))),
        body: TabBarView(
          controller: tabcontroller,
          children: <Widget>[CreateBlog(), Createvideo()],
        ));
  }
}

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;

  File selectedImage;
  File selectedIcon;
  File video;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  DateTime now = DateTime.now();

  String userid;
  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    User user = await FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  Future<void> getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    cropImage(image);
  }

  Future<void> getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    cropImage(image);
  }

  // Future<void> getvideo() async {
  //   var file = await ImagePicker.pickVideo(source: ImageSource.gallery);

  //   video = file;
  // }

  cropImage(File image) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path, compressQuality: 40);

    setState(() {
      selectedImage = croppedImage;
    });
  }

  uploadBlog() async {
    if (selectedImage != null) {
      setState(() {
        _isLoading = true;
        // print("hii");
      });

      /// uploading image to firebase storage
      StorageReference firebaseStorageRefe = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask tasks =
          firebaseStorageRefe.putFile(selectedImage);

      var downloadUrl = await (await tasks.onComplete).ref.getDownloadURL();
      print("this is url $downloadUrl");

      await FirebaseFirestore.instance.collection(userid).add({
        "imgUrl": downloadUrl,
        "iconUrl": iconimg,
        "authorName": authorName,
        "title": title,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "userid": userid
      });

      var rng = new Random();
      String documentID = rng.nextInt(1000000).toString();
      await FirebaseFirestore.instance.collection("blogs").doc(documentID).set({
        "imgUrl": downloadUrl,
        "iconUrl": iconimg,
        "authorName": authorName,
        "title": title,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "documentID": documentID,
        "userid": userid
      }).then((result) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homescreen(),
            ));
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(back),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                    color: Color(back),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: selectedImage != null
                            ? Container(
                                decoration: BoxDecoration(
                                    color: Color(back),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3))
                                    ]),
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                // height: 350,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    selectedImage,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 210,
                                decoration: BoxDecoration(
                                    color: Color(back),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3))
                                    ]),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    Text("Slect image for post",
                                        style: TextStyle(
                                            color: Color(0xFF441777))),
                                    IconButton(
                                      tooltip: "take image from phone",
                                      color: Colors.black,
                                      icon: Icon(Icons.image,
                                          color: Color(0xFF441777)),
                                      iconSize: 70,
                                      onPressed: () {
                                        getImage();
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          getImagefromcamera();
                                        },
                                        tooltip: "take image from camera",
                                        icon: Icon(Icons.camera_alt,
                                            color: Color(0xFF441777)),
                                        color: Colors.white,
                                        iconSize: 70),
                                  ],
                                ),
                              )),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: <Widget>[
                          Container(
                            color: Color(0xFF9B9090),
                            child: TextField(
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                ),
                                hintText: "User name.....",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black)),
                              ),
                              onChanged: (val) {
                                authorName = val;
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Color(0xFF9B9090),
                            child: TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.description,
                                ),
                                hintText: "Description",
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.yellow)),
                              ),
                              onChanged: (val) {
                                title = val;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(height: 10),
                    Text("upload post", style: TextStyle(color: Color(words))),
                    GestureDetector(
                        onTap: () {
                          //  uploadBlog();
                        },
                        child: Icon(Icons.cloud_upload,
                            size: 100, color: Color(words)))
                  ])),
            ),
    );
  }
}

//
//for video

class Createvideo extends StatefulWidget {
  @override
  _CreatevideoState createState() => _CreatevideoState();
}

class _CreatevideoState extends State<Createvideo> {
  String authorName, title;

  File video;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  DateTime now = DateTime.now();

  String userid;
  String url;

  bool select = false;
  bool oncom = false;
  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    //final FirebaseUser user = await _auth.currentUser();
    User user = await FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  uploadToStorage() async {
    try {
      final DateTime now = DateTime.now();
      final int millSeconds = now.millisecondsSinceEpoch;
      final String month = now.month.toString();
      final String date = now.day.toString();
      final String storageId = (millSeconds.toString());
      final String today = ('$month-$date');

      final file = await ImagePicker.pickVideo(source: ImageSource.gallery);

      StorageReference ref = FirebaseStorage.instance
          .ref()
          .child("video")
          .child(today)
          .child(storageId);
      StorageUploadTask uploadTask =
          ref.putFile(file, StorageMetadata(contentType: 'video/mp4'));

      var downloadUrl =
          await (await uploadTask.onComplete).ref.getDownloadURL();

      url = downloadUrl.toString();

      print(url);
      setState(() {
        select = false;
        url = downloadUrl.toString();
        print("uerl hi $url");
        oncom = true;
      });
    } catch (error) {
      print(error);
    }
  }

  uploadBlog() async {
    print(" url $url");
    print("title $title");
    print("author $authorName");

    if (url != null && title != null && authorName != null) {
      setState(() {
        _isLoading = true;
        print("hii");
      });

      await FirebaseFirestore.instance.collection(userid).add({
        "imgUrl": url,
        "iconUrl": iconimg,
        "authorName": authorName,
        "title": title,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "userid": userid
      });

      var rng = new Random();
      String documentID = rng.nextInt(1000000).toString();
      await FirebaseFirestore.instance.collection("blogs").doc(documentID).set({
        "imgUrl": url,
        "iconUrl": iconimg,
        "authorName": authorName,
        "title": title,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "documentID": documentID,
        "userid": userid
      }).then((result) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homescreen(),
            ));
      });
    } else {
      print("something wrong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(back),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  select
                      ? Container(
                          decoration: BoxDecoration(
                              color: Color(back),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          height: 230,
                          child: Column(children: [
                            Text("🤫", style: TextStyle(fontSize: 150)),
                            Text("Uploading",
                                style: TextStyle(
                                    fontSize: 15, color: Color(words))),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircularProgressIndicator(),
                            )
                          ]))
                      : GestureDetector(
                          onTap: () {
                            uploadToStorage();

                            setState(() {
                              select = true;
                            });
                          },
                          child: Icon((Icons.videocam),
                              color: Color(words), size: 100)),
                  oncom
                      ? Container(
                          decoration: BoxDecoration(
                              color: Color(back),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 3))
                              ]),
                          height: 230,
                          child: Column(children: [
                            Text("😊", style: TextStyle(fontSize: 150)),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Your Video Selected fill captions and press on submit",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Color(words),
                                      fontWeight: FontWeight.bold)),
                            )
                          ]))
                      : Text(""),
                  Container(
                    color: Color(back),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          color: Color(0xFF9B9090),
                          child: TextField(
                            style: TextStyle(
                              color: Color(words),
                            ),
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Color(words),
                              ),
                              hintText: "User name.....",
                              hintStyle: TextStyle(
                                color: Color(words),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                            onChanged: (val) {
                              authorName = val;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Color(0xFF9B9090),
                          child: TextField(
                            style: TextStyle(
                              color: Color(words),
                            ),
                            maxLines: 5,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                                color: Color(words),
                              ),
                              hintText: "Description",
                              hintStyle: TextStyle(
                                color: Color(words),
                              ),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow)),
                            ),
                            onChanged: (val) {
                              title = val;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 10),
                  Text("upload post", style: TextStyle(color: Color(words))),
                  GestureDetector(
                      onTap: () {
                        uploadBlog();
                      },
                      child: Icon(
                        Icons.cloud_upload,
                        size: 100,
                        color: Color(words),
                      ))
                ]),
                //color:Color(back)
              ),
            ),
    );
  }
}
