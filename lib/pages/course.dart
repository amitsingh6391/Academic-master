import 'dart:io';
import 'package:Academicmaster/Bsccourse/selectbscyear.dart';
import 'package:Academicmaster/Bcomcourse/selectbcomyear.dart';
import 'package:Academicmaster/Bpharmacourse/selectbpharmyear.dart';
import 'package:Academicmaster/dpharmacourse/dpharmayear.dart';
import 'package:Academicmaster/branch.dart';
import 'package:Academicmaster/pages/homepage.dart';
import 'package:Academicmaster/pages/posts.dart';

import 'package:Academicmaster/selectyouryear/civilyear.dart';
import 'package:Academicmaster/selectyouryear/eceyear.dart';
import 'package:Academicmaster/selectyouryear/mechnicalyear.dart';
import 'package:Academicmaster/services/admob_service.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
//import "package:animated_text_kit/animated_text_kit.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Course extends StatefulWidget {//krna //kr rha open 
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {

   final ams = AdMobService(); 
   String cuserid;//call admobclass for use fntction

  @override
  void initState() {
    //intilazied the appid
    super.initState();
     getCurrentUser();
    Admob.initialize(ams.getAdMobAppId());
  }


getCurrentUser() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    print(uid);
    setState(() {
      cuserid = uid.toString();
    });
  }

 offline() async{

    await Firestore.instance.collection("onlinestatus").document(cuserid).updateData({

      "online":"offline"

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

        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed:(){
 urllauncher();

          },
          child:Image(image:AssetImage("images/whatsup.jpg"))
        ),
          body: SafeArea(
                      child: SingleChildScrollView(
        child: Column(
            children: [
             

                Stack(
                                  children:[ 
                                    Container(
                    height:size.height * 0.25,
                    width: size.width * 1,
                    child: Card(
                      child: Image(fit:BoxFit.fill,
                        image:NetworkImage("https://www.downingstudents.com/wp-content/uploads/2017/04/Tech-Study-banner.jpg"))),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left:50,right:50,top:50),
                    child: Text("Academic Master",style: TextStyle(fontFamily: "Dancing",
                      fontSize:30,fontWeight:FontWeight.bold),),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left:70,right:50,top:90),
                    child: Text("A new way of Learning",style: TextStyle(
                      fontSize:20,fontWeight:FontWeight.bold,fontFamily: "Dancing",),),
                  ),

                                  ]),

              Container(
                // height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
               // color: Colors.black,
                child: Column(
                  children: <Widget>[
                    Container(
                     // padding: EdgeInsets.
                      color: Colors.transparent,
                      height: 60,
                    child: Text("Select your Course",
                      style: GoogleFonts.grenze(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    ),
            Row(
              children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyContainer("images/btech.png", context),
                        ),
           // box(),
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyContainer("images/bpharma.jpg", context),
                    ),
                    //box(),
              ],
            ),

             box(),
                    Row(
              children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyContainer("images/bse.png", context),
                        ),
           
                    
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyContainer("images/bcom1.png", context),
                    ),
                   
              ],
            ),


             box(),

               Row(
              children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyContainer("images/dpharmapic.jpg", context),
                        ),
           
                    
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: MyContainer("images/bcom1.png", context),
                    // ),
                   
              ],
            ),
                   
                  ],
                ),
              ),
            ],
        ),
      ),
          )),
    );
  }

  Container MyContainer(String Course, context) {

    Size size = MediaQuery.of(context).size;
    return Container(
     // padding: EdgeInsets.all(20),
      height:MediaQuery.of(context).size.height/4,
      width:size.width*0.45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.yellow,
          width: 4),
          color: Colors.black),
      child: GestureDetector(

        onTap: () {
          if (Course == "images/bse.png") {

           
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Bscyear()));
          } 
          else if (Course == "images/bcom1.png") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context)=>Bcomyear()));
          } 
          else if (Course == "images/bpharma.jpg") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Bpharmyear()));
          } 
          else if (Course == "images/dpharmapic.jpg") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Dpharmayear()));
          }
          else if (Course == "images/btech.png") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Branch()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Branch()));
          }
        },
        
        child: Center(
         child:Container(
           child: Image(
             image:AssetImage(Course),height:MediaQuery.of(context).size.height/2,
             width:MediaQuery.of(context).size.width/2,fit:BoxFit.fill
           ),
         )
        ),
      ),
    );
  }

  SizedBox box() {
    return SizedBox(
      height: 20,
      width: 20,
    );
  }

  urllauncher() async {
  const url = 'https://chat.whatsapp.com/FJi7AJUMw9VL8fwEM9dmTR';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}  

