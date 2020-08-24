import "package:flutter/material.dart";
import "package:youtube_player_flutter/youtube_player_flutter.dart";



class Socialmedia extends StatefulWidget {
  String link;
 Socialmedia({Key key, this.link}) : super(key:key);
 
  @override
  _SocialmediaState createState() => _SocialmediaState();
}

class _SocialmediaState extends State<Socialmedia> {

   @override
  void initState() {
    // TODO: implement initState
    print(widget.link);
    super.initState();
  }
  @override

  
  Widget build(BuildContext context) {
    
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        onPressed:(){

          Navigator.pop(context);

        },
        child:Icon(Icons.arrow_back,color: Colors.white,size:50),
        backgroundColor: Colors.black,
      ),
      body:SafeArea(
              child: Center(
                child: WebView(
          initialUrl:widget.link,
          javascriptMode:JavascriptMode.unrestricted,


        // ),
              ),
      )
      
    ));
  }
}