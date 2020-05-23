

// import 'package:flutter/material.dart';

// import "dart:math";
// import 'package:TheMitian/secondyearnotes/secondyearnotes.dart';
// import 'package:admob_flutter/admob_flutter.dart';
// import "package:TheMitian/services/admob_service.dart";

// class Secondyearsubject extends StatefulWidget {
//   @override
//   _SecondyearsubjectState createState() => _SecondyearsubjectState();
// }

// class _SecondyearsubjectState extends State<Secondyearsubject> {

//   final ams = AdMobService(); //call admobclass from services

//    @override
//   void initState() {               //intilazied the appid
//     super.initState();
//     Admob.initialize(ams.getAdMobAppId());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Subject",
//       style: TextStyle(fontWeight: FontWeight.bold,
//       fontSize: 50,fontFamily: "Dancing"),
//       ),
//       backgroundColor: Colors.redAccent,),
      
//       body:SingleChildScrollView(
//               child: Container(
//           child:Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Container(
//                   width: 400,
//                   height: 100,
                  
//                   child: Center(
//                     child: Text("Fourth semster",style: TextStyle(fontWeight: FontWeight.bold,
//                     fontSize: 60,
//                     fontFamily: "Dancing"),),
//                   ),
//                   ),
//             //       AdmobBanner(
//             // adUnitId: ams.getBannerAdId(),
//             //  adSize: AdmobBannerSize.BANNER
//             //  ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color: Colors.green,
//                     child: Row(
//                       children: <Widget>[
//                         Text("Operating System",style:TextStyle(fontFamily: "Dancing",fontSize: 43,
//                         fontWeight: FontWeight.bold),
//                         ),
//                          //Buttonnotes(context,"osnotes"),
//                       ],
//                     ),
//                   ),
//                 ),

//                 Container(
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit1",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "osunit1")
//                           ],
//                           ),
//                           SizedBox(height: 20,),
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit2",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "osunit2")
//                           ],
//                           ),
//                           SizedBox(height: 20,),
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit3",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "osunit3")
//                           ],
                          
//                           ),
//                           SizedBox(height: 20,),
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit4",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "osunit4")
//                           ],
//                           ),
//                           SizedBox(height: 20,),
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit5",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "osunit5")
//                           ],
//                           ),
//                       ],
//                     ),
//                   ),

//                 Box(),
//                 Container(
//                   color: Colors.yellow,
//                                   child: Row(
                                    
//                     children: <Widget>[
//                       Text("TAFL",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
//                       fontWeight: FontWeight.bold),
//                       ),
                      
//                       mycontainer(180),
                      
//                       Button(context,"taflnotes"),
//                     ],
                    
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color:Colors.pink,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Microprocessor",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(15),
                      
//                      // Button(context,"mpnotes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.brown,
//                                   child: Row(
//                     children: <Widget>[
//                       Text("Math 4",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(150),
//                      // Button(context,"math4notes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color:Colors.purple,
//                   child: Row(
//                     children: <Widget>[
//                       Text("UHMV",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(170),
//                      // Button(context,"uhmvnotes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.redAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text("CSS",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(220),
//                      // Button(context,"cssnotes"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(

//                   width: 400,
//                   height: 200,
//                   child: Center(
//                     child: Text("Third semster",style: TextStyle(fontFamily: "Dancing",fontSize: 60,
//                     fontWeight: FontWeight.bold),),
//                   )

//                 ),
//                 Container(
//                   color: Colors.teal,
//                   child: Row(
//                     children: <Widget>[
//                       Text("COA",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),

//                 Box(),

//                 Container(
//                   color: Colors.tealAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Data Structure",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Box(),

//                 Container(
//                   color:Colors.green,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Technical Communication",style:TextStyle(fontFamily: "Dancing",fontSize: 35,
//                       fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.yellow,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Python",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color:Colors.red),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.yellow,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Engineering Science",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color:Colors.red),
//                       ),
//                     ],
//                   ),
//                 ),

