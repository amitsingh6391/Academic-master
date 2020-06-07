


import "package:flutter/material.dart";

import "package:Academicmaster/pages/homescreen.dart";
import "dart:async";
import "package:firebase_admob/firebase_admob.dart";
import "package:Academicmaster/services/admob_service.dart";
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main(){

  WidgetsFlutterBinding.ensureInitialized();
   FirebaseAdMob.instance.initialize(appId: AdMobService().getAdMobAppId());
  runApp(TheMitian());
}

class TheMitian extends StatefulWidget {
  @override
  _TheMitianState createState() => _TheMitianState();
}

class _TheMitianState extends State<TheMitian> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner:false,

      title:"Academic master",
      //home:Homescreen(),
      home:SplashScreen(),
      
    );
  }
}
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
 void initState(){

   super.initState();

   Timer(Duration(seconds: 4),(){
     Navigator.push(context, MaterialPageRoute(builder:(context)=>Homescreen(),));
    
     },
     );
 }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //backgroundColor: Color(0xFF0000A0),

      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(colors: [
            Colors.yellow,
            Colors.blue,
            Colors.green
          ])
        ),
             child: Column(
               children: <Widget>[
                 SizedBox
                 (
                   height: 400,
                 ),
                 SizedBox(
  width: 350.0,
  child: ColorizeAnimatedTextKit(
    // onTap: () {
    //     print("Tap Event");
    //   },
    text: [
      "Academic Master",
      
    ],
    textStyle: GoogleFonts.piedra(
        fontSize: 50.0, 
    
    ),
    colors: [
      Colors.redAccent[200],
      Colors.pink[200],

      //Colors.[100],
      Color(0xFF0000A0)

      
    ],
    textAlign: TextAlign.center,
    alignment: AlignmentDirectional.topStart // or Alignment.topLeft
  ),

),
SpinKitHourGlass(
  color:Colors.red,
  size: 100,
  


)
               ],
             ),
  ),

      
    );
  }
}
