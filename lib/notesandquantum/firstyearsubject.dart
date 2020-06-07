// import 'package:flutter/material.dart';
// import "package:TheMitian/firstyearnotes/firstyearnotes.dart";
// import 'package:admob_flutter/admob_flutter.dart';
// import "package:TheMitian/services/admob_service.dart";

// import "dart:math";

// class Firstyearsubject extends StatefulWidget {
//   @override
//   _FirstyearsubjectState createState() => _FirstyearsubjectState();
// }

// class _FirstyearsubjectState extends State<Firstyearsubject> {
//   final ams = AdMobService(); //call admobclass from services

//    @override
//   void initState() {               //intilazied the appid
//     super.initState();
//     Admob.initialize(ams.getAdMobAppId());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Subject",
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 50,
//                 fontFamily: "Dancing"),
//           ),
//           backgroundColor: Colors.redAccent,
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//               child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.green,
//                     child: Row(
//                       children: <Widget>[
//                         Text(
//                           "problem solving through progra(c)",
//                           style: TextStyle(
//                               fontFamily: "Dancing",
//                               fontSize: 27,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             //     AdmobBanner(
//             // adUnitId: "ca-app-pub-5023637575934146/5958645055",
//             //  adSize: AdmobBannerSize.BANNER
//             //  ),
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit1",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                         Buttonnotes(context, "cunit1")
//                         ],
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit2",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                         Buttonnotes(context, "cunit2")
//                         ],
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit3",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                         Buttonnotes(context, "cunit3")
//                         ],
                        
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit4",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                         Buttonnotes(context, "cunit4")
//                         ],
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit5",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                         Buttonnotes(context, "cunit5")
//                         ],
//                         ),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.blueAccent,
//                   child: Center(
//                     child: Text(
//                       "Physics",
//                       style: TextStyle(
//                           fontFamily: "Dancing",
//                           fontSize: 50,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit1",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
//                         Buttonnotes(context, "physicsunit1")
//                         ],
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit2",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
//                         Buttonnotes(context, "physicsunit1")
//                         ],
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit3",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
//                         Buttonnotes(context, "physicsunit3")
//                         ],
                        
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit4",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
//                         //Buttonnotes(context, "cunit4")
//                         ],
//                         ),
//                         SizedBox(height: 20,),
//                         Row(
//                         children: <Widget>[
//                           mycontainer(70),
//                           Text("unit5",
//                           style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
//                         //Buttonnotes(context, "cunit5")
//                         ],
//                         ),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.pink,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Chemistry",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(70),
//                       Buttonnotes(context, "Chemistryn"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.yellowAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Basic electrical engin..",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(10),
//                       Buttonnotes(context, "electricalnotes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.brown,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Professional english",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(10),
//                       Buttonnotes(context, "pcnotes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.orange,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Math 1",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(100),
//                      // Buttonnotes(context, "Mathnotes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.purple,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Math2",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(10),
//                      // Buttonnotes(context, "math2notes"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )),
//         ));
//   }
// }

// //here we declare all the quantum in firstyear year

// class Firstyearquantum extends StatefulWidget {
//   @override
//   _FirstyearquantumState createState() => _FirstyearquantumState();
// }

// class _FirstyearquantumState extends State<Firstyearquantum> {
//   final ams = AdMobService(); //call admobclass from services

