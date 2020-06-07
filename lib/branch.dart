import 'package:Academicmaster/firstslide.dart';
import 'package:Academicmaster/firstyear.dart';
import 'package:Academicmaster/pages/homepage.dart';
import "package:flutter/material.dart";
import "package:animated_text_kit/animated_text_kit.dart";

class Branch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                    MyContainer("Electrical", context),
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
    ));
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
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homepage()));
        },
        child: Center(
          child: Text(
            branch,
            style: TextStyle(
                fontFamily: "Dancing", fontSize: 35, color: Colors.white),
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
