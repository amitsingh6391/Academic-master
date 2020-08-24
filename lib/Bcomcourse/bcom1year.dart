//import 'package:Academicmaster/Bcomacourse/Bcomnotes/firstyearsubject.dart';

import 'package:Academicmaster/Bcomcourse/Bcomnotes/firstyearsubject.dart';
import 'package:Academicmaster/pages/videotutriols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

class Bcom1year extends StatefulWidget {
  @override
  _Bcom1yearState createState() => _Bcom1yearState();
}

class _Bcom1yearState extends State<Bcom1year> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bcom1yearhome(),
    );
  }
}

class Bcom1yearhome extends StatefulWidget {
  @override
  _Bcom1yearhomeState createState() => _Bcom1yearhomeState();
}

class _Bcom1yearhomeState extends State<Bcom1yearhome> {
 
 @override

Widget build(BuildContext context) {
    return Scaffold(

      body: Bcom1yearbody(),
    );
  }
}

class Bcom1yearbody extends StatefulWidget {
  @override
  _Bcom1yearbodyState createState() => _Bcom1yearbodyState();
}

class _Bcom1yearbodyState extends State<Bcom1yearbody> {

  //initilzed adds

  final ams = AdMobService(); //call admobclass from services

  

   @override
  void initState() {               //intilazied the appid
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  
 
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      child: Container(

        child: Column(
          children: <Widget>[
            Container(
          height: 20,
              decoration: BoxDecoration(
                color: Colors.white
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child:Image.asset("images/bcom1.png",)
      )
            ),

            AdmobBanner(
            adUnitId:"ca-app-pub-5023637575934146/2815076541",
             adSize: AdmobBannerSize.BANNER
             ),
             
 
            
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color:Colors.black,
                        style: BorderStyle.solid
                    )),
                height: 100,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.book,size: 100,color: Colors.pink,),

                    FlatButton(
                      child: Text(
                        "Notes",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                             fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {

                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Bcom1yearsubject(),));
                      },
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color:Colors.black,
                        style: BorderStyle.solid
                    )),
                height: 100,
                child: Row(
                  children: <Widget>[
                    // Image.network(
                    //   "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
                    //   width: 170,
                    // ),
                    Text("📄",
                      style: TextStyle(
                          fontSize: 100
                      ),),
                    FlatButton(
                      child: Text(
                        "Previous year paper",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>Bcom1yearpaper(),));
                      // launchurl();
                      },
                    ),
                  ],
                ),
              ),
            ),
             Expanded(
            flex: 1,
            child: Container(
             // color: Colors.pink,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color:Colors.black,
                      style: BorderStyle.solid
                  )),
              height: 200,
             
              child: Row(
        children: <Widget>[

          Text("🎥",
            style: TextStyle(
                fontSize: 80
            ),),
          FlatButton(
            child: Text(
              "video lecture",
              style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Videotutorials(collection:"Bcom1yearvideo"),));
            },
          ),
        ],
                ),

            ),
          ),
            
             
          ],
        ),
      ),
     // color: Colors.black12,
    );
  }
launchurl() async{
 const url = "https://abesit.in/library/question-paper-bank/";
 if (await canLaunch(url)){
   await launch(url);
 }else{
   throw " could not launch $url";
 }

}
}