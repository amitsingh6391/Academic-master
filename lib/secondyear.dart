import 'package:Academicmaster/os.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import "syllabus2.dart";
import 'notesandquantum/secondyearsubject.dart';
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";  //git install hi na//thik hi



class Secondyear extends StatefulWidget {
  @override
  _SecondyearState createState() => _SecondyearState();
}

class _SecondyearState extends State<Secondyear> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,//mgr vs code se link nahi hai  //github open kr 
      
      home: Secondyearhome(),//merpe login bhi nahi hua hai  //account hi na//
      
    );
  }
}
class Secondyearhome extends StatefulWidget {
  @override
  _SecondyearhomeState createState() => _SecondyearhomeState();
}

class _SecondyearhomeState extends State<Secondyearhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      
      body:Secondyearbody()
    
      );
      
    
  }
}

class Secondyearbody extends StatefulWidget {
  @override
  _SecondyearbodyState createState() => _SecondyearbodyState();
}

class _SecondyearbodyState extends State<Secondyearbody> {

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
          color: Colors.white,
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
              child: Image.asset("images/1_-VK_9x-T9NfoUJ5D-tJl4w.png",)
            ),
          ),

          //here we place the banner ads
          
           AdmobBanner(
            adUnitId: "ca-app-pub-5023637575934146/2815076541",
             adSize: AdmobBannerSize.BANNER
             ),


          

       

          Expanded(
            flex: 1,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color:Colors.black,
                      style: BorderStyle.solid
                  )),
                //color: Colors.yellow,
                child: Row(
                  children: <Widget>[
                      Text("📚",
                        style: TextStyle(
                            fontSize: 80
                        ),),
                FlatButton(
                  child: Text(
                    "Syllabus",
                    style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Syllabus2(),));
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
            height: 200,
                   // color: Colors.pink,


            child: Row(
              children: <Widget>[
                Icon(Icons.book,size: 80,color: Colors.pink,),
                FlatButton(
                  child: Text(
                    "Notes",
                    style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Secondyearsubject(),));
                  },
                ),
              ],
                      ),

                  ),
                ),




           Expanded(
            flex: 1,
            child: Container(decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color:Colors.black,
                    style: BorderStyle.solid
                )),
              height: 200,
             // color: Colors.pink,

             
              child: Row(
        children: <Widget>[
          // Image.network(
            
          //     "https://media1.giphy.com/media/l1J9HWBKLp20YfNAY/source.gif",
          //     width: 170,),
          Text("📄",
            style: TextStyle(
                fontSize: 80
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Oslecture(),));
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
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color:Colors.black,
                      style: BorderStyle.solid
                  )),
              height: 200,
              child: Row(
        children: <Widget>[
          Text("📑",
            style: TextStyle(
                fontSize: 80
            ),),

          FlatButton(
            child: Text(
              "Important question",
              style: TextStyle(fontFamily: "Dancing", fontSize: 23,fontWeight: FontWeight.bold),
            ),
            onPressed: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Secondyearquantum(),),);
            },
          ),
        ],
                ),
            ),
          ),
      ],
    ),
          ),
          color:Colors.black12
      );

      

      
      
    
  }
  //launchurl
  launchurl() async{
 const url = "https://abesit.in/library/question-paper-bank/";
 if (await canLaunch(url)){
   await launch(url);
 }else{
   throw " could not launch $url";
 }

}
}



//neeraj code here...

// import 'package:flutter/material.dart';
// import "syllabus.dart";
// import 'notesandquantum/secondyearsubject.dart';
// import 'package:admob_flutter/admob_flutter.dart';
// import "package:TheMitian/services/admob_service.dart";



// class Secondyear extends StatefulWidget {
//   @override
//   _SecondyearState createState() => _SecondyearState();
// }

// class _SecondyearState extends State<Secondyear> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(

//       debugShowCheckedModeBanner: false,
      
//       home: Secondyearhome(),
      
//     );
//   }
// }
// class Secondyearhome extends StatefulWidget {
//   @override
//   _SecondyearhomeState createState() => _SecondyearhomeState();
// }

// class _SecondyearhomeState extends State<Secondyearhome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body:Secondyearbody(),
//       backgroundColor: Colors.black,
//       );
      
    
//   }
// }

// class Secondyearbody extends StatefulWidget {
//   @override
//   _SecondyearbodyState createState() => _SecondyearbodyState();
// }

// class _SecondyearbodyState extends State<Secondyearbody> {

//   final ams = AdMobService(); //call admobclass from services

  

//    @override
//   void initState() {               //intilazied the appid
//     super.initState();
//     Admob.initialize(ams.getAdMobAppId());
//   }


  

