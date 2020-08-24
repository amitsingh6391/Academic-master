import 'dart:math';


import 'package:Academicmaster/pages/posts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import "dart:io";
import "package:Academicmaster/services/crud.dart";
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:image_cropper/image_cropper.dart';
import "package:intl/intl.dart";

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc,iconimg;

  File selectedImage;
  File selectedIcon;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  DateTime now = DateTime.now();


   String userid;
  @override
  void initState() {
    // TODO: implement initState

    getCurrentUser();

    super.initState();
  }



   getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
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

  cropImage(File image) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path, compressQuality: 40);

    setState(() {
      selectedImage = croppedImage;
    });
  }

  //for imageicon...

  // Future<void> getIcon() async {
  //   var icon = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   cropIcon(icon);
  // }

  // cropIcon(File icon) async {
  //   File croppedIcon = await ImageCropper.cropImage(
  //       sourcePath: icon.path, compressQuality: 40);

  //   setState(() {
  //     selectedIcon = croppedIcon;
  //   });
  // }

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

      //for icons...

      // StorageReference firebaseStorageRef = FirebaseStorage.instance
      //     .ref()
      //     .child("posticon")
      //     .child("${randomAlphaNumeric(9)}.jpg");

      // final StorageUploadTask task = firebaseStorageRef.putFile(selectedIcon);

      // var downloadiconUrl = await (await task.onComplete).ref.getDownloadURL();
      // print("this is url $downloadiconUrl");

      
      Map<String, dynamic> blogMap = {
        "imgUrl": downloadUrl,
        "iconUrl": iconimg,
        "authorName": authorName,
        "title": title,
        "desc": desc,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "like": "0",
        "userid":userid
       
       
      };
       
      

        
         await Firestore.instance.collection(userid).add({

  "imgUrl": downloadUrl,
        "iconUrl":iconimg,
        "authorName": authorName,
        "title": title,
        "desc": desc,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "like": "0",
        "dislike":"0",
        
        "userid":userid



         });
         

         var rng = new Random();
         String documentID = rng.nextInt(1000000).toString();
         await Firestore.instance.collection("blogs").document(documentID).setData({

        "imgUrl": downloadUrl,
        "iconUrl": iconimg,
        "authorName": authorName,
        "title": title,
        "desc": desc,
        'time': DateTime.now().millisecondsSinceEpoch,
        "posttime": DateFormat("MM-dd - kk:mm").format(now),
        "like": "0",
        "dislike":"0",
        "documentID":documentID,
        "userid":userid
           
         }).then((result){
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomPage(),
            ));
         });

      


      

      // crudMethods.addData(blogMap).then((result) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => HomPage(),
      //       ));
      // });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Upload information",
          style: TextStyle(
              fontFamily: "Dancing", fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // gradient: LinearGradient(
                    //   colors: [Colors.black26, Colors.black45],
                    // ),
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
                                  gradient: LinearGradient(
                                    colors: [Colors.black26, Colors.black45],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                    gradient: LinearGradient(colors: [
                                      Colors.black,
                                      Colors.black,
                                    ]),
                                    borderRadius: BorderRadius.circular(50)),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    Text("Slect image for post",style:TextStyle(color: Colors.white)),
                                    IconButton(
                                      tooltip: "take image from phone",
                                      color: Colors.white,
                                      icon: Icon(Icons.image),
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
                                        icon: Icon(Icons.camera_alt),
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
                          TextField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                              ),
                              hintText: "User name.....",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                            onChanged: (val) {
                              authorName = val;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            maxLines: 5,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                              ),
                              hintText: "Description",
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.yellow)),
                            ),
                            onChanged: (val) {
                              title = val;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "Select post icon ",
                    //   style: TextStyle(color: Colors.black),
                    // ),
                    // GestureDetector(
                    //     onTap: () {
                    //       getIcon();
                    //     },
                    //     child: selectedIcon != null
                    //         ? Container(
                    //             decoration: BoxDecoration(
                    //               gradient: LinearGradient(
                    //                 colors: [Colors.black26, Colors.black45],
                    //               ),
                    //               borderRadius: BorderRadius.circular(20),
                    //             ),
                    //             margin: EdgeInsets.symmetric(horizontal: 16),
                    //             height: 170,
                    //             width: MediaQuery.of(context).size.width,
                    //             child: ClipRRect(
                    //               borderRadius: BorderRadius.circular(6),
                    //               child: Image.file(
                    //                 selectedIcon,
                    //                 fit: BoxFit.cover,
                    //               ),
                    //             ),
                    //           )
                    //         : Container(
                    //             margin: EdgeInsets.symmetric(horizontal: 16),
                    //             height: 100,
                    //             decoration: BoxDecoration(
                    //                 shape: BoxShape.circle,
                    //                 color: Colors.black),
                    //             //width: MediaQuery.of(context).size.width,
                    //             child: Column(
                    //               children: <Widget>[
                    //                 IconButton(
                    //                   tooltip: "Select ypur profile pic",
                    //                   color: Colors.white,
                    //                   icon: Icon(Icons.person),
                    //                   iconSize: 70,
                    //                   onPressed: () {
                    //                     getIcon();
                    //                   },
                    //                 ),
                    //               ],
                    //             ),
                    //           )),
                    StreamBuilder(

                      stream:Firestore.instance.collection("userprofile").document(userid).snapshots(),
                      builder: (context,snapshot){
                        if(!snapshot.hasData){
                          print("icon not have");
                        }
                        var userprofile  = snapshot.data;
                        
                        iconimg = userprofile["profileimageurl"];
                        return Container(

                        );
                      },


                    ),
                    SizedBox(height: 10),
                    Text("upload post"),
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
    );
  }
}