//   //  @override
//   // void initState() {               //intilazied the appid
//   //   super.initState();
//   //   Admob.initialize(ams.getAdMobAppId());
//   // }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Quantum",
//             style: TextStyle(
//                 fontFamily: "Dancing",
//                 fontSize: 50,
//                 fontWeight: FontWeight.bold),
//           ),
//           backgroundColor: Colors.green,
//         ),
//         body: SingleChildScrollView(
//                   child: Container(
//             child: Column(
//               children: <Widget>[
//                 Container(
//                   color: Colors.red,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Math 1",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 50,
//                             fontFamily: "Dancing"),
//                       ),
//                       mycontainer(100),
//                      // Buttonnotes(context, "math1q"),
//                     ],
//                   ),
//                 ),
//               //    AdmobBanner(
//               // adUnitId: "ca-app-pub-5023637575934146/3332481719",
//               //  adSize: AdmobBannerSize.BANNER
//               //  ),
//                 Box(),
//                 Container(
//                   color: Colors.orange,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Physics",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(90),
//                       //Buttonnotes(context, "physicsq"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.yellowAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Chemistry",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(90),
//                      // Buttonnotes(context, "chemistryq"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.pink,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Math 2",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 50,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(100),
//                       Buttonnotes(context, "math2q"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.blueGrey,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Professional english",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 40,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(20),
//                      // Buttonnotes(context, "peq"),
//                     ],
//                   ),
//                 ),
//               //   AdmobBanner(
//               // adUnitId: "ca-app-pub-5023637575934146/3332481719",
//               //  adSize: AdmobBannerSize.BANNER
//               //  ),
//                 Box(),
//                 Container(
//                   color: Colors.blue,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "prblem solving throgh progra.(c)",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 25,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(5),
//                      // Buttonnotes(context, "cq"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.purple,
//                   child: Row(
//                     children: <Widget>[
//                       Text(
//                         "Basic electrical enge..",
//                         style: TextStyle(
//                             fontFamily: "Dancing",
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(10),
//                      // Buttonnotes(context, "electricalq"),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }

// SizedBox Box() {
//   return SizedBox(
//     height: 50,
//     width: 50,
//   );
// }

// FloatingActionButton Buttonnotes(context, String x) {
//   Random random = Random();
//   int randomnumber = random.nextInt(10000);
//   return FloatingActionButton(
//     backgroundColor: Colors.black,
//     heroTag: randomnumber,
//     child: Icon(Icons.arrow_forward),
//     onPressed: () {
//       {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Notes1(subject: x),
//             ));
//       }
//     },
//   );
// }

// Container mycontainer(double x) {
//   return Container(
//     width: x,
//   );
// }





//neeraj code here....


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
                color: Colors.green[100],
                fontSize: 40,
                ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: SingleChildScrollView(
          child: Container(
                    decoration: BoxDecoration(
            
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.teal[200],
                
                ],
              ),
            ),
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
                    color: Colors.green[200],
                    child: Row(
                      children: <Widget>[
                       
                        Text(
                          "   *  Programming for Problem Solving",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontSize: 24,
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
                                style: TextStyle(fontSize: 20,color: Colors.black),
                                ),
                                icon: Icon(Icons.arrow_drop_down,size: 44,),
                                elevation: 10,
                                style: TextStyle(color: Colors.teal),
                               
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
                  color: Colors.green[200],
                  
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
                                style: TextStyle(fontSize: 20,color: Colors.black),
                                ),
                                icon: Icon(Icons.arrow_drop_down,size: 44,),
                                elevation: 10,
                                style: TextStyle(color: Colors.teal),
                               
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
                  color: Colors.green[200],
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
                  padding: EdgeInsets.all(20),
                  height: 70,
                  color: Colors.green[200],
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
                  color: Colors.green[200],
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
                  color: Colors.green[200],
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
                  padding: EdgeInsets.all(20),
                  color: Colors.green[200],
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
                     // Buttonnotes(context, "math2notes"),
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
            style: TextStyle(
                fontFamily: "Dancing",
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF0000A0),
        ),
        body: SingleChildScrollView(
                  child: Container(
                    color: Colors.black12,
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.red,
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
                  color: Colors.orange,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Physics",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(90),
                      //Buttonnotes(context, "physicsq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.yellowAccent,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Chemistry",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(90),
                     // Buttonnotes(context, "chemistryq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.pink,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Math 2",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 50,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(100),
                      Buttonnotes(context, "math2q"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.blueGrey,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Professional english",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(20),
                     // Buttonnotes(context, "peq"),
                    ],
                  ),
                ),
              //   AdmobBanner(
              // adUnitId: "ca-app-pub-5023637575934146/3332481719",
              //  adSize: AdmobBannerSize.BANNER
              //  ),
                Box(),
                Container(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "prblem solving throgh progra.(c)",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(5),
                     // Buttonnotes(context, "cq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.purple,
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
    backgroundColor: Colors.black,
    heroTag: randomnumber,
    child: Icon(Icons.arrow_forward),
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