import 'package:Academicmaster/aktuerp.dart';
import 'package:Academicmaster/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import "syllabus.dart";
  
import "notesandquantum/firstyearsubject.dart";
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

class Firstyear extends StatefulWidget {
  @override
  _FirstyearState createState() => _FirstyearState();
}

class _FirstyearState extends State<Firstyear> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Firstyearhome(),
    );
  }
}

class Firstyearhome extends StatefulWidget {
  @override
  _FirstyearhomeState createState() => _FirstyearhomeState();
}

class _FirstyearhomeState extends State<Firstyearhome> {
 
 @override

Widget build(BuildContext context) {
    return Scaffold(

      body: Firstyearbody(),
    );
  }
}

class Firstyearbody extends StatefulWidget {
  @override
  _FirstyearbodyState createState() => _FirstyearbodyState();
}

class _FirstyearbodyState extends State<Firstyearbody> {

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
                child:Image.asset("images/1_-VK_9x-T9NfoUJ5D-tJl4w.png",)
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

                child: Row(
                  children: <Widget>[

                   Text("📚",
                   style: TextStyle(
                     fontSize: 100
                   ),),
                         
                       
                    
                    FlatButton(
                      child: Text(
                        "Syllabus",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Viewpdf(),));

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
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Firstyearsubject(),));
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
                       // Navigator.push(context,MaterialPageRoute(builder: (context)=>QuestionPaper(),));
                       launchurl();
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
                child: Row(
                  children: <Widget>[
                    Text("📑",
                      style: TextStyle(
                          fontSize: 100
                      ),),
                     
                    FlatButton(
                      child: Text(
                        "Important question",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Firstyearquantum(),));
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


