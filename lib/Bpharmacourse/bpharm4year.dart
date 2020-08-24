import 'package:Academicmaster/Bpharmacourse/Bpharmnotes/fourthyearsubject.dart';
import 'package:Academicmaster/Bsccourse/Bscnotes/firstyearsubject.dart';
import 'package:Academicmaster/aktuerp.dart';
import 'package:Academicmaster/pages/homepage.dart';
import 'package:Academicmaster/pages/videotutriols.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//import "syllabus.dart";
  
//import "notesandquantum/Bpharma4yearsubject.dart";
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

class Bpharma4year extends StatefulWidget {
  @override
  _Bpharma4yearState createState() => _Bpharma4yearState();
}

class _Bpharma4yearState extends State<Bpharma4year> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bpharma4yearhome(),
    );
  }
}

class Bpharma4yearhome extends StatefulWidget {
  @override
  _Bpharma4yearhomeState createState() => _Bpharma4yearhomeState();
}

class _Bpharma4yearhomeState extends State<Bpharma4yearhome> {
 
 @override

Widget build(BuildContext context) {
    return Scaffold(

      body: Bpharma4yearbody(),
    );
  }
}

class Bpharma4yearbody extends StatefulWidget {
  @override
  _Bpharma4yearbodyState createState() => _Bpharma4yearbodyState();
}

class _Bpharma4yearbodyState extends State<Bpharma4yearbody> {

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
                child:Image.asset("images/bpharma.jpg",)
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

                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Bpharma4yearsubject(),));
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
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>Bpharma4yearpaper(),));
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Videotutorials(collection:"Bpharma4yearvideo"),));
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