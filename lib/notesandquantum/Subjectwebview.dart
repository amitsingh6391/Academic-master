import "package:flutter/material.dart";

import "package:youtube_player_flutter/youtube_player_flutter.dart";



class Subjectwebview extends StatefulWidget {
 final String link,bar;
  Subjectwebview({@required this.link,@required this.bar});
  @override
  _SubjectwebviewState createState() => _SubjectwebviewState();
}

class _SubjectwebviewState extends State<Subjectwebview> {
  @override

  //https://erp.aktu.ac.in/WebPages/OneView/OneView.aspx
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: (){
Navigator.pop(context);
      },
      child:Icon(Icons.arrow_back,color: Colors.white,)),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(widget.bar,style:TextStyle(fontFamily: "Dancing")),
      ),
      body:  Center(
              child: WebView(
          initialUrl:widget.link,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}