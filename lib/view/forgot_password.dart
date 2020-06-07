

import 'dart:io';

import 'package:Academicmaster/services/crud.dart';
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:link_text/link_text.dart';

import 'helper/helperfunction.dart';

class MyApps extends StatefulWidget {
  @override
  _MyAppsState createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  String firstButtonText = 'Take photo';
  String secondButtonText = 'Record video';
  double textSize = 20;
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                child: SizedBox.expand(
                  child: RaisedButton(
                    color: Colors.blue,
                    onPressed: _saveNetworkImage,
                    child: Text(firstButtonText,
                        style:
                            TextStyle(fontSize: textSize, color: Colors.white)),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                  child: SizedBox.expand(
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: _recordVideo,
                  child: Text(secondButtonText,
                      style: TextStyle(
                          fontSize: textSize, color: Colors.blueGrey)),
                ),
              )),
              flex: 1,
            ),
            Container(
                child: FlatButton(
              child: Text('Share text'),
              onPressed: () async => await _shareText(),
            ))
          ],
        ),
      ),
    ));
  }

  void _takePhoto() async {
    ImagePicker.pickImage(source: ImageSource.camera)
        .then((File recordedImage) {
      if (recordedImage != null && recordedImage.path != null) {
        setState(() {
          firstButtonText = 'saving in progress...';
        });
        GallerySaver.saveImage(recordedImage.path).then((String) {
          setState(() {
            firstButtonText = 'image saved!';
          });
        });
      }
    });
  }

  void _recordVideo() async {
    ImagePicker.pickVideo(source: ImageSource.camera)
        .then((File recordedVideo) {
      if (recordedVideo != null && recordedVideo.path != null) {
        setState(() {
          secondButtonText = 'saving in progress...';
        });
        GallerySaver.saveVideo(recordedVideo.path).then((String) {
          setState(() {
            secondButtonText = 'video saved!';
          });
        });
      }
    });
  }

  void _saveNetworkVideo() async {
    String path =
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4';
    GallerySaver.saveVideo(path).then((bool success) {
      setState(() {
        print('Video is saved');
      });
    });
  }

  void _saveNetworkImage() async {
    String path =
        'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';
    GallerySaver.saveImage(path).then(
      (bool success) {
        setState(
          () {
            print('Image is saved');
          },
        );
      },
    );
  }
}

Future<void> _shareText() async {
  try {
    Share.text('my text title',
        'This is my text to share with other applications.', 'text/plain');
  } catch (e) {
    print('error: $e');
  }
}

//here we dife user profilr....



  SizedBox Animation(context,String x,y){
    return
    SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TyperAnimatedTextKit(
                pause: Duration(milliseconds: 1000),
                //totalRepeatCount: 1000,
               
                text: [x+ " :-- " +y],
                textStyle: TextStyle(
                    fontSize: 50,
                    fontFamily: "Dancing",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.center,
              ),
            );
  }


class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    getUserProfile();
    super.initState();

  }

  getUserProfile() async{
     
      Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    Constants.myEmail = await HelperFunctions.getUserEmailSharedPreference();
    Constants.myCollege = await HelperFunctions.getUserCollegeSharedPreference();


  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
          child: Container(
            color:Colors.cyan,
        child:Column(
          children: <Widget>[
          
            //SizedBox(height:30),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
                          child: Row(
                children: <Widget>[
                  Icon(Icons.cancel,size: 50,),
                ],
              ),
            ),
            Card(
              color: Colors.cyan,
              elevation: 10,
              margin: EdgeInsets.all(50),
              child: Center(child: Text("User Profile",style: TextStyle(fontSize:40),)),
            ),
            Card(
              elevation: 10,
        child: CircleAvatar(
                backgroundImage:AssetImage("images/thirdgif3.gif"),
                radius:100
              ),
            ),

            Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  child: Card(
                    elevation: 10,
                    color: Colors.cyan,
                    margin: EdgeInsets.all(20),
                    child: Icon(Icons.person)),
                ),
                Card(
                  elevation: 10,
                  color:Colors.cyan,
                  child: Text("USERname")),
                Expanded(
                                  child: Container(
                    height: 80,
                  
                    child: Card(
                      elevation: 10,
                      color: Colors.cyan,
                      child: Text(Constants.myName,style: TextStyle(
                      fontSize:30
                    ),))),
                ),
              ],
            ),
             Row(
              children: <Widget>[
                Container(
                  height: 80,
                  width: 80,
                  child: Card(
                    elevation: 10,
                    color: Colors.cyan,
                    margin: EdgeInsets.all(20),
                    child: Icon(Icons.email)),
                ),
                Card(
                  elevation: 10,
                  color:Colors.cyan,
                  child: Text("USER EMAIL")),
                Expanded(
                                  child: Container(
                    height: 80,
                  
                    child: Card(
                      elevation: 10,
                      color: Colors.cyan,
                      child: Text(Constants.myEmail,style: TextStyle(
                      fontSize:30
                    ),))),
                ),
              ],
            ),

            
          

          ],
        )
      ),
    );
  }
}