import 'dart:io';

import 'package:Academicmaster/firstslide.dart';
import 'package:Academicmaster/firstyear.dart';
import 'package:Academicmaster/pages/homepage.dart';
import 'package:Academicmaster/selectyouryear/civilyear.dart';
import 'package:Academicmaster/selectyouryear/eceyear.dart';
import 'package:Academicmaster/selectyouryear/mechnicalyear.dart';
import "package:flutter/material.dart";
import "package:animated_text_kit/animated_text_kit.dart";
import 'ece/fetchecedata.dart';
import 'mechnical/fetchsubject.dart';

class Branch extends StatelessWidget {
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

          //  drawer: NavDrawer(),
          //  appBar:AppBar(
          //    backgroundColor: Color(0xFF00bbf8),
          //  ),
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
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
                      fontSize: 100,
                      fontFamily: "Dancing",
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                  textAlign: TextAlign.start,
                  alignment: AlignmentDirectional.center,
                ),
              ),
            ),

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: TextLiquidFill(
                boxHeight: 100,
                loadDuration: Duration(seconds: 10),
                text: "Select your Branch--",
                waveColor: Colors.amber,
                boxBackgroundColor: Colors.black12,
                textStyle: TextStyle(
                    fontSize: 40,
                    fontFamily: "Dancing",
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            ),
            //  Box(context),

            Container(
              // height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white12,
              child: Column(
                children: <Widget>[
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
      )),
    );
  }

//define year branch
  Container MyContainer(String branch, context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 155,
      width: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.black12,
            ],
          )),
      child: GestureDetector(
        onTap: () {
          if(branch=="Computer science"){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
          }
         
          else if(branch=="Civil"){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) =>Civilyear()));
          }
           else if(branch=="Mechnical"){
              Navigator.push(
              context, MaterialPageRoute(builder: (context) =>Mechnicalyear()));
          }
           else if(branch=="ECE"){
             Navigator.push(
              context, MaterialPageRoute(builder: (context) =>Eceyear()));
          }
          else{
           Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
          }
        },
        child: Center(
          child: Text(
            branch,
            style: TextStyle(
                fontFamily: "Dancing", fontSize: 30, color: Colors.white),
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

  //define animation

}
