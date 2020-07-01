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
      
        
       appBar:AppBar(backgroundColor: Colors.white,
       leading:IconButton(
         icon:Icon(Icons.arrow_back,size:50,color:Colors.blue),
         onPressed: (){
        Navigator.pop(context);
         },
       )),
      body: Homebody(),
      backgroundColor: Colors.white,
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
    InterstitialAd newTripAd = ams.getnewTripInterstitial();   //first save in the variablesto use adds
     
    newTripAd.load();

    return 
     SingleChildScrollView(
      
      child: Column(
        children: <Widget>[
          Card(
            color:Colors.white,

            elevation:10,

            child:Container(
              height:200,
              width:MediaQuery.of(context).size.width,
              child:Image(

               image:AssetImage("images/awesome-gif.gif")
              )

              

            )
          ),
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
                                    color: Colors.black,
                                    
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
                        
                          color: Colors.black,
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
                          
                            
                            color: Colors.black),
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
                            
                          
                            color: Colors.black),
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