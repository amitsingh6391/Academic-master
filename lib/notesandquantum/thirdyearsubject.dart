import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

import "dart:math";
//import "package:Academicmaster/thirdAndfourthyearnotesandquantum/thirdAndfourthyearnotes.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Thirdyearsubject extends StatefulWidget {
  @override
  _ThirdyearsubjectState createState() => _ThirdyearsubjectState();
}

class _ThirdyearsubjectState extends State<Thirdyearsubject> {
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Subject",
            style: GoogleFonts.playfairDisplay(
<<<<<<< HEAD
              color: Colors.white,
              fontSize: 40,
            ),
          ),
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
                        .collection("Thirdyearnotes")
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
=======
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

              
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.all(20),
                    color: Colors.lightBlue[100],
                    child: Row(
                      children: <Widget>[
                        Text(
                          "  *   Manegerial Economics",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontSize: 30,
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
                                style: TextStyle(color: Colors.black),
                               
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
                               //   SizedBox(
                                 // width:30,
                                  //height: 30,
                                  //child:Buttonnotes(context,"$value")
                               // )
                                  ]))
                              );
                                }).toList(),
                                )
                            
                          
                        ),
                // AdmobBanner(
                //     adUnitId: "ca-app-pub-5023637575934146/5453240415",
                //     adSize: AdmobBannerSize.BANNER),
               
                Box(),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(20),
                  color: Colors.lightBlue[100],
                  
                    child: Text(
                      "  *   DBMS",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),),
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
                               //   SizedBox(
                                 // width:30,
                                  //height: 30,
                                  //child:Buttonnotes(context,"$value")
                               // )
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
                      Text(
                        "  *   DAA",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(70),
                      // Buttonnotes(context, "Chemistryn"),
                    ],
                  ),
                ),
                // AdmobBanner(
                //     adUnitId: "ca-app-pub-5023637575934146/1791227385",
                //     adSize: AdmobBannerSize.BANNER),
                Container(height: 70,
                padding: EdgeInsets.all(20),
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  *    Principle of prog.language",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      //(context, "electricalnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                  padding:EdgeInsets.all(20),
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  *   Industrial management",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      //Buttonnotes(context, "pcnotes"),
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
                        "  *    Computer Networks",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(100),
                      // Buttonnotes(context, "Mathnotes"),
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
                        "  *   Compiler design",
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
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
          )),
        ));
  }
}

//here we declare all the quantum in firstyear year

class Thirdyearquantum extends StatefulWidget {
  @override
  _ThirdyearquantumState createState() => _ThirdyearquantumState();
}

class _ThirdyearquantumState extends State<Thirdyearquantum> {
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
        ),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Thirdyearquantum")
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
=======
      appBar: AppBar(
        title: Text(
          "Important questions",
          style: TextStyle(
              color: Colors.black,fontFamily: "Dancing", fontSize: 30, fontWeight: FontWeight.bold),
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
          color: Colors.black12,
          child: Column(
            children: <Widget>[
              Container(
                height: 70,
                color: Colors.deepPurple[100],
                child: Row(
                  children: <Widget>[
                    Text(
                      "   Compiler design",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Dancing"),
                    ),
                  ],
                ),
              ),
              // AdmobBanner(
              //     adUnitId: "ca-app-pub-5023637575934146/8023563430",
              //     adSize: AdmobBannerSize.BANNER),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        mycontainer(70),
                        Text(
                          "unit1",
                          style: TextStyle(
                              fontSize: 30,

                              color: Colors.red),
                        ),
                        Buttonnotes(context, "compilerdesignq_unit1")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        mycontainer(70),
                        Text(
                          "unit2",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red),
                        ),
                        Buttonnotes(context, "compilerdesignq_unit2")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        mycontainer(70),
                        Text(
                          "unit3",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red),
                        ),
                        Buttonnotes(context, "compilerdesignq_unit3")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        mycontainer(70),
                        Text(
                          "unit4",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red),
                        ),
                        Buttonnotes(context, "compilerdesignq_unit4")
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        mycontainer(70),
                        Text(
                          "unit5",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.red),
                        ),
                        //Buttonnotes(context, "cunit5")
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 70,
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "   Industrial Socioology",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontFamily: "Dancing"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit1",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(
                                  context, "IndustrialSocioology_qunit1")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit2",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(
                                  context, "IndustrialSocioology_qunit2")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit3",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(
                                  context, "IndustrialSocioology_qunit3")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit4",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(
                                  context, "IndustrialSocioology_qunit4")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit5",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(
                                  context, "IndustrialSocioology_qunit5")
                            ],
                          ),
                        ],
                      ),
                    ),
                    // AdmobBanner(
                    //     adUnitId: "ca-app-pub-5023637575934146/5205828405",
                    //     adSize: AdmobBannerSize.BANNER),
                    Box(),
                    Container(
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Computer Graphics",
                            style: TextStyle(
                                fontFamily: "Dancing",
                                fontSize: 36,
                                fontWeight: FontWeight.bold),
                          ),
                          //mycontainer(90),
                          Buttonnotes(context, "computergraphicsq"),
                        ],
                      ),
                    ),
                    Box(),
                    Container(
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "computer Network",
                            style: TextStyle(
                                fontFamily: "Dancing",
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          //mycontainer(90),
                          Buttonnotes(context, "computernetworkq"),
                        ],
                      ),
                    ),
                    Box(),
                    Container(
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Industrial Managment",
                            style: TextStyle(
                                fontFamily: "Dancing",
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          //mycontainer(100),
                          //Buttonnotes(context, "Industrial Managment Quantum"),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit1",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(context, "IMqunit1")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit2",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(context, "IMqunit2")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit3",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(context, "IMqunit3")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit4",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                               Buttonnotes(context, "IMqunit4")
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: <Widget>[
                              mycontainer(70),
                              Text(
                                "unit5",
                                style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.red),
                              ),
                              Buttonnotes(context, "IMqunit5")
                            ],
                          ),
                        ],
                      ),
                    ),
                    // AdmobBanner(
                    //     adUnitId: "ca-app-pub-5023637575934146/1266583394",
                    //     adSize: AdmobBannerSize.BANNER),
                    Box(),
                    Container(
                      height: 70,
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "   DAA",
                            style: TextStyle(
                                fontFamily: "Dancing",
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          mycontainer(20),
                          // Buttonnotes(context, "peq"),
                        ],
                      ),
                    ),
                    Box(),
                    Container(
                      height: 70,
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "DataBase Managment system",
                            style: TextStyle(
                                fontFamily: "Dancing",
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          mycontainer(5),
                          // Buttonnotes(context, "cq"),
                        ],
                      ),
                    ),
                    Box(),
                    Container(
                      height: 70,
                      color: Colors.deepPurple[100],
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Principle of programming language.",
                            style: TextStyle(
                                fontFamily: "Dancing",
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          mycontainer(10),
                          // Buttonnotes(context, "electricalq"),
                        ],
                      ),
                    ),
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
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
}

<<<<<<< HEAD
urllauncher(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
=======
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
    backgroundColor: Colors.yellow[100],
    heroTag: randomnumber,
    child: Icon(Icons.arrow_forward,color: Colors.black,),
    onPressed: () {
      {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Notes3and4(subject: x),
            ));
      }
    },
  );
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
}
