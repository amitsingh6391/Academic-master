import 'package:Academicmaster/pages/commentspage.dart';
import 'package:Academicmaster/services/crud.dart';
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:video_player/video_player.dart';


class Oslecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var unit1 = [
    "lecture1",
    "lecture2",
    "lecture3",
    "lecture4",
    "lecture5",
    "lecture6",
    "lecture7"
  ];
  var unit2 = [
    "lecture1,2",
    "lecture2,2",
    "lecture3,3",
    "lecture4,4",
    "lecture5,5",
    "lecture6,6",
    "lecture7,7"
  ];
  var unit3 = [
    "lecture1,3",
    "lecture2,3",
    "lecture3,3",
    "lecture4,3",
    "lecture5,3",
    "lecture6,3",
    "lecture7,3",
    "lecture8,3",
    "lecture9,3",
    "lecture10,3",
    "lecture11,3",
    "lecture12,3",
    "lecture13,3",
    "lecture14,3",
    "lecture15,3",
    "lecture16,3",
    "lecture17,3",
    "lecture18,3",
    "lecture19,3"
  ];

  var unit4 = [
    "lecture1,4",
    "lecture2,4",
    "lecture3,4",
    "lecture4,4",
    "lecture5,4",
    "lecture6,4",
    "lecture7,4",
    "lecture8,4",
    "lecture9,4",
    "lecture10,4",
    "lecture11,4",
  ];

  var unit5 = [
    "lecture1,5",
    "lecture2,5",
    "lecture3,5",
    "lecture4,5",
    "lecture5,5",
    "lecture6,5",
    "lecture7,5",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Youtube Player "),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.black,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Operating system lecture unit wise",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  //color: Colors.,
                  child: Center(
                    child: Text(
                      "unit1",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DropdownButton<String>(
                    hint: Text(
                      "lectures",
                      style: TextStyle(fontSize: 30),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconEnabledColor: Colors.black,
                    items: unit1.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem));
                      },
                    ).toList(),
                    onChanged: (dropDownStringItem) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondyearvideo(
                                  lecture: dropDownStringItem)));
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "unit2",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DropdownButton<String>(
                    hint: Text(
                      "lectures",
                      style: TextStyle(fontSize: 30),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconEnabledColor: Colors.black,
                    items: unit2.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem));
                      },
                    ).toList(),
                    onChanged: (dropDownStringItem) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondyearvideo(
                                  lecture2: dropDownStringItem)));
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "unit3",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DropdownButton<String>(
                    hint: Text(
                      "lectures",
                      style: TextStyle(fontSize: 30),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconEnabledColor: Colors.black,
                    items: unit3.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem));
                      },
                    ).toList(),
                    onChanged: (dropDownStringItem) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondyearvideo(
                                  lecture3: dropDownStringItem)));
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "unit4",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DropdownButton<String>(
                    hint: Text(
                      "lectures",
                      style: TextStyle(fontSize: 30),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconEnabledColor: Colors.black,
                    items: unit4.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem));
                      },
                    ).toList(),
                    onChanged: (dropDownStringItem) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondyearvideo(
                                  lecture4: dropDownStringItem)));
                    }),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Text(
                      "unit5",
                      style: TextStyle(
                          fontFamily: "Dancing",
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DropdownButton<String>(
                    hint: Text(
                      "lectures",
                      style: TextStyle(fontSize: 30),
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 50,
                    ),
                    iconEnabledColor: Colors.black,
                    items: unit5.map(
                      (String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem));
                      },
                    ).toList(),
                    onChanged: (dropDownStringItem) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Secondyearvideo(
                                  lecture5: dropDownStringItem)));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//for a particular video we used this statefull widget

class Secondyearvideo extends StatefulWidget {
  String lecture, lecture2,lecture3,lecture4,lecture5;
  Secondyearvideo({Key key, this.lecture, Key key2, this.lecture2,Key key3, this.lecture3,

  Key key4, this.lecture4, Key key5, this.lecture5,

  })
      : super(key: key);
  @override
  _SecondyearvideoState createState() => _SecondyearvideoState();
}

