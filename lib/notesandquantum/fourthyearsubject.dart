


import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

//import "package:Academicmaster/thirdAndfourthyearnotesandquantum/thirdAndfourthyearnotes.dart";


import "dart:math";
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:url_launcher/url_launcher.dart';
=======
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026



class Fourthyearsubject extends StatefulWidget {
  @override
  _FourthyearsubjectState createState() => _FourthyearsubjectState();
}

class _FourthyearsubjectState extends State<Fourthyearsubject> {
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
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
<<<<<<< HEAD
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Fourthyearnotes")
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
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 70,
                    color: Colors.lightBlue[100],
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Distributed system",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),

            //     AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/5453240415",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
             
                
                Container(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit1",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                        //Buttonnotes(context, "cunit1")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit2",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                       // Buttonnotes(context, "cunit2")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit3",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                        //Buttonnotes(context, "cunit3")
                        ],
                        
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit4",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                       // Buttonnotes(context, "cunit4")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit5",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                       // Buttonnotes(context, "cunit5")
                        ],
                        ),
                    ],
                  ),
                ),
                Box(),
                Container(
                  height: 70,
                  color: Colors.lightBlue[100],
                  child: Center(
                    child: Text(
                      "Artificial Intelligence",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
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
                       // Buttonnotes(context, "physicsunit1")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit2",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                        // Buttonnotes(context, "physicsunit1")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit3",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                        // Buttonnotes(context, "physicsunit3")
                        ],
                        
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit4",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                        //Buttonnotes(context, "cunit4")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit5",
                          style: TextStyle(fontSize: 30,color: Colors.red),),
                        //Buttonnotes(context, "cunit5")
                        ],
                        ),
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
                        "Cloud computing",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                     // mycontainer(70),
                      // Buttonnotes(context, "Chemistryn"),
                    ],
                  ),
                ),
            //      AdmobBanner(
            // adUnitId: "ca-app-pub-5023637575934146/1791227385",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                

                Container(
                  height: 70,
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Data comression",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(10),
                      //(context, "electricalnotes"),
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
                        "Machine learning",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(10),
                      //Buttonnotes(context, "pcnotes"),
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
                        "Understanding the human being",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(100),
                     // Buttonnotes(context, "Mathnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.lightBlue[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Human coumpterinterface",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      //Buttonnotes(context, "humancoumpterinterface"),
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

class Fourthyearquantum extends StatefulWidget {
  @override
  _FourthyearquantumState createState() => _FourthyearquantumState();
}

class _FourthyearquantumState extends State<Fourthyearquantum> {
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Important Questions",
            style: TextStyle(
<<<<<<< HEAD
                color: Colors.white,
=======
              color: Colors.black,
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
                fontFamily: "Dancing",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
<<<<<<< HEAD
        ),
        body: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Column(children: <Widget>[
            Container(
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Fourthyearquantum")
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
=======
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
                        "  Distributes system",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: "Dancing"),
                      ),
              
               ],
                  ),
                ),

            //      AdmobBanner(
            // adUnitId:  "ca-app-pub-5023637575934146/8023563430",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                Container(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit1",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Buttonnotes(context, "Distributessystemq_unit1")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit2",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Buttonnotes(context, "Distributessystemq_unit2")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit3",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Buttonnotes(context, "Distributessystemq_unit3")
                          ],
                          
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit4",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Buttonnotes(context, "Distributessystemq_unit4")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit5",
                            style: TextStyle(fontSize: 30,color: Colors.red),),
                          Buttonnotes(context, "Distributessystemq_unit5")
                          ],
                          ),
                      ],
                    ),
                  ),
            //       AdmobBanner(
            // adUnitId:  "ca-app-pub-5023637575934146/5205828405",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                Box(),
                Container(
                  height: 70,
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "  Cloud Computing",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(90),
                      Buttonnotes(context, "cloudcomputingq"),
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
                        "  Data comression",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(90),
                      Buttonnotes(context, "datacomressionq"),
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
                        "Machine learning",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(100),
                      Buttonnotes(context, "machinelearningq"),
                    ],
                  ),
                ),
                
            //       AdmobBanner(
            // adUnitId:  "ca-app-pub-5023637575934146/1266583394",
            //  adSize: AdmobBannerSize.BANNER
            //  ),
                
                Box(),
                Container(
                  height: 70,
                  color: Colors.deepPurple[100],
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Human Coumpter Interfaceq",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 21,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(20),
                      Buttonnotes(context, "humancoumpterinterfaceq"),
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
                        "Understanding The Humanbeing ",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(20),
                      Buttonnotes(context, "understandingthehumanbeingq"),
                    ],
                  ),
                ),
                
              ])
              )   
        ));
>>>>>>> 4f0c51ecc146e33bca79cdc6bdd63a1057dcb026
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

urllauncher(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