//               ],),
//           )
//         ),
//       )
      
//     );
//   }
// }

// //here we declare all the quantum in secondyear year



// class Secondyearquantum extends StatefulWidget {
//   @override
//   _SecondyearquantumState createState() => _SecondyearquantumState();
// }

// class _SecondyearquantumState extends State<Secondyearquantum> {
  
//   final ams = AdMobService(); //call admobclass from services

//   //  @override
//   // void initState() {               //intilazied the appid
//   //   super.initState();
//   //   Admob.initialize(ams.getAdMobAppId());
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Quantum",
//       style:TextStyle(fontFamily: "Dancing",fontSize: 50,fontWeight:FontWeight.bold, ) ,
//       ),
//       backgroundColor: Colors.green,),
//       body:SingleChildScrollView(
//               child: Container(
//           child:Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     color:Colors.red,
//                     child: Row(
//                       children: <Widget>[
//                         Text("Operating System",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                         fontWeight: FontWeight.bold),
//                         ),
//                         mycontainer(20),
//                         Button(context,"osq"),
                        
//                       ],
                      
//                     ),
//                   ),
//                 ),
//                 //plcace banneradd
//             //     AdmobBanner(
//             // adUnitId: ams.getBannerAdId(),
//             //  adSize: AdmobBannerSize.BANNER
//             //  ),
                
//                 Container(
//                   color: Colors.blue,
//                   child: Row(
//                     children: <Widget>[
//                       Text("TAFL",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(180),
//                       //Button(context,"taflq"),
//                     ],
//                   ),
//                 ),
//                 Container(
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit1",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "taflunit1q")
//                           ],
//                           ),
//                           SizedBox(height: 20,),
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit2 and unit 3",
//                             style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "taflunit2and3q")
//                           ],
//                           ),
//                           SizedBox(height: 20,),
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit4",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "taflunit4q")
//                           ],
                          
//                           ),
//                           SizedBox(height: 20,),
                          
//                           Row(
//                           children: <Widget>[
//                             mycontainer(70),
//                             Text("unit5",
//                             style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
//                           Button(context, "taflunit5q")
//                           ],
//                           ),
//                       ],
//                     ),
//                   ),
//             //       AdmobBanner(
//             // adUnitId: "ca-app-pub-5023637575934146/4275890118",
//             //  adSize: AdmobBannerSize.BANNER
//             //  ),
//                 Box(),
//                 Container(
//                   color: Colors.green,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Microprocessor",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
//                       fontWeight: FontWeight.bold),
//                       ),

//                       mycontainer(20),

//                       Button(context,"mpq"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.brown,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Math 4",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(150),
//                       Button(context,"math4q"),
//                     ],
//                   ),
//                 ),
//             //      AdmobBanner(
//             // adUnitId: "ca-app-pub-5023637575934146/4275890118",
//             //  adSize: AdmobBannerSize.BANNER
//             //  ),
                
//                 Container(
//                   color: Colors.pink,
//                   child: Row(
//                     children: <Widget>[
//                       Text("UHMV",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(170),
//                       Button(context,"uhmvq"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.yellowAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text("CSS",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(220),
//                       Button(context,"cssq"),
//                     ],
//                   ),
//                 ),
//                 Box(),
//                 Container(
//                   color: Colors.orange,
//                   child: Row(
//                     children: <Widget>[
//                       Text("COA",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(210),
//                       Button(context,"coaq"),
//                     ],
//                   ),
//                 ),

//             //     AdmobBanner(
//             // adUnitId: ams.getBannerAdId(),
//             //  adSize: AdmobBannerSize.BANNER
//             //  ),

//                 Container(
//                   color: Colors.pinkAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Data Structure",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       mycontainer(60),
//                       Button(context,"dsq"),
//                     ],
//                   ),
//                 ),
//                 Box(),

