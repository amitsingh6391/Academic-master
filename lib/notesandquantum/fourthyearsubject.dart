import 'package:flutter/material.dart';

import 'package:admob_flutter/admob_flutter.dart';
import "package:Academicmaster/services/admob_service.dart";

import "package:Academicmaster/thirdAndfourthyearnotesandquantum/thirdAndfourthyearnotes.dart";


import "dart:math";




class Fourthyearsubject extends StatefulWidget {
  @override
  _FourthyearsubjectState createState() => _FourthyearsubjectState();
}

class _FourthyearsubjectState extends State<Fourthyearsubject> {

  final ams = AdMobService(); //call admobclass from services

   @override
  void initState() {               //intilazied the appid
    super.initState();
    Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Subject",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                fontFamily: "Dancing"),
          ),
          backgroundColor: Colors.redAccent,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.green,
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Distributed system",
                          style: TextStyle(
                              fontFamily: "Dancing",
                              fontSize: 40,
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
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                        //Buttonnotes(context, "cunit1")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit2",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                       // Buttonnotes(context, "cunit2")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit3",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                        //Buttonnotes(context, "cunit3")
                        ],
                        
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit4",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                       // Buttonnotes(context, "cunit4")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit5",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                       // Buttonnotes(context, "cunit5")
                        ],
                        ),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      "Artificial Intelligence",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 35,
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
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
                       // Buttonnotes(context, "physicsunit1")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit2",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
                        // Buttonnotes(context, "physicsunit1")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit3",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
                        // Buttonnotes(context, "physicsunit3")
                        ],
                        
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit4",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
                        //Buttonnotes(context, "cunit4")
                        ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                        children: <Widget>[
                          mycontainer(70),
                          Text("unit5",
                          style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.green),),
                        //Buttonnotes(context, "cunit5")
                        ],
                        ),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.pink,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Cloud computing",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 40,
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
                  color: Colors.yellowAccent,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Data comression",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(10),
                      //(context, "electricalnotes"),
                    ],
                  ),
                ),

                Box(),
                Container(
                  color: Colors.brown,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Machine learning",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(10),
                      //Buttonnotes(context, "pcnotes"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.orange,
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
                  color: Colors.purple,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Human coumpterinterface",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      mycontainer(10),
                      //Buttonnotes(context, "humancoumpterinterface"),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ));
  }
}

//here we declare all the quantum in fourthyear year

class Fourthyearquantum extends StatefulWidget {

  

  @override
  _FourthyearquantumState createState() => _FourthyearquantumState();
}

class _FourthyearquantumState extends State<Fourthyearquantum> {
  
  final ams = AdMobService(); //call admobclass from services

  //  @override
  // void initState() {               //intilazied the appid
  //   super.initState();
  //   Admob.initialize(ams.getAdMobAppId());
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Important questions",
            style: TextStyle(
                fontFamily: "Dancing",
                fontSize: 35,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black12,
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
                        "Distributessystem",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
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
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Buttonnotes(context, "Distributessystemq_unit1")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit2",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Buttonnotes(context, "Distributessystemq_unit2")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit3",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Buttonnotes(context, "Distributessystemq_unit3")
                          ],
                          
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit4",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
                          Buttonnotes(context, "Distributessystemq_unit4")
                          ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                          children: <Widget>[
                            mycontainer(70),
                            Text("unit5",
                            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.pink),),
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
                  color: Colors.orange,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "cloudcomputing",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(90),
                      Buttonnotes(context, "cloudcomputingq"),
                    ],
                  ),
                ),
                Box(),
                Container(
                  color: Colors.yellowAccent,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Data comression",
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
                  color: Colors.pink,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Machine learning",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 40,
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
                  color: Colors.blueGrey,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Human Coumpter Interfaceq",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      //mycontainer(20),
                      Buttonnotes(context, "humancoumpterinterfaceq"),
                    ],
                  ),
                ),
                 Box(),
                Container(
                  color: Colors.blueGrey,
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Understanding The Humanbeing ",
                        style: TextStyle(
                            fontFamily: "Dancing",
                            fontSize: 25,
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
              builder: (context) => Notes3and4(subject: x),
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





