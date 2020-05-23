import 'package:Academicmaster/pages/posts.dart';
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
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    // setState(() {
    //   selectedImage = image;
    // });
    cropImage(image);
  }

  Future getImagefromcamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

  //  slectedImage = image;
  //   }); setState(() {
  //     se
  cropImage(image);
  }

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
      });

      /// uploading image to firebase storage
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child("blogImages")
          .child("${randomAlphaNumeric(9)}.jpg");

      final StorageUploadTask task = firebaseStorageRef.putFile(selectedImage);

      var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
      print("this is url $downloadUrl");

      Map<String, String> blogMap = {
        "imgUrl": downloadUrl,
        "authorName": authorName,
        "title": title,
        "desc": desc
      };
      crudMethods.addData(blogMap).then((result) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomPage(),
            ));
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Upload information",
          style: TextStyle(
              fontFamily: "Dancing", fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              uploadBlog();
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.file_upload)),
          )
        ],
      ),
      body: _isLoading
          ? Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black26, Colors.black45],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: <Widget>[
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
                              height: 170,
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
                              height: 310,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.yellow,
                                    Colors.orange,
                                  ]),
                                  borderRadius: BorderRadius.circular(50)),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: <Widget>[
                                  IconButton(
                                    tooltip: "take image from phone",
                                    color: Colors.white,
                                    icon: Icon(Icons.image),
                                    iconSize: 70,
                                    onPressed: (){
                                      getImage();
                                    },
                                  ),
                                  SizedBox(
                                    height: 130,
                                  ),
                                  IconButton(
                                    onPressed:(){

                                      getImagefromcamera();

                                    },
                                    tooltip: "take image from camera" ,
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
                    padding: EdgeInsets.symmetric(horizontal:20,vertical:20),
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      
                      children: <Widget>[
                        TextField(
                          
                          decoration: InputDecoration(
                            icon: Icon(Icons.person,),
                            hintText: "User name.....",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                          ),
                          onChanged: (val) {
                            authorName = val;
                          },
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          decoration: InputDecoration(
                            icon: Icon(Icons.description,),
                            hintText: "#captions.....",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.yellow)),
                          ),
                          onChanged: (val) {
                            title = val;
                          },
                        ),
                         SizedBox(height: 10,),
                        TextField(
                        
                          decoration: InputDecoration(
                            icon: Icon(Icons.face),
                            hintText: "tags.....",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          onChanged: (val) {
                            desc = val;
                          },
                        ),
                        SizedBox(height:20),

                        GestureDetector(
                          onTap: (){
                            uploadBlog();
                          },
                          child: Icon
                          (Icons.cloud_upload,size: 100,))
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