//                 Container(
//                   color: Colors.redAccent,
//                   child: Row(
//                     children: <Widget>[
//                       Text("Technical Communication",style:TextStyle(fontFamily: "Dancing",fontSize: 32,
//                       fontWeight: FontWeight.bold),
//                       ),
//                       Button(context,"tcq"),
//                     ],
//                   ),
//                 ),
               

//               ],),
//           )
//         ),
//       )
      
//     );
//   }
// }



// SizedBox Box(){
//   return
  
//   SizedBox(
//     height: 50,
//     width: 50,
//   );
// }

// FloatingActionButton Button(context, String x) {
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
//               builder: (context) => Notes2(subject: x),
//             ));
//       }
//     },
//   );
// }



// Container mycontainer(double x){
//   return
//   Container(
//     width: x,
//   );

// }


//neeraj code here....



import 'package:flutter/material.dart';

import "dart:math";
import 'package:Academicmaster/secondyearnotes/secondyearnotes.dart';
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";
import 'package:google_fonts/google_fonts.dart';

class Secondyearsubject extends StatefulWidget {
  @override
  _SecondyearsubjectState createState() => _SecondyearsubjectState();
}

class _SecondyearsubjectState extends State<Secondyearsubject> {
  String dropdownValue='osunit1';
  final ams = AdMobService(); //call admobclass from services

