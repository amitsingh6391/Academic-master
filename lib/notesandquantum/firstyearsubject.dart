

import 'package:flutter/material.dart';
import "package:Academicmaster/firstyearnotes/firstyearnotes.dart";
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

import "dart:math";

import 'package:google_fonts/google_fonts.dart';

class Firstyearsubject extends StatefulWidget {
  @override
  _FirstyearsubjectState createState() => _FirstyearsubjectState();
}

class _FirstyearsubjectState extends State<Firstyearsubject> {
  String dropdownValue='unit1';
  final ams = AdMobService(); //call admobclass from services
  
   @override
  void initState() {               //intilazied the appid
    super.initState();
   // Admob.initialize(ams.getAdMobAppId());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subject",
            style: GoogleFonts.playfairDisplay(
                color: Colors.black,
                fontSize: 40,
                ),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.red[200],
                      Colors.blue[200]
                    ])
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(

              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                 
                

                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child:
                  
                   Container(
                     width:250,
                     height: 70,
                     color: Colors.lightBlue[100],
                    child: Row(
                      children: <Widget>[
                       
                        Text(
                          "   *  Programming for Problem Solving",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        
                      ],
                    ),
                  ),
                ),

                      Container(
                           width: 500,
                          child: 
                            
                              DropdownButton<String>(
                                hint: Text("                          Select unit",
                                style: TextStyle(fontSize: 20,color: Colors.red),
                                ),
                                icon: Icon(Icons.arrow_drop_down,size: 44,),
                                elevation: 10,
                                style: TextStyle(color: Colors.brown),
                               
                                onChanged: (String newValue){
                                  setState(() {
                                    dropdownValue=newValue;
                                  });
                                },
                                items: <String>["unit1", "unit2", "unit3", "unit4","unit5"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                            
                                child:Container(
                                  width: 200,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(border: Border.all(
                                   color: Colors.grey,
                                   
                                  )),
                                  child: Row(
                                  
                                  children:<Widget>[
                                    Text("  $value   ",
                                    style: TextStyle(fontSize: 30,
                                    
                                    ),
                                    ),
                                  SizedBox(
                                  width:30,
                                  height: 30,
                                  child:Buttonnotes(context,"$value")
                                )
                                  ]))
                              );
                                }).toList(),
                                )
                            
                          
                        ),
            //     AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/5958645055",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
               
                      
            
                Box(),
                Container(
                  padding: EdgeInsets.all(17),
                  width: 250,
                  height: 70,
                 color: Colors.lightBlue[100],
                  
                    child: Text(
                      " *   Physics",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  
                ),
                Container(padding: EdgeInsets.all(0),
                           width: 500,
                          child: 
                            
                              DropdownButton<String>(
                                hint: Text("                          Select unit",
                                style: TextStyle(fontSize: 20,color: Colors.red),
                                ),
                                icon: Icon(Icons.arrow_drop_down,size: 44,),
                                elevation: 10,
                                style: TextStyle(color: Colors.redAccent),
                               
                                onChanged: (String newValue){
                                  setState(() {
                                    dropdownValue=newValue;
                                  });
                                },
                                items: <String>["Unit1", "Unit2", "Unit3"]
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                            
                                child:Container(
                                  width: 200,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(border: Border.all(
                                   color: Colors.grey,
                                   
                                  )),
                                  child: Row(
                                  
                                  children:<Widget>[
                                    Text("  $value   ",
                                    style: TextStyle(fontSize: 30,
                                    
                                    ),
                                    ),
                                  SizedBox(
                                  width:30,
                                  height: 30,
                                  child:Buttonnotes(context,"$value")
                                )
                                  ]))
                              );
                                }).toList(),
                                )
                            
                          
                        ),
               
                Container(
                  height: 20,
                ),
                Container(padding: EdgeInsets.only(top:10,bottom:20,left:20,right:20),
                  height: 70,
                 color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  *   Chemistry",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(70),
                      SizedBox(height:30 ,
                      width: 30,
                      child:Buttonnotes(context, "Chemistryn"),
                      )],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        " *   Basic electrical engin..",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      SizedBox(height: 30,
                      width: 30,
                      child:Buttonnotes(context, "electricalnotes"),
                      )],
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        " *  Professional english",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      Buttonnotes(context, "pcnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                 color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  *  Math 1",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(100),
                     // Buttonnotes(context, "Mathnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                 color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  *  Math2",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      Buttonnotes(context, "math2notes"),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

//here we declare all the quantum in firstyear year

class Firstyearquantum extends StatefulWidget {
  @override
  _FirstyearquantumState createState() => _FirstyearquantumState();
}

class _FirstyearquantumState extends State<Firstyearquantum> {
  final ams = AdMobService(); //call admobclass from services

   @override
  void initState() {               //intilazied the appid
    super.initState();
    //Admob.initialize(ams.getAdMobAppId());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Important Questions",
            style: TextStyle(color: Colors.black,
                fontFamily: "Dancing",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Colors.deepPurple[200],
                      Colors.yellowAccent[100]
                    ])
            ),
          ),
        ),
        body: SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Math ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            fontFamily: "Dancing"),
                      ),
                      mycontainer(100),
                     // Buttonnotes(context, "math1q"),
                    ],
                  ),
                ),
              //    AdmobBanner(
              // adUnitId: "ca-app-pub-5023637575934146/3332481719",
              //  adSize: AdmobBannerSize.BANNER
              //  ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "    Physics",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(90),
                      Buttonnotes(context, "physicsq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "    Chemistry",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(90),
                      Buttonnotes(context, "chemistryq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "    Math 2",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(100),
                      Buttonnotes(context, "math2q"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  Professional english",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(20),
                      Buttonnotes(context, "professionalenglish"),
                    ],
                  ),
                ),
              //   AdmobBanner(
              // adUnitId: "ca-app-pub-5023637575934146/3332481719",
              //  adSize: AdmobBannerSize.BANNER
              //  ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "prblem solving throgh progra.(c)",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(5),
                     Buttonnotes(context, "cquantum"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Basic electrical enge..",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      Buttonnotes(context, "electricalquantum"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

SizedBox Box() {
  return SizedBox(
    height: 50,
    width: 50,
  );
}

FloatingActionButton Buttonnotes(context, String x) {
  Random random = Random();
  int randomnumber = random.nextInt(10000);
  return FloatingActionButton(
    backgroundColor: Colors.yellow[200],
    heroTag: randomnumber,
    child: Icon(Icons.arrow_forward,color: Colors.black,),
    onPressed: () {
      {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Notes1(subject: x),
            ));
      }
    },
  );
}

Container mycontainer(double x) {
  return Container(
    width: x,
  );
}