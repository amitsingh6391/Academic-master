import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import "dart:math";
//import 'package:Academicmaster/secondyearnotes/secondyearnotes.dart';
import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Secondyearsubject extends StatefulWidget {
  @override
  _SecondyearsubjectState createState() => _SecondyearsubjectState();
}

class _SecondyearsubjectState extends State<Secondyearsubject> {
  String dropdownValue = 'unit1';
  final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    // Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Subject",
            style: GoogleFonts.playfairDisplay(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
=======
      appBar: AppBar(title: Text("Subject",
      style: GoogleFonts.playfairDisplay(
      fontSize: 40,color: Colors.black
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
        ),),
      
      body:SingleChildScrollView(
              child: Container(

         
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 400,
                  height: 80,
                  
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
                    color: Colors.lightBlue[100],
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
                                style: TextStyle(fontSize: 20,color: Colors.red),
                                ),
                                icon: Icon(Icons.arrow_drop_down,size: 44,),
                                elevation: 10,
                                style: TextStyle(color: Colors.black),
                               
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
                  color: Colors.lightBlue[100],
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
                  color:Colors.lightBlue[100],
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
                                style: TextStyle(fontSize: 20,color: Colors.red),
                                ),
                                icon: Icon(Icons.arrow_drop_down,size: 44,),
                                elevation: 10,
                                style: TextStyle(color: Colors.black),
                               
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
                
                  color: Colors.lightBlue[100],
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
                  color:Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text("  *   UHMV",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(110),
                      Button(context,"uhmvnotes"),
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
                      Text("  *   CSS",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(130),
                      Button(context,"cssnotes"),
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
                  color: Colors.lightBlue[100],
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
                  color: Colors.lightBlue[100],
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
                  color:Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text("  *   Technical Communication",style:TextStyle(fontFamily: "Dancing",fontSize: 27,
                      fontWeight: FontWeight.bold),
                      ),
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
                      Text("  *    Python",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color:Colors.black),
                      ),
                      Button(context,"python")
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
                      Text("  *   Engineering Science",style:TextStyle(fontFamily: "Dancing",fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color:Colors.black),

                      ),
                       Button(context,"engineeringscience"),
                    ],
                  ),
                ),

              ],),
          )
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("secondyearnotes")
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading");
                      }
                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Subjecttile(
                              subjectname: snapshot
                                  .data.documents[index].data['subjectname'],
                              link: snapshot.data.documents[index].data["link"],
                            );
                          });
                    }),
              ),
            ],
          )),
        ));
  }
}

//here we declare all the quantum in firstyear year

class Secondyearquantum extends StatefulWidget {
  @override
  _SecondyearquantumState createState() => _SecondyearquantumState();
}

class _SecondyearquantumState extends State<Secondyearquantum> {
  final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    //Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Important Questions",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Dancing",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
=======
      appBar: AppBar(title: Text("Imporant questions",
      style:TextStyle(color: Colors.black,fontFamily: "Dancing",fontSize: 35,fontWeight:FontWeight.bold, ) ,
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
                    color:Colors.deepPurple[100],
                    child: Row(
                      children: <Widget>[
                        Text("Operating System",style:TextStyle(fontFamily: "Dancing",fontSize: 35,
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
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("  TAFL",style:TextStyle(fontFamily: "Dancing",fontSize: 35,
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
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Button(context, "taflunit1q")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit2 and unit 3",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Button(context, "taflunit2and3q")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit4",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Button(context, "taflunit4q")
                          ],
                          
                          ),
                          SizedBox(height: 20,),
                          
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit5",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
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
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("  Microprocessor",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),

                      mycontainer(20),

                      Button(context,"mpq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("  Math 4",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(100),
                      Button(context,"math4q"),
                    ],
                  ),
                ),
            //      AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/4275890118",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("  UHMV",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(100),
                      Button(context,"uhmvq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("  CSS",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(150),
                      Button(context,"cssq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("  COA",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(150),
                      Button(context,"coaq"),
                    ],
                  ),
                ),

            //     AdmobBanner(
            // adUnitId: ams.getBannerAdId(),
            //  adSize: AdmobBannerSize.BANNER
            //  ),

                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(" Data Structure",style:TextStyle(fontFamily: "Dancing",fontSize: 30,
                      fontWeight: FontWeight.bold),
                      ),
                      mycontainer(60),
                      Button(context,"dsq"),
                    ],
                  ),
                ),
                Box(),

                Container(
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text("Technical Communication",style:TextStyle(fontFamily: "Dancing",fontSize: 25,
                      fontWeight: FontWeight.bold),
                      ),
                      Button(context,"tcq"),
                    ],
                  ),
                ),
               

              ],),
          )
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
        ),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("secondyearquantum")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Text("Loading");
                    }
                    return ListView.builder(
                        reverse: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Subjecttile(
                            subjectname: snapshot
                                .data.documents[index].data['subjectname'],
                            link: snapshot.data.documents[index].data["link"],
                          );
                        });
                  }),
            ),
          ]),
        )));
  }
}

class Subjecttile extends StatefulWidget {
  final String subjectname, link;
  Subjecttile({@required this.subjectname, @required this.link});
  @override
  _SubjecttileState createState() => _SubjecttileState();
}

<<<<<<< HEAD
class _SubjecttileState extends State<Subjecttile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 80,
            color: Colors.yellow,
            child: Card(
                elevation: 10,
                color: Colors.black,
                child: Row(
                  children: <Widget>[
                    Text(
                      widget.subjectname,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: GestureDetector(
                          onTap: () {
                            var x = widget.link;

                            var y = widget.subjectname;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Subjectwebview(link: x, bar: y)));
                          },
                          child:
                              Icon(Icons.arrow_forward, color: Colors.black)),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                        onTap: () {
                          urllauncher(widget.link);
                        },
                        child: Icon(Icons.file_download,
                            color: Colors.white, size: 20))
                  ],
                )),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
=======
FloatingActionButton Button(context, String x) {
  Random random = Random();
  int randomnumber = random.nextInt(10000);
  return FloatingActionButton(

    backgroundColor: Colors.yellow[100],
    heroTag: randomnumber,
    child: Icon(Icons.arrow_forward,color: Colors.black,),
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
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
}

urllauncher(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