   @override
  void initState() {               //intilazied the appid
    super.initState();
   // Admob.initialize(ams.getAdMobAppId());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subject",
      style: GoogleFonts.playfairDisplay(
      fontSize: 40),
      ),
      backgroundColor: Colors.teal,),
      
      body:SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
            
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.teal[200],
                
                ],
              ),
            ),
         
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 400,
                  height: 100,
                  
                  child: Center(
                    child: Text("Fourth semster",style: TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 60,
                    fontFamily: "Dancing"),),
                  ),
                  ),
                  AdmobBanner(
            adUnitId: ams.getBannerAdId(),
             adSize: AdmobBannerSize.BANNER
             ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.all(20),
                    color: Colors.green[200],
                    child: Row(
                      children: <Widget>[
                        Text("  *    Operating System",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                        fontWeight: FontWeight.bold),
                        ),
                         //Buttonnotes(context,"osnotes"),
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
                                items: <String>["osunit1", "osunit2", "osunit3", "osunit4","osunit5"]
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
                                  child:Button(context,"$value")
                                )
                                  ]))
                              );
                                }).toList(),
                                )
                            
                          
                        ),

               
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  color: Colors.green[200],
                                  child: Row(
                                    
                    children: <Widget>[
                      Text("  *    TAFL",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      
                      mycontainer(70),
                      
                      Button(context,"taflnotes"),
                    ],
                    
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  color:Colors.green[200],
                  child: Row(
                    children: <Widget>[
                      Text("  *    Microprocessor",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(70),
                      
                     // Button(context,"mpnotes"),
                    ],
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
                                items: <String>[ "mpunit3", "mpunit4","mpunit5"]
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
                                  child:Button(context,"$value")
                                )
                                  ]))
                              );
                                }).toList(),
                                )
                            
                          
                        ),
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                
                  color: Colors.green[200],
                                  child: Row(
                    children: <Widget>[
                      Text("  *    Math 4",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(90),
                      Button(context,"mathnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  color:Colors.green[200],
                  child: Row(
                    children: <Widget>[
                      Text("  *   UHMV",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(170),
                     // Button(context,"uhmvnotes"),
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
                      Text("  *   CSS",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(220),
                     // Button(context,"cssnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(

                  width: 400,
                  height: 200,
                  child: Center(
                    child: Text("Third semster",style: TextStyle(fontFamily: "Dancing",fontSize: 60,
                    fontWeight: FontWeight.bold),),
                  )

                ),
                Container(height: 70,
                padding: EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Row(
                    children: <Widget>[
                      Text("  *   COA",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                Box(),

                Container(height: 70,
                padding: EdgeInsets.all(20),
                  color: Colors.green[200],
                  child: Row(
                    children: <Widget>[
                      Text("  *  Data Structure",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Box(),

                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  color:Colors.green[200],
                  child: Row(
                    children: <Widget>[
                      Text("  *   Technical Communication",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
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
                      Text("  *    Python",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.black),
                      ),
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
                      Text("  *   Engineering Science",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.black),

                      ),
                       Button(context,"engineeringscience"),
                    ],
                  ),
                ),

              ],),
          )
        ),
      
      
    );
  }
}

//here we declare all the quantum in secondyear year



class Secondyearquantum extends StatefulWidget {
  @override
  _SecondyearquantumState createState() => _SecondyearquantumState();
}

class _SecondyearquantumState extends State<Secondyearquantum> {
  
  final ams = AdMobService(); //call admobclass from services

   @override
  void initState() {               //intilazied the appid
    super.initState();
  //  Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Imporant questions",
      style:TextStyle(fontFamily: "Dancing",fontSize: 35,fontWeight:FontWeight.bold, ) ,
      ),
      backgroundColor: Colors.green,),
      body:SingleChildScrollView(
              child: Container(
                color: Colors.black12,
          child:Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color:Colors.red,
                    child: Row(
                      children: <Widget>[
                        Text("Operating System",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
                        fontWeight: FontWeight.bold),
                        ),
                        mycontainer(20),
                        Button(context,"osq"),
                        
                      ],
                      
                    ),
                  ),
                ),
                //plcace banneradd

                
                Container(
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Text("TAFL",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(180),
                      //Button(context,"taflq"),
                    ],
                  ),
                ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit1",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Button(context, "taflunit1q")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit2 and unit 3",
                            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Button(context, "taflunit2and3q")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit4",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Button(context, "taflunit4q")
                          ],
                          
                          ),
                          SizedBox(height: 20,),
                          
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit5",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Button(context, "taflunit5q")
                          ],
                          ),
                      ],
                    ),
                  ),
            //       AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/4275890118",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                Box(),
                Container(
                  color: Colors.green,
                  child: Row(
                    children: <Widget>[
                      Text("Microprocessor",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
                      fontWeight: FontWeight.bold),
                      ),

                      mycontainer(20),

                      Button(context,"mpq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.brown,
                  child: Row(
                    children: <Widget>[
                      Text("Math 4",style:TextStyle(fontFamily: "Dancing",fontSize: 50,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(150),
                      Button(context,"math4q"),
                    ],
                  ),
                ),
            //      AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/4275890118",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                
                Container(
                  color: Colors.pink,
                  child: Row(
                    children: <Widget>[
                      Text("UHMV",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(170),
                      Button(context,"uhmvq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.yellowAccent,
                  child: Row(
                    children: <Widget>[
                      Text("CSS",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(220),
                      Button(context,"cssq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.orange,
                  child: Row(
                    children: <Widget>[
                      Text("COA",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(210),
                      Button(context,"coaq"),
                    ],
                  ),
                ),

            //     AdmobBanner(
            // adUnitId: ams.getBannerAdId(),
            //  adSize: AdmobBannerSize.BANNER
            //  ),

                Container(
                  color: Colors.pinkAccent,
                  child: Row(
                    children: <Widget>[
                      Text("Data Structure",style:TextStyle(fontFamily: "Dancing",fontSize: 40,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(60),
                      Button(context,"dsq"),
                    ],
                  ),
                ),
                Box(),

                Container(
                  color: Colors.redAccent,
                  child: Row(
                    children: <Widget>[
                      Text("Technical Communication",style:TextStyle(fontFamily: "Dancing",fontSize: 32,
                      fontWeight: FontWeight.bold),
                      ),
                      Button(context,"tcq"),
                    ],
                  ),
                ),
               

              ],),
          )
        ),
      )
      
    );
  }
}



SizedBox Box(){
  return
  
  SizedBox(
    height: 50,
    width: 50,
  );
}

FloatingActionButton Button(context, String x) {
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
              builder: (context) => Notes2(subject: x),
            ));
      }
    },
  );
}



Container mycontainer(double x){
  return
  Container(
    width: x,
  );

}