class _SecondyearvideoState extends State<Secondyearvideo> {
  //all the lectures url

  //unit 1...
  String Video1 =
      "https://www.youtube.com/watch?v=YwqexcfbucE&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD";

  String Video2 =
      "https://www.youtube.com/watch?v=ENYFsXTaV2Y&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=2";
  String Video3 =
      "https://www.youtube.com/watch?v=VtqPyXDaMr4&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=3";
  String Video4 =
      "https://www.youtube.com/watch?v=UQWV3DJ9Zj0&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=4";
  String Video5 =
      "https://www.youtube.com/watch?v=OOLy8jnl1hA&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=5";
  String Video6 =
      "https://www.youtube.com/watch?v=UcXWaeRikSo&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=6";
  String Video7 =
      "https://www.youtube.com/watch?v=xJ9yesCHLCI&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=7";

  //unit 3
  String unit3_1 =
      "https://www.youtube.com/watch?v=b8lRqwTuWZE&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=8";
  String unit3_2 =
      "https://www.youtube.com/watch?v=x_UpLHXF9dU&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=9";
  String unit3_3 =
      "https://www.youtube.com/watch?v=qO2vg87t6oY&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=10";
  String unit3_4 =
      "https://www.youtube.com/watch?v=cviEfwtdcEE&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=11";
  String unit3_5 =
      "https://www.youtube.com/watch?v=NzbeU0DQTDo&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=12";
  String unit3_6 =
      "https://www.youtube.com/watch?v=cc-9wfIoMtg&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=13";
  String unit3_7 =
      "https://www.youtube.com/watch?v=U980LhlwZLg&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=14";

  String unit3_8 =
      "https://www.youtube.com/watch?v=n2SzwU8Irhk&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=15";
  String unit3_9 =
      "https://www.youtube.com/watch?v=cjZAhWWbQg4&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=16";

  String unit3_10 =
      "https://www.youtube.com/watch?v=Z_t9MHn1ogw&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=17";
  String unit3_11 =
      "https://www.youtube.com/watch?v=nEO3JZ48NPQ&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=18";

  String unit3_12 =
      "https://www.youtube.com/watch?v=cZQ1zYr1LGc&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=19";

  String unit3_13 =
      "https://www.youtube.com/watch?v=_zOTMOubT1M&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=20";
  String unit3_14 =
      "https://www.youtube.com/watch?v=JABarkXjxpk&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=21";
  String unit3_15 =
      "https://www.youtube.com/watch?v=U7zKBXg-YOI&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=22";
  String unit3_16 =
      "https://www.youtube.com/watch?v=ok5jgFgUzrs&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=23";
  String unit3_17 =
      "https://www.youtube.com/watch?v=d8FYxikctgM&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=24";
  String unit3_18 =
      "https://www.youtube.com/watch?v=L3G9lzm-FSQ&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=25";
  String unit3_19 =
      "https://www.youtube.com/watch?v=RSztuZf8-lY&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=26";
  String unit2_1 =
      "https://www.youtube.com/watch?v=4BInccFSKso&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=27";
  String unit2_2 =
      "https://www.youtube.com/watch?v=PoPePvh3cnY&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=29";
  String unit2_3 =
      "https://www.youtube.com/watch?v=oW8y-ctaIso&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=30";
  String unit2_4 =
      "https://www.youtube.com/watch?v=41am-gNWSpA&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=31";
  String unit2_5 =
      "https://www.youtube.com/watch?v=XAsAAJSotA4&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=32";
  String unit2_6 =
      "https://www.youtube.com/watch?v=rY75gHufIuk&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=33";
  String unit2_7 =
      "https://www.youtube.com/watch?v=VcVbUbPNIfw&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=34";
  String unit4_1 =
      "https://www.youtube.com/watch?v=TAk822Wz4x4&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=41";

