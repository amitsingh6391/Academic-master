import 'package:Academicmaster/notesandquantum/fourthyearsubject.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import "syllabus4.dart";

import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";
import "package:Academicmaster/view/viewmain.dart";



class Fourthyear extends StatefulWidget {
  @override
  _FourthyearState createState() => _FourthyearState();
}

class _FourthyearState extends State<Fourthyear> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Fourthyearhome(),
      
    );
  }
}
class Fourthyearhome extends StatefulWidget {
  @override
  _FourthyearhomeState createState() => _FourthyearhomeState();
}

class _FourthyearhomeState extends State<Fourthyearhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Fourthyearbody() 

      

      
      
    );
      
    
  }
}
class Fourthyearbody extends StatefulWidget {
  @override
  _FourthyearbodyState createState() => _FourthyearbodyState();
}

class _FourthyearbodyState extends State<Fourthyearbody> {

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
                color: Colors.white,
                child: Image.asset("images/1_-VK_9x-T9NfoUJ5D-tJl4w.png"),
              ),
            ),
            AdmobBanner(
            adUnitId: "ca-app-pub-5023637575934146/3150365883",
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
                 // color: Colors.yellow,
                  child: Row(
                    children: <Widget>[
                      Text("📚",
                        style: TextStyle(
                            fontSize: 100
                        ),),
                      FlatButton(
                        child: Text(
                          "Syllabus",
                          style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
                        ),
                        onPressed: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>Syllabus4(),));
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
               // color: Colors.pink,
                height: 100,
               
                child: Row(
                    children: <Widget>[
                      Icon(Icons.book,size: 100,color: Colors.pink,),
                      FlatButton(
                        child: Text(
                          "Notes",
                          style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
                        ),
                        onPressed: (){

                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Fourthyearsubject()));
                         
                        },
                      ),
                    ],
                  ),

              ),
            ),
            Expanded(
              flex: 1,

              child: Container(
              //  color: Colors.green,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color:Colors.black,
                        style: BorderStyle.solid
                    )),
                height: 100,
                
                child: Row(
                    children: <Widget>[
                      Text("📄",
                        style: TextStyle(
                            fontSize: 100
                        ),),

                      FlatButton(
                        child: Text(
                          "important question",
                          style: TextStyle(fontFamily: "Dancing", fontSize: 23,fontWeight: FontWeight.bold),
                        ),
                        onPressed: (){
                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewMain()));
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Fourthyearquantum()));
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
             // color: Colors.pink,
              height: 100,
             
              child: Row(
        children: <Widget>[
          // Image.network(
            
          //     "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
          //     width: 170,),
          Text("📑",
            style: TextStyle(
                fontSize: 100
            ),),
          FlatButton(
            child: Text(
              "Previous year paper",
              style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
            ),
            onPressed: (){
             // Navigator.push(context, MaterialPageRoute(builder: (context)=>launchurl(),));
              launchurl();
            },
          ),
        ],
                ),

            ),
            ),
          ],
        ),
      ),

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