//   @override
//   Widget build(BuildContext context) {
    
    
    
//     return Container(
//       child: Container(
        
//         child: Column(
//           children: <Widget>[
//             Container(
//               height: 40,
//             ),
//             Container(
//               child:Image.asset("images/ezgif.com-gif-maker.gif")
//             ),

//             AdmobBanner(
//             adUnitId:"ca-app-pub-5023637575934146/5831201283",
//              adSize: AdmobBannerSize.BANNER
//              ),
             
            
//             Expanded(
//               flex: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide( //                   <--- left side
//                       color: Color(0xff64B6FF),
//                       width: 1.0,
//                     ),
//                     top: BorderSide( //                    <--- top side
//                       color: Color(0xff64B6FF),
//                       width: 4.0,
//                     ),
//                   ),
//                 ),
                
//                 child: Row(
//                   children: <Widget>[
//                     Text("📃",style: TextStyle(
//                       fontSize: 120
//                     )),
//                         Container(
//                           width: 20,
//                         ),
//                         Column(
//                           children:<Widget>[
//                             Container(
//                               height: 20,
//                             ),
//                             Container(
//                               height: 120,
//                               width: 160,
//                               child: Text("Click on the below button for  latest syllabus of 2nd year { all  subjects}",
//                               style: TextStyle(color: Colors.white,
//                               fontSize: 20),
//                               ),
//                             ),
//                             Container(
//                               height: 10,
//                             ),
//                     RaisedButton(
//                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
//                         padding: EdgeInsets.all(0.0),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(30.0)
//                           ),
//                       child:Container(
//                         constraints: BoxConstraints(maxWidth: 120.0, maxHeight: 40.0),
//                       alignment: Alignment.center,
//                       child: Text( "Syllabus",
//                         style: TextStyle(
//                           color: Colors.white,
//                             fontFamily: "Dancing",
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),)
//                       ), 
//                       onPressed: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Syllabus2(),));

//                       },
//                     ),])
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 decoration: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide( //                   <--- left side
//                       color: Color(0xff64B6FF),
//                       width: 4.0,
//                     ),
//                     top: BorderSide( //                    <--- top side
//                       color: Colors.white,
//                       width: 1.0,
//                     ),
//                   ),
//                 ),
              
                
//                 child: Row(
//                   children: <Widget>[
//                     Image.network(
//                       "https://www.animatedimages.org/data/media/53/animated-book-image-0032.gif",
//                       width: 100,
//                     ),
//                      Container(
//                           width: 40,
//                         ),
//                         Column(
//                           children:<Widget>[
//                             Container(
//                               height: 20,
//                             ),
//                             Container(
//                               height: 120,
//                               width: 160,
//                               child: Text(" click on  'NOTES' for the most amazing collection of the study matterial ",
//                               style: TextStyle(color: Colors.white,
//                               fontSize: 20),
//                               ),
//                             ),
//                             Container(
//                               height: 10,
//                             ),
//                     RaisedButton(
//                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
//                         padding: EdgeInsets.all(0.0),
//                         child: Ink(
//                           decoration: BoxDecoration(
//                               gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
//                                 begin: Alignment.centerLeft,
//                                 end: Alignment.centerRight,
//                               ),
//                               borderRadius: BorderRadius.circular(30.0)
//                           ),
//                       child:Container(
//                         constraints: BoxConstraints(maxWidth: 120.0, maxHeight: 40.0),
//                       alignment: Alignment.center,
//                       child: Text( "Notes",
//                         style: TextStyle(
//                           color: Colors.white,
//                             fontFamily: "Dancing",
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),)
//                       ), 
//                       onPressed: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Secondyearsubject(),));

//                       },
//                     ),])
//                   ],
//                 ),
//               ),
//             ),
//          Expanded(
//            flex: 1,

//             child: Container(
//               color: Colors.green,
              
//               child: Row(
//        children: <Widget>[
//          Image.network(
//              "https://cdn.dribbble.com/users/2367833/screenshots/7816190/media/b1aaf5c98510012b56422d1619dc62e8.gif",
//              width: 150,
//               height:200,),

//          FlatButton(
//            child: Text(
//              "Quantum",
//              style: TextStyle(fontFamily: "Dancing", fontSize: 50,fontWeight: FontWeight.bold),
//            ),
//             onPressed: (){
//               Navigator.push(context,MaterialPageRoute(builder: (context)=>Secondyearquantum(),),);
//            },
//          ),
//         ],
//                ),
//             ),
//          ),
//       ],
//     ),
//           ),
//       );

      

      
      
    
//   }
// }
