// import 'package:TheMitian/aktuerp.dart';
// import "package:flutter/material.dart";
// import 'package:flutter/rendering.dart';

// import 'package:TheMitian/firstyear.dart';

// import "package:TheMitian/secondyear.dart";

// import "package:TheMitian/thirdyear.dart";

// import "package:TheMitian/fourthyear.dart";
// import "package:TheMitian/services/admob_service.dart";
// import "package:firebase_admob/firebase_admob.dart";

// import "package:TheMitian/firstslide.dart";

// import 'package:admob_flutter/admob_flutter.dart';
// import "package:TheMitian/services/admob_service.dart";

// class Homepage extends StatefulWidget {
//   @override
//   _HomepageState createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavDrawer(),
//       appBar: AppBar(
//         title: Text(
//           "Mitia",
//           style: TextStyle(
//               fontSize: 30,
//               fontFamily: "Dancing",
//               fontWeight: FontWeight.bold,
//               color: Colors.black),
//         ),
//         backgroundColor: Colors.redAccent,
//       ),
//       backgroundColor: Colors.deepPurple,
//       body: Homebody(),
//     );
//   }
// }

// class Homebody extends StatefulWidget {
//   @override
//   _HomebodyState createState() => _HomebodyState();
// }

// class _HomebodyState extends State<Homebody> {
//   final ams = AdMobService(); //call admobclass for use fntction

//   @override
//   void initState() {               //intilazied the appid
//     super.initState();
//     Admob.initialize(ams.getAdMobAppId());
//   }


//   @override
//   Widget build(BuildContext context) {
//     InterstitialAd newTripAd =
//         ams.getnewTripInterstitial();   //first save in the variablesto use adds
     
//     newTripAd.load();

//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image(
//                     image: AssetImage("images/thirdgif3.gif"),
//                     fit: BoxFit.fill,
//                     height: 300,
//                     width: 344,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Row(
//             children: <Widget>[
//               Container(
//                 color: Colors.pinkAccent,
//                 height: 70,
//                 width: 360,
//                 child: Center(
//                     child: Text(
//                   "It's for technocrates",
//                   style: TextStyle(fontSize: 40, fontFamily: "Dancing"),
//                 )),
//               ),
//             ],
//           ),

//            AdmobBanner(
//             adUnitId: ams.getBannerAdId(),
//              adSize: AdmobBannerSize.BANNER
//              ),
             
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   height: 150,
//                   width: 160,
//                   color: Colors.green,
//                   child: FloatingActionButton(
//                     heroTag: 20,
//                     child: Text(
//                       "First year",
//                       style: TextStyle(
//                           fontFamily: "Dancing",
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     backgroundColor: Colors.red,
//                     onPressed: () {

                       
//                       newTripAd.show(                   //show the full screen adds when second year pressed
//                         anchorType: AnchorType.bottom,
//                         anchorOffset: 0.0,
//                         horizontalCenterOffset: 0.0,
//                       );

