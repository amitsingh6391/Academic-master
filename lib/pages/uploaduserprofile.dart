import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import "dart:io";
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploaduserProfile extends StatefulWidget {
  @override
  _UploaduserProfileState createState() => _UploaduserProfileState();
}

class _UploaduserProfileState extends State<UploaduserProfile> {
  String userid;
  @override
  void initState() {
    getCurrentUser();

    super.initState();
  }

  getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    // final FirebaseUser user = await _auth.currentUser();
    User user = await FirebaseAuth.instance.currentUser;
    final uid = user.uid;
    print(uid);
    setState(() {
      userid = uid.toString();
    });
  }

  String username,
      bio,
      userEmail,
      userbranch,
      userphonenumber,
      useryear,
      usercollege,
      github,
      insta,
      linkdin;

  File selected1Image;

  bool _isLoading = false;
  final picker = ImagePicker();
  DateTime now = DateTime.now();
  Future<void> getImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);

    cropImage(image);
  }

  Future<void> getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    cropImage(image);
  }

  cropImage(var image) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path, compressQuality: 40);

    setState(() {
      selected1Image = croppedImage;
    });
  }

  //for imageicon...

  uploadBlog() async {
    if (selected1Image != null && username != null && bio != null) {
      setState(() {
        _isLoading = true;
        // print("hii");
      });

      /// uploading image to firebase storage
      StorageReference firebaseStorageRefe = FirebaseStorage.instance
          .ref()
          .child("userprofilepic")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask tasks =
          firebaseStorageRefe.putFile(selected1Image);

      var profilemageUrl = await (await tasks.onComplete).ref.getDownloadURL();
      print("this is url $profilemageUrl");

      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('profilepic', profilemageUrl);

      preferences.setString('name', username);

      await FirebaseFirestore.instance
          .collection("userprofile")
          .doc(userid)
          .update({
        "profileimageurl": profilemageUrl,
        "insta": insta,
        "github": github,
        "linkdin": linkdin,
        "userName": username,
        "userEmail": userEmail,
        "userbranch": userbranch,
        "userphonenumber": userphonenumber,
        "usercollege": usercollege,
        "useryear": useryear,
        "bio": bio,
        'time': DateTime.now().millisecondsSinceEpoch,
      }).then((result) {
        Navigator.pop(context);
      });
    } else {
      print("No upload");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Color(0xFF6F35A5),
                        height: 50,
                        child: Card(
                            color: Color(0xFF6F35A5),
                            child: Text("Update Account details",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "UserName",
                                  hintText: "Your Name",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  username = val;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "your email",
                                  hintText: "Your Email",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  userEmail = val;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "your college",
                                  hintText: "Your College",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  usercollege = val;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Your branch",
                                  hintText: "Your Branch",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  userbranch = val;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  labelText: "Your Year",
                                  hintText: "Your Year",
                                  border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                                onChanged: (val) {
                                  useryear = val;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                // width: 100,
                                margin: EdgeInsets.all(12),
                                height: 5 * 28.0,
                                child: TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    labelText: "Bio",
                                    hintText: "Bio",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.yellow)),
                                  ),
                                  onChanged: (val) {
                                    bio = val;
                                  },
                                  // style: TextStyle(fontSize: 20,height: 3),
                                ),
                              ),
                              SizedBox(height: 10),
                              Column(children: [
                                TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: "insta profile link(optional)",
                                    hintText: "insta profile link(Optional)",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  onChanged: (val) {
                                    insta = val;
                                  },
                                ),
                                TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: "Github profile link(optional)",
                                    hintText: "Github profile link(Optional)",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  onChanged: (val) {
                                    github = val;
                                  },
                                ),
                                TextField(
                                  maxLines: 2,
                                  decoration: InputDecoration(
                                    labelText: "Linkdin profile link(optional)",
                                    hintText: "Linkdin profile link(Optional)",
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black)),
                                  ),
                                  onChanged: (val) {
                                    linkdin = val;
                                  },
                                ),
                              ])
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            getImage();
                          },
                          child: selected1Image != null
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Image.file(
                                      selected1Image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 120,
                                    child: Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      height: 200,
                                      decoration: BoxDecoration(
                                          gradient: LinearGradient(colors: [
                                            Colors.black12,
                                            Colors.black12
                                          ]),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: <Widget>[
                                          Text("Slect 1 image",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          IconButton(
                                            tooltip: "take image from phone",
                                            color: Colors.white,
                                            icon: Icon(Icons.image),
                                            iconSize: 50,
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
                                              icon: Icon(Icons.camera_alt),
                                              color: Colors.white,
                                              iconSize: 40),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                      SizedBox(height: 20),
                      SizedBox(height: 10),
                      Text("upload Profile"),
                      GestureDetector(
                          onTap: () {
                            uploadBlog();
                          },
                          child: Icon(
                            Icons.cloud_upload,
                            size: 100,
                          ))
                    ])),
              ),
            ),
    );
  }
}
