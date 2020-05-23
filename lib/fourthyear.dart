import 'package:Academicmaster/notesandquantum/fourthyearsubject.dart';
import 'package:flutter/material.dart';
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
        backgroundColor: Colors.black12,
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
            // AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/6369708590",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
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
                          style: TextStyle(fontFamily: "Dancing", fontSize: 25,fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
      color: Colors.black12,
    );
      
    
  }
}



//neraj code here....


// import 'package:TheMitian/notesandquantum/fourthyearsubject.dart';
// import 'package:flutter/material.dart';
// import "syllabus.dart";

// import 'package:admob_flutter/admob_flutter.dart';
// import "package:TheMitian/services/admob_service.dart";
// import "package:TheMitian/view/viewmain.dart";



// class Fourthyear extends StatefulWidget {
//   @override
//   _FourthyearState createState() => _FourthyearState();
// }

// class _FourthyearState extends State<Fourthyear> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Fourthyearhome(),
      
//     );
//   }
// }
// class Fourthyearhome extends StatefulWidget {
//   @override
//   _FourthyearhomeState createState() => _FourthyearhomeState();
// }

// class _FourthyearhomeState extends State<Fourthyearhome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
      
//       body:Fourthyearbody(),
//       backgroundColor: Colors.black, 

      

      
      
//     );
      
    
//   }
// }
// class Fourthyearbody extends StatefulWidget {
//   @override
//   _FourthyearbodyState createState() => _FourthyearbodyState();
// }

// class _FourthyearbodyState extends State<Fourthyearbody> {

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
//                               child: Text("Click on the below button for  latest syllabus of 4th year { all  subjects}",
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
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Syllabus4(),));

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
//                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Fourthyearsubject(),));

//                       },
//                     ),])
//                   ],
//                 ),
//               ),
//             ),
//            Expanded(
//              flex: 1,

//              child: Container(
//                color: Colors.green,
               
//                child: Row(
//                    children: <Widget>[
//                      Image.network(
//                          "https://cdn.dribbble.com/users/2367833/screenshots/7816190/media/b1aaf5c98510012b56422d1619dc62e8.gif",
//                          width: 150,
//                          height:200,),

//                      FlatButton(
//                        child: Text(
//                          "Quantum",
//                          style: TextStyle(fontFamily: "Dancing", fontSize: 50,fontWeight: FontWeight.bold),
//                        ),
//                        onPressed: (){
//                         // Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewMain()));
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Fourthyearquantum()));
//                        },
//                      ),
//                     ],
//                  ),
//              ),
//            ),
//           ],
//         ),
//       ),
//     );
      
    
//   }
// }