  String unit4_2 =
      "https://www.youtube.com/watch?v=LLhgnIYpQaI&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=42";
  String unit4_3 =
      "https://www.youtube.com/watch?v=PuZ_xChlInM&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=43";
  String unit4_4 =
      "https://www.youtube.com/watch?v=EO4MlDEO89U&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=44";
  String unit4_5 =
      "https://www.youtube.com/watch?v=YcX-awpW9yc&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=45";
  String unit4_6 =
      "https://www.youtube.com/watch?v=8_dDcNzogSg&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=46";
  String unit4_7 =
      "https://www.youtube.com/watch?v=xAvC-MJ_Sz8&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=47";
  String unit4_8 =
      "https://www.youtube.com/watch?v=Jftjc0mMwIg&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=48";
  String unit4_9 =
      "https://www.youtube.com/watch?v=RBou-ekL1RI&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=49";
  String unit4_10 =
      "https://www.youtube.com/watch?v=NMtHuK2i2dc&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=53";
  String unit4_11 =
      "https://www.youtube.com/watch?v=gRzwXIRG1Dc&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=54";

  //unit 5...
  String unit5_1 =
      "https://www.youtube.com/watch?v=aKmuGwHj3Cw&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=55";
  String unit5_2 =
      "https://www.youtube.com/watch?v=034pt6kFLe8&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=56";
  String unit5_3 =
      "https://www.youtube.com/watch?v=0Q-hvtonCfo&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=57";
  String unit5_4 =
      "https://www.youtube.com/watch?v=gQqZ7SQ2Yfw&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=58";
  String unit5_5 =
      "https://www.youtube.com/watch?v=Au9BxxLEm5M&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=59";
  String unit5_6 =
      "https://www.youtube.com/watch?v=5hKKzoLk1RY&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=60";
  String unit5_7 =
      "https://www.youtube.com/watch?v=XqE8hka8ayY&list=PLmXKhU9FNesSFvj6gASuWmQd23Ul5omtD&index=61";

  YoutubePlayerController _controller;
  TextEditingController commentsEditingController = TextEditingController();
  CrudMethods crudMethods = new CrudMethods();

  addcomment() async {
    if (commentsEditingController.text.isNotEmpty) {
      Map<String, dynamic> postcomments = {
        "comments_by": Constants.myName,
        "comments": commentsEditingController.text,
        'time': DateTime.now().toLocal()
      };

      crudMethods.addcomments(postcomments).then((result) {});
      //Navigator.push(context,MaterialPageRoute(builder:(context)=>Comments()));
    } else {
      print("no data");
    }
  }

  String getlecture() {
    if (widget.lecture == "lecture1") {
      return (Video1);
    } else if (widget.lecture == "lecture2") {
      return (Video2);
    } else if (widget.lecture == "lecture3") {
      return (Video3);
    } else if (widget.lecture == "lecture4") {
      return (Video4);
    } else if (widget.lecture == "lecture5") {
      return (Video5);
    } else if (widget.lecture == "lecture6") {
      return (Video6);
    } else if (widget.lecture == "lecture7") {
      return (Video7);
    } else if (widget.lecture2 == "lecture1,2") {
      return (unit2_1);
    } else if (widget.lecture2 == "lecture2,2") {
      return (unit2_2);
    } else if (widget.lecture2 == "lecture3,2") {
      return (unit2_3);
    } else if (widget.lecture2 == "lecture4,2") {
      return (unit2_4);
    } else if (widget.lecture2 == "lecture5,2") {
      return (unit2_5);
    } else if (widget.lecture2 == "lecture6,2") {
      return (unit2_6);
    } else if (widget.lecture2 == "lecture7,2") {
      return (unit2_7);
    }
    else if (widget.lecture3 == "lecture1,3") {
      return (unit3_1);
    }
    else if (widget.lecture3 == "lecture2,3") {
      return (unit3_2);
    }
    else if (widget.lecture3 == "lecture3,3") {
      return (unit3_3);
    }
    else if (widget.lecture3 == "lecture4,3") {
      return (unit3_4);
    }
    else if (widget.lecture3 == "lecture5,3") {
      return (unit3_5);
    }
    else if (widget.lecture3 == "lecture6,3") {
      return (unit3_6);
    }
    
    else if (widget.lecture3 == "lecture7,3") {
      return (unit3_7);
    }
    else if (widget.lecture3 == "lecture8,3") {
      return (unit3_8);
    }
    else if (widget.lecture3 == "lecture9,3") {
      return (unit3_9);
    }
    else if (widget.lecture3 == "lecture10,3") {
      return (unit3_10);
    }
    else if (widget.lecture3 == "lecture11,3") {
      return (unit3_11);
    }
    else if (widget.lecture3 == "lecture12,3") {
      return (unit3_12);
    }
    else if (widget.lecture3 == "lecture13,3") {
      return (unit3_13);
    }
    else if (widget.lecture3 == "lecture14,3") {
      return (unit3_14);
    }
    else if (widget.lecture3 == "lecture15,3") {
      return (unit3_15);
    }
    else if (widget.lecture3 == "lecture16,3") {
      return (unit3_16);
    }
    else if (widget.lecture3 == "lecture17,3") {
      return (unit3_17);
    }
    else if (widget.lecture3 == "lecture18,3") {
      return (unit3_18);
    }
    else if (widget.lecture3 == "lecture19,3") {
      return (unit3_19);
    }
    else if (widget.lecture4 == "lecture1,4") {
      return (unit4_1);
    }else if (widget.lecture4 == "lecture2,4") {
      return (unit4_2);
    }else if (widget.lecture4 == "lecture3,4") {
      return (unit4_3);
    }else if (widget.lecture4 == "lecture4,4") {
      return (unit4_4);
    }else if (widget.lecture4 == "lecture5,4") {
      return (unit4_5);
    }else if (widget.lecture4 == "lecture6,4") {
      return (unit4_6);
    }else if (widget.lecture4 == "lecture7,4") {
      return (unit4_7);
    }else if (widget.lecture4 == "lecture8,4") {
      return (unit4_8);
    }else if (widget.lecture4 == "lecture9,4") {
      return (unit4_9);
    }else if (widget.lecture4 == "lecture10,4") {
      return (unit4_10);
    }else if (widget.lecture4 == "lecture11,4") {
      return (unit4_11);
    }
    
    else if (widget.lecture5 == "lecture1,5") {
      return (unit5_1);
    }
    else if (widget.lecture5 == "lecture2,5") {
      return (unit5_2);
    }else if (widget.lecture5 == "lecture3,5") {
      return (unit5_3);
    }else if (widget.lecture5 == "lecture4,5") {
      return (unit5_4);
    }else if (widget.lecture5 == "lecture5,5") {
      return (unit5_5);
    }else if (widget.lecture5 == "lecture6,5") {
      return (unit5_6);
    }else if (widget.lecture5 == "lecture7,5") {
      return (unit5_7);
    }
  }

  @override
  void initState() {
    var x = getlecture();
    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(x));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.black12,
 appBar: AppBar(
   backgroundColor: Colors.orange,
   
   
 ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,

              // padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  YoutubePlayer(
                    width: MediaQuery.of(context).size.width,
                    controller: _controller,
                    showVideoProgressIndicator: true,
                  ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  // Container(
                  //   height: 50,
                  //   // color: Colors.black12,
                  //   child: Expanded(
                  //     child: Row(
                  //       children: <Widget>[
                  //         IconButton(
                  //             icon: Icon(
                  //               Icons.thumb_up,
                  //               color: Colors.blue,
                  //               size: 40,
                  //             ),
                  //             tooltip: "thanks $Constants.myname"),
                  //         SizedBox(
                  //           width: 10,
                  //         ),
                  //         IconButton(
                  //           icon: Icon(
                  //             Icons.thumb_down,
                  //             color: Colors.red,
                  //             size: 40,
                  //           ),
                  //           tooltip: "we try best next time $Constants.myname",
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 20),
                  Container(
                    height: 500,
                    child: Column(children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Colors.white,
                            Colors.green,
                          ]),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: commentsEditingController,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    hintText: "do comments ...",
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                addcomment();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (conetxt) => Comments()));
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.pink,
                                          Colors.yellow,
                                        ],
                                        begin: FractionalOffset.topLeft,
                                        end: FractionalOffset.bottomRight),
                                    borderRadius: BorderRadius.circular(40)),
                                padding: EdgeInsets.all(12),
                                child: Icon(Icons.send),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              //child:Text("hu")
            ),
          ),
        ));
  }
}










