import 'package:Academicmaster/notesandquantum/Subjectwebview.dart';
import 'package:Academicmaster/services/admob_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class Videotutorials extends StatefulWidget {
  final String collection;
  Videotutorials({@required this.collection});
  @override
  _VideotutorialsState createState() => _VideotutorialsState();
}

class _VideotutorialsState extends State<Videotutorials> {
  //final ams = AdMobService(); //call admobclass from services

  @override
  void initState() {
    //intilazied the appid
    super.initState();
    //Admob.initialize(ams.getAdMobAppId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF6F35A5),
          title: Text(
            "Video Tutorials",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Dancing",
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
            color: Colors.white,
            child: Column(children: <Widget>[
              Container(
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection(widget.collection)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Text("Loading");
                      }
                      return ListView.builder(
                          reverse: true,
                          physics: NeverScrollableScrollPhysics(),
                          // padding: EdgeInsets.symmetric(vertical: 16),
                          itemCount: snapshot.data.documents.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Videotile(
                              subjectname: snapshot.data.documents[index]
                                  .data()['coursename'],
                              link:
                                  snapshot.data.documents[index].data()["link"],
                              thumbnail: snapshot.data.documents[index]
                                  .data()["thumbnail"],
                              desc:
                                  snapshot.data.documents[index].data()["desc"],
                            );
                          });
                    }),
              ),
            ]),
          )),
        ));
  }
}

class Videotile extends StatefulWidget {
  final String subjectname, link, thumbnail, desc;
  Videotile(
      {@required this.subjectname,
      @required this.link,
      @required this.thumbnail,
      @required this.desc});
  @override
  _VideotileState createState() => _VideotileState();
}

class _VideotileState extends State<Videotile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              color: Colors.white,
              width: size.width * 1,
              child: Column(
                children: <Widget>[
                  Stack(children: [
                    Card(
                      elevation: 10,
                      shadowColor: Colors.black,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 4,
                        width: size.width * 0.8,
                        child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(widget.thumbnail)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 120, right: 50, top: 70),
                      child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 25,
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
                            child: Icon(
                              Icons.play_circle_filled,
                              color: Colors.black,
                              size: 20,
                            ),
                          )),
                    )
                  ]),
                  Row(
                    children: <Widget>[
                      Text(
                        widget.subjectname,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.desc,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: "Dancing",
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

urllauncher(String link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