//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Firstyear(),
//                           ));
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 150,
//                   width: 10.0,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                   child: FloatingActionButton(
//                     heroTag: 30,
//                     child: Text(
//                       "Sceond year",
//                       style: TextStyle(
//                           fontSize: 34,
//                           fontFamily: "Dancing",
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     onPressed: () {
//                       newTripAd.show(                   //show the full screen adds when second year pressed
//                         anchorType: AnchorType.bottom,
//                         anchorOffset: 0.0,
//                         horizontalCenterOffset: 0.0,
//                       );

//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Secondyear(),
//                           ));
//                     },
//                     backgroundColor: Colors.yellow,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: <Widget>[
//                 Container(
//                   height: 150,
//                   width: 160,
//                   color: Colors.green,
//                   child: FloatingActionButton(
//                     heroTag: 40,
//                     child: Center(
//                       child: Text(
//                         "Third year",
//                         style: TextStyle(
//                             fontSize: 37,
//                             fontFamily: "Dancing",
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     onPressed: () {

                       
//                       newTripAd.show(                   //show the full screen adds when second year pressed
//                         anchorType: AnchorType.bottom,
//                         anchorOffset: 0.0,
//                         horizontalCenterOffset: 0.0,
//                      );
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Thirdyear(),
//                           ));
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: 150,
//                   width: 10.0,
//                 ),
//                 Container(
//                   height: 150,
//                   width: 170,
//                   color: Colors.green,
//                   child: FloatingActionButton(
//                     heroTag: 50,
//                     child: Center(
//                       child: Text(
//                         "Fourth year",
//                         style: TextStyle(
//                             fontSize: 35,
//                             fontFamily: "Dancing",
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black),
//                       ),
//                     ),
//                     onPressed: () {

                       
//                       newTripAd.show(                   //show the full screen adds when second year pressed
//                         anchorType: AnchorType.bottom,
//                         anchorOffset: 0.0,
//                         horizontalCenterOffset: 0.0,
//                       );
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => Fourthyear(),
//                           ));
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Container(
//             child:RaisedButton(
//               child:Text("aktu erp"),
//               onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Aktuerp()));
//               },

//             )
//           )
//         ],
//       ),
//     );
//   }
// }



//neeraj code....

 import 'dart:math';

import "package:flutter/material.dart";
import 'package:flutter/rendering.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';


import 'package:Academicmaster/firstyear.dart';

import "package:Academicmaster/secondyear.dart";

import "package:Academicmaster/thirdyear.dart";

import "package:Academicmaster/fourthyear.dart";
import "package:Academicmaster/services/admob_service.dart";
import "package:firebase_admob/firebase_admob.dart";

import "package:Academicmaster/firstslide.dart";

import 'package:admob_flutter/admob_flutter.dart';

import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar:PreferredSize(
          preferredSize: Size.fromHeight(320),
          child:AppBar(
            flexibleSpace:
            Container(
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,
              end: Alignment.bottomRight,
                colors: <Color>[
              Color(0xFF00195e),
              Color(0xFF00bbf8)
                ])),
              child: Container(
                width: 500,
                
                  child:Column(
                  
                    children:<Widget>[
                      Row(children: <Widget>[
                        Container(
                          height:110,
                        )
                      ],),
                    Row( 
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "Let's   :  ",
                          style:GoogleFonts.acme(
                           fontSize: 60,
                          
                          color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                        RotateAnimatedTextKit(
                            text: ["START","LEARN", "SHARE", "CODE"],
                            textStyle: GoogleFonts.lemonada(
                              fontSize: 30.0,
                              color: Colors.white),
                            textAlign: TextAlign.start,
                            alignment: AlignmentDirectional.topStart
                          
                        ),]),
                        Row(
                          
                          children: <Widget>[
                            Container(height:10,
                              )
                          ],
                        ),
                        Row(mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                          children:<Widget>[Container(
                          child:
                          Text("",
                          style: TextStyle(
                            fontSize: 30,
                            
                          ),textAlign: TextAlign.right,
                          )
                        ),
                        ]
                        )
                     
                      ],
                    
                    
                    ),),
            ),
                backgroundColor: Colors.deepPurple[400],
              elevation: 50.0,    
                    
                ),
      ),
    
      body: Homebody(),
      backgroundColor: Colors.black,
    );
  }
}

class Homebody extends StatefulWidget {
  @override
  _HomebodyState createState() => _HomebodyState();
}

class _HomebodyState extends State<Homebody> {
  final ams = AdMobService(); //call admobclass for use fntction

  @override
  void initState() {               //intilazied the appid
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }


  @override
  Widget build(BuildContext context) {
    InterstitialAd newTripAd =
        ams.getnewTripInterstitial();   //first save in the variablesto use adds
     
    newTripAd.load();

    return 
     SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            
            child:Column(
              children: <Widget>[ 
                Row(children: <Widget>[
            Container(
               
              height:10
            
            )
              ],),
              
           AdmobBanner(
            adUnitId: ams.getBannerAdId(),
             adSize: AdmobBannerSize.BANNER
             ),
          Row(children: <Widget>[
            Container(
            
              height:50,
            width: 360,
              child:Text("Select your year :",
              style:GoogleFonts.lemonada(
                color: Color(0xFF386a8c),
                fontSize: 30
              )
              )
            )
          ],),

             Container(
               
               width: 300,
              
               child: Column(children: <Widget>[
                 Container(
                  padding: EdgeInsets.only(top:20,bottom:10),
                  height: 75,
                  width: 180,
                  child: OutlineButton(
                  
                    
                    onPressed: () { 
                       newTripAd.show(                   //show the full screen adds when second year pressed
                        anchorType: AnchorType.bottom,
                        anchorOffset: 0.0,
                        horizontalCenterOffset: 0.0,
                        
                             );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Firstyear(),
                          ));
                       },
                    shape: StadiumBorder(),
                  
                    borderSide: BorderSide(color: Color(0xFF386a8c)),
                    padding: EdgeInsets.all(0.0),        
                    child: Container(
                         constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                              child: Text(
                                  "First year",
                                      textAlign: TextAlign.center,
                                    style: GoogleFonts.caveatBrush(
                                    fontSize: 34,
                                    color: Colors.white,
                                    
                                    ),
                              )
                            ),
                        
                        ),
                  ),
                  
                Container(
                  padding: EdgeInsets.only(top:10,bottom:20),
                  height: 75,
                  width: 180,
                  child: OutlineButton(
                    shape: StadiumBorder(),
                    borderSide: BorderSide(color: Color(0xFF386a8c)),
                    padding: EdgeInsets.all(0.0), 
                    child: Container(
                         constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                              child:     
                     Text(
                      "Second year",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.caveatBrush(
                          fontSize: 34,
                        
                          color: Colors.white,
                        ),),
                    ),
                    onPressed: () {
                      newTripAd.show(                   //show the full screen adds when second year pressed
                        anchorType: AnchorType.bottom,
                        anchorOffset: 0.0,
                        horizontalCenterOffset: 0.0,
                        
                      );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Secondyear(),
                          ));
                    },
            
                  ),
                ),
                 
                  Container(
                    padding: EdgeInsets.only(top:10,bottom:20),
                  height: 75,
                  width: 180,
                  child: OutlineButton(
                    shape: StadiumBorder(),
                     borderSide: BorderSide(color: Color(0xFF386a8c)),
                    padding: EdgeInsets.all(0.0), 
                    child: Container(
                         constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                      child: Text(
                        "Third year",
                        style: GoogleFonts.caveatBrush(
                            fontSize: 34,
                          
                            
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {

                       
                      newTripAd.show(                   //show the full screen adds when second year pressed
                        anchorType: AnchorType.bottom,
                        anchorOffset: 0.0,
                        horizontalCenterOffset: 0.0,
                        
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Thirdyear(),
                          ));
                    },
                  ),
                ),
               
                Container(
                  padding: EdgeInsets.only(top:10,bottom:20),
                  height: 75,
                  width: 180,
              
                  child: OutlineButton(
                      shape: StadiumBorder(),
                     borderSide: BorderSide(color: Color(0xFF386a8c)),
                    padding: EdgeInsets.all(0.0), 
                    child: Container(
                         constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                                alignment: Alignment.center,
                    
                             child: Text(
                            "Fourth year",
                            style: GoogleFonts.caveatBrush(
                              fontSize: 34,
                            
                          
                            color: Colors.white),
                      ),
                    ),
                    onPressed: () {

                       
                      newTripAd.show(                   //show the full screen adds when second year pressed
                        anchorType: AnchorType.bottom,
                        anchorOffset: 0.0,
                        horizontalCenterOffset: 0.0,
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Fourthyear(),
                          ));
                    },
                  ),
                ),
               ],)
                
             )
      
               
         ] )
           
         
        
          
          )],
      ),
    );
    
  }
}