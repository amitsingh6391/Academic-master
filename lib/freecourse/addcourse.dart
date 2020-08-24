// import 'package:Academicmaster/freecourse/fetchcourse.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import "package:flutter/material.dart";
// import "dart:io";
// import "package:Academicmaster/services/crud.dart";
// import 'package:image_picker/image_picker.dart';
// import 'package:random_string/random_string.dart';
// import 'package:image_cropper/image_cropper.dart';



// class CreateBlog extends StatefulWidget {
//   @override
//   _CreateBlogState createState() => _CreateBlogState();
// }

// class _CreateBlogState extends State<CreateBlog> {
//   String authorName, title, desc;

//   File selectedImage;
//   File selectedIcon;
//   bool _isLoading = false;
//   CrudMethods crudMethods = new CrudMethods();

//   Future getImage() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.gallery);

//     cropImage(image);
//   }

//   Future getImagefromcamera() async {
//     var image = await ImagePicker.pickImage(source: ImageSource.camera);

//     cropImage(image);
//   }

//   cropImage(File image) async {
//     File croppedImage = await ImageCropper.cropImage(
//         sourcePath: image.path, compressQuality: 40);

//     setState(() {
//       selectedImage = croppedImage;
//     });
//   }

//   //for imageicon...

//   Future getIcon() async {
//     var icon = await ImagePicker.pickImage(source: ImageSource.gallery);

//     cropIcon(icon);
//   }

//   cropIcon(File icon) async {
//     File croppedIcon = await ImageCropper.cropImage(
//         sourcePath: icon.path, compressQuality: 40);

//     setState(() {
//       selectedIcon = croppedIcon;
//     });
//   }

//   uploadBlog() async {
//     if (selectedIcon != null && selectedImage != null) {
//       setState(() {
//         _isLoading = true;
//         // print("hii");
//       });

//       /// uploading image to firebase storage
//       StorageReference firebaseStorageRefe = FirebaseStorage.instance
//           .ref()
//           .child("freecourseImages")
//           .child("${randomAlphaNumeric(9)}.jpg");

//       final StorageUploadTask tasks =
//           firebaseStorageRefe.putFile(selectedImage);

//       var downloadUrl = await (await tasks.onComplete).ref.getDownloadURL();
//       print("this is url $downloadUrl");

//       //for icons...

//       StorageReference firebaseStorageRef = FirebaseStorage.instance
//           .ref()
//           .child("freecourseicon")
//           .child("${randomAlphaNumeric(9)}.jpg");

//       final StorageUploadTask task = firebaseStorageRef.putFile(selectedIcon);

//       var downloadiconUrl = await (await task.onComplete).ref.getDownloadURL();
//       print("this is url $downloadiconUrl");

//       Map<String, dynamic> freecourseMap = {
//         "imgUrl": downloadUrl,
//         "iconUrl": downloadiconUrl,
//         "authorName": authorName,
//         "title": title,
//         "desc": desc,
//         'time': DateTime.now().millisecondsSinceEpoch,
//       };
//       crudMethods.addfreecourseData(freecourseMap).then((result) {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => FreecoursePage(),
//             ));
//       });
//     } else {}
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       backgroundColor: Colors.cyan,
//       appBar: AppBar(
//         backgroundColor: Color(0xFF0000A0),
//         title: Text(
//           "Get Paid course in free",
//           style: TextStyle(
//               fontFamily: "Dancing", fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ),
//       body: _isLoading
//           ? Container(
//               alignment: Alignment.center,
//               child: CircularProgressIndicator(),
//             )
//           : SingleChildScrollView(
//               child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.cyan,
//                     // gradient: LinearGradient(
//                     //   colors: [Colors.black26, Colors.black45],
//                     // ),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(children: <Widget>[
//                     SizedBox(
//                       height: 10,
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           getImage();
//                         },
//                         child: selectedImage != null
//                             ? Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [Colors.black26, Colors.black45],
//                                   ),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 margin: EdgeInsets.symmetric(horizontal: 16),
//                                 height: 350,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(6),
//                                   child: Image.file(
//                                     selectedImage,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               )
//                             : Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 16),
//                                 height: 210,
//                                 decoration: BoxDecoration(
//                                     gradient: LinearGradient(colors: [
//                                       Colors.yellow,
//                                       Colors.orange,
//                                     ]),
//                                     borderRadius: BorderRadius.circular(50)),
//                                 width: MediaQuery.of(context).size.width,
//                                 child: Column(
//                                   children: <Widget>[
//                                     Text("Slect image for post"),
//                                     IconButton(
//                                       tooltip: "take image from phone",
//                                       color: Colors.white,
//                                       icon: Icon(Icons.image),
//                                       iconSize: 70,
//                                       onPressed: () {
//                                         getImage();
//                                       },
//                                     ),
//                                     SizedBox(
//                                       height: 15,
//                                     ),
//                                     IconButton(
//                                         onPressed: () {
//                                           getImagefromcamera();
//                                         },
//                                         tooltip: "take image from camera",
//                                         icon: Icon(Icons.camera_alt),
//                                         color: Colors.white,
//                                         iconSize: 70),
//                                   ],
//                                 ),
//                               )),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Container(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//                       margin: EdgeInsets.symmetric(horizontal: 16),
//                       child: Column(
//                         children: <Widget>[
//                           TextField(
//                             decoration: InputDecoration(
//                               icon: Icon(
//                                 Icons.person,
//                               ),
//                               hintText: "Subject name.....",
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.black)),
//                             ),
//                             onChanged: (val) {
//                               authorName = val;
//                             },
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           TextField(
//                             decoration: InputDecoration(
//                               icon: Icon(
//                                 Icons.description,
//                               ),
//                               hintText: "Description or url",
//                               border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.yellow)),
//                             ),
//                             onChanged: (val) {
//                               title = val;
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "Select profile pic",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     GestureDetector(
//                         onTap: () {
//                           getIcon();
//                         },
//                         child: selectedIcon != null
//                             ? Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [Colors.black26, Colors.black45],
//                                   ),
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                                 margin: EdgeInsets.symmetric(horizontal: 16),
//                                 height: 170,
//                                 width: MediaQuery.of(context).size.width,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(6),
//                                   child: Image.file(
//                                     selectedIcon,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               )
//                             : Container(
//                                 margin: EdgeInsets.symmetric(horizontal: 16),
//                                 height: 100,
//                                 decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.black),
//                                 //width: MediaQuery.of(context).size.width,
//                                 child: Column(
//                                   children: <Widget>[
//                                     IconButton(
//                                       tooltip: "Select ypur profile pic",
//                                       color: Colors.white,
//                                       icon: Icon(Icons.person),
//                                       iconSize: 70,
//                                       onPressed: () {
//                                         getIcon();
//                                       },
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                     SizedBox(height: 10),
//                     Text("upload post"),
//                     GestureDetector(
//                         onTap: () {
//                           uploadBlog();
//                         },
//                         child: Icon(
//                           Icons.cloud_upload,
//                           size: 100,
//                         ))
//                   ])),
//             ),
//     );
//   }
// }



//neeraj code


import 'package:Academicmaster/freecourse/fetchcourse.dart';
import 'package:firebase_storage/firebase_storage.dart';
import "package:flutter/material.dart";
import "dart:io";
import "package:Academicmaster/services/crud.dart";
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';
import 'package:image_cropper/image_cropper.dart';



class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, desc;

  File selectedImage;
  File selectedIcon;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    cropImage(image);
  }

  Future getImagefromcamera() async {
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

  Future getIcon() async {
    var icon = await ImagePicker.pickImage(source: ImageSource.gallery);

    cropIcon(icon);
  }

  cropIcon(File icon) async {
    File croppedIcon = await ImageCropper.cropImage(
        sourcePath: icon.path, compressQuality: 40);

    setState(() {
      selectedIcon = croppedIcon;
    });
  }

  uploadBlog() async {
    if (selectedIcon != null && selectedImage != null) {
      setState(() {
        _isLoading = true;
        // print("hii");
      });

      /// uploading image to firebase storage
      StorageReference firebaseStorageRefe = FirebaseStorage.instance
          .ref()
          .child("freecourseImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask tasks =
          firebaseStorageRefe.putFile(selectedImage);

      var downloadUrl = await (await tasks.onComplete).ref.getDownloadURL();
      print("this is url $downloadUrl");

      //for icons...

      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("freecourseicon")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask task = firebaseStorageRef.putFile(selectedIcon);

      var downloadiconUrl = await (await task.onComplete).ref.getDownloadURL();
      print("this is url $downloadiconUrl");

      Map<String, dynamic> freecourseMap = {
        "imgUrl": downloadUrl,
        "iconUrl": downloadiconUrl,
        "authorName": authorName,
        "title": title,
        "desc": desc,
        'time': DateTime.now().millisecondsSinceEpoch,
      };
      crudMethods.addfreecourseData(freecourseMap).then((result) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FreecoursePage(),
            ));
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.cyan[100],
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.cyan[100],
                    // gradient: LinearGradient(
                    //   colors: [Colors.black26, Colors.black45],
                    // ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 40,
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
                                height: 350,
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
                                      Colors.yellow[300],
                                      Colors.deepPurple[100],
                                    ]),
                                    borderRadius: BorderRadius.circular(50)),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    Text("Slect image for post",style: TextStyle(fontSize: 20),),
                                    IconButton(
                                      tooltip: "take image from phone",
                                      color: Colors.black54,
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
                                        color: Colors.black54,
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
                              hintText: "Subject name.....",
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
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.description,
                              ),
                              hintText: "Description or url",
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
                    Text(
                      "Select profile pic",
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                        onTap: () {
                          getIcon();
                        },
                        child: selectedIcon != null
                            ? Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.black26, Colors.black45],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 170,
                                width: MediaQuery.of(context).size.width,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.file(
                                    selectedIcon,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                height: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black38),
                                //width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: <Widget>[
                                    IconButton(
                                      tooltip: "Select ypur profile pic",
                                      color: Colors.black38,
                                      icon: Icon(Icons.person,color: Colors.white,),
                                      iconSize: 70,
                                      onPressed: () {
                                        getIcon();
                                      },
                                    ),
                                  ],
                                ),
                              )),
                    SizedBox(height: 10),
                    Text("upload post"),
                    GestureDetector(
                        onTap: () {
                          uploadBlog();
                        },
                        child: Icon(
                          Icons.cloud_upload,color: Colors.black54,
                          size: 100,
                        ))
                  ])),
            ),
    );
  }
}