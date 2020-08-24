import 'dart:io';
import 'package:Academicmaster/pages/homepage.dart';
import 'package:Academicmaster/pages/posts.dart';

import 'package:Academicmaster/selectyouryear/civilyear.dart';
import 'package:Academicmaster/selectyouryear/eceyear.dart';
import 'package:Academicmaster/selectyouryear/mechnicalyear.dart';
<<<<<<< HEAD
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

class Branch extends StatefulWidget {//krna //kr rha open 
  @override
  _BranchState createState() => _BranchState();
}

class _BranchState extends State<Branch> {

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
    return Scaffold(

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
                  height:size.height * 0.2,
                  width: size.width * 1,
                  child: Card(
                    child: Image(fit:BoxFit.fill,
                      image:NetworkImage("https://www.downingstudents.com/wp-content/uploads/2017/04/Tech-Study-banner.jpg"))),
=======
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import "package:animated_text_kit/animated_text_kit.dart";
import 'package:google_fonts/google_fonts.dart';

class Branch extends StatelessWidget {//krna //kr rha open 
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

          //  drawer: NavDrawer(),
          //  appBar:AppBar(
          //    backgroundColor: Color(0xFF00bbf8),
          //  ),
     
          body: SingleChildScrollView(
        child: Column(
          children: [
            /*SizedBox(
              height: 30,
            ),*/
            /*Container(
              height: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(),
                  gradient: LinearGradient(
                      colors: [Color(0xFF00195e), Color(0xFF00bbf8)])),
              // color: Color(0xFF0000A0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ScaleAnimatedTextKit(
                  pause: Duration(milliseconds: 1000),
                  totalRepeatCount: 1000,
                  onTap: () {
                    print("tap event");
                  },
                  text: ["Academic", "master"],
                  textStyle: TextStyle(
                      fontSize: 90,
                      fontFamily: "Dancing",
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.center,
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
                ),

<<<<<<< HEAD
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
=======
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextLiquidFill(
                boxHeight: 100,
                loadDuration: Duration(seconds: 10),
                text: "Select your Branch--",
                waveColor: Colors.greenAccent,
                boxBackgroundColor: Colors.white,
                textStyle: TextStyle(
                    fontSize: 40,
                    fontFamily: "Dancing",
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            //  Box(context),
              */
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026

            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
<<<<<<< HEAD
             // color: Colors.black,
              child: Column(
                children: <Widget>[
                  Container(
                   // padding: EdgeInsets.
                    color: Colors.transparent,
                    height: 60,
=======
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 50, 30, 30),
                    color: Colors.transparent,
                    height: 160,
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
                  child: Text("Select your Branch",
                    style: GoogleFonts.grenze(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 30,
<<<<<<< HEAD
                        color: Colors.black),
=======
                        color: Colors.yellow[200]),
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
                  ),
                  ),
                  Row(
                    children: <Widget>[
                      MyContainer("Computer science", context),
          box(),
                      
                      MyContainer("Mechnical", context),
                    ],
                  ),
                  box(),
                  Row(
                    children: <Widget>[
                      MyContainer("Civil", context),
                      box(),
                      MyContainer("ECE", context),
                    ],
                  ),
                  box(),
                  Row(
                    children: <Widget>[
                      MyContainer("I T", context),
                      box(),
                      MyContainer("Chemical eng..", context),
                    ],
                  ),
                ],
              ),
            ),
          ],
      ),
    ),
        ));
  }

  Container MyContainer(String branch, context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 155,
      width: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.yellow,
          width: 4),
<<<<<<< HEAD
          color: Colors.black),
=======
          color: Colors.white),
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
      child: GestureDetector(
        onTap: () {
          if (branch == "Computer science") {

           
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          } else if (branch == "Civil") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Civilyear()));
          } else if (branch == "Mechnical") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Mechnicalyear()));
          } else if (branch == "ECE") {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Eceyear()));
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Homepage()));
          }
        },
        child: Center(
          child: Text(
            branch,
            style: TextStyle(
                fontFamily: "Dancing", fontSize: 30, color: Colors.black),
          ),
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

<<<<<<< HEAD
  urllauncher() async {
  const url = 'https://chat.whatsapp.com/FJi7AJUMw9VL8fwEM9dmTR';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
}  





//for main page..


=======
  //define animation

}  //kch change ni  na krna hi is m //ok
//nAHI
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
