import 'package:Academicmaster/notesandquantum/fourthyearsubject.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import "syllabus.dart";

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
      appBar: AppBar(
        title:Text("Fourth year",style:TextStyle(
         
         fontSize:40,
         fontFamily:"Dancing",
         fontWeight:FontWeight.bold,

        ),
        
        ),
        backgroundColor: Color(0xFF0000A0),
      ),
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
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Image.network(
                    "https://i.pinimg.com/originals/b2/28/ea/b228ea66fe3551190a3186c29d4e2c3a.gif"),
              ),
            ),
            AdmobBanner(
            adUnitId: "ca-app-pub-5023637575934146/3150365883",
             adSize: AdmobBannerSize.BANNER
             ),
            Expanded(
              flex: 1,
              child: Container(
                 // color: Colors.yellow,
                  child: Row(
                    children: <Widget>[
                      Image.network(
                          "https://cdn.clipart.email/5ee45e6ab3b1ea49ea8343740b596489_clipart-books-gif-animation-clipart-books-gif-animation-_1000-1000.gif"),
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
               // color: Colors.pink,
                height: 100,
               
                child: Row(
                    children: <Widget>[
                      Image.network(
                        
                          "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
                          width: 170,),
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
                
                child: Row(
                    children: <Widget>[
                      Image.network(
                          "https://cdn.dribbble.com/users/2367833/screenshots/7816190/media/b1aaf5c98510012b56422d1619dc62e8.gif",
                          width: 150,
                          height:200,),

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
             // color: Colors.pink,
              height: 100,
             
              child: Row(
        children: <Widget>[
          // Image.network(
            
          //     "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
          //     width: 170,),
          Icon(Icons.book,size: 100,color: Colors.pink,),
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



