import 'package:Academicmaster/notesandquantum/thirdyearsubject.dart';
import 'package:url_launcher/url_launcher.dart';

import "syllabus.dart";
  
import "notesandquantum/firstyearsubject.dart";
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";
import "package:flutter/material.dart";

class Thirdyear extends StatefulWidget {
  @override
  _ThirdyearState createState() => _ThirdyearState();
}

class _ThirdyearState extends State<Thirdyear> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Thirdyearhome(),
    );
  }
}

class Thirdyearhome extends StatefulWidget {
  @override
  _ThirdyearhomeState createState() => _ThirdyearhomeState();
}

class _ThirdyearhomeState extends State<Thirdyearhome> {
 
 @override

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Third year",
        style: TextStyle(
         // color: Colors.black,
          fontFamily: "Dancing",
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor:Color(0xFF0000A0) ),
      body: Thirdyearbody(),
    );
  }
}

class Thirdyearbody extends StatefulWidget {
  @override
  _ThirdyearbodyState createState() => _ThirdyearbodyState();
}

class _ThirdyearbodyState extends State<Thirdyearbody> {

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
      
      child: Container(

        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                
                child:Image.network(
                    "https://www.animatedimages.org/data/media/53/animated-book-image-0032.gif"),
              )
            ),

            AdmobBanner(
            adUnitId:"ca-app-pub-6517770398502887/9636666030",
             adSize: AdmobBannerSize.BANNER
             ),
             
 
            Expanded(
              flex: 1,
              child: Container(
               // color: Colors.yellow,
                child: Row(
                  children: <Widget>[

                    Image.network(
                       "https://cdn.clipart.email/5ee45e6ab3b1ea49ea8343740b596489_clipart-books-gif-animation-clipart-books-gif-animation-_1000-1000.gif",
                       
                       width: 100,),
                         
                       
                    
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
               // color: Colors.yellow,
                child: Row(
                  children: <Widget>[

                    // Image.network(
                    //    "https://cdn.clipart.email/5ee45e6ab3b1ea49ea8343740b596489_clipart-books-gif-animation-clipart-books-gif-animation-_1000-1000.gif",
                       
                    //    width: 100,),
                         
                       Icon(Icons.book,size: 100,color: Colors.pink,),
                    
                    FlatButton(
                      child: Text(
                        "Previous year paper",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>launchurl(),));
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
               // color: Colors.pink,
                height: 100,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
                      width: 170,
                    ),
                    FlatButton(
                      child: Text(
                        "Notes",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Thirdyearsubject(),));
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
               // color: Colors.green,
                child: Row(
                  children: <Widget>[
                    Image.network(
                      "https://cdn.dribbble.com/users/2367833/screenshots/7816190/media/b1aaf5c98510012b56422d1619dc62e8.gif",
                      width: 130,
                      height: 200,
                    ),
                    FlatButton(
                      child: Text(
                        "Important question",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>Thirdyearquantum(),));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      color: Colors.black12,
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