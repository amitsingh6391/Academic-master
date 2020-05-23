import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

//import 'package:webview_flutter/webview_flutter.dart';

class Notes2 extends StatefulWidget {
  final String subject;
  Notes2({Key key, @required this.subject}) : super(key: key);
  @override
  _Notes2State createState() => _Notes2State();
}

class _Notes2State extends State<Notes2> {
  //os notes
  String osunit1 =
      "https://drive.google.com/open?id=17gJY27V3u_D2AQUc_qMAoq7k3kmhLhij";
  String osunit2 =
      "https://drive.google.com/open?id=17jniO5EPdA9T9ADdsQg7qtXFuliSCoV5";
  String osunit3 =
      "https://drive.google.com/open?id=17wGyl3rUwQv6PrSQgKoxm7rDn1nMo82L";
  String osunit4 =
      "https://drive.google.com/open?id=181zKljm1sMyH2VsFq5TjfVuskyhkcu66";
  String osunit5 =
      "https://drive.google.com/open?id=185VmROtoV1rkHJsnizC7wfVH9cdzbGLV";


String taflunit2and3 = "https://drive.google.com/open?id=1JL6FHdBA-Wn3WPcC84ncZYEEIc8d734Q";
String taflnotes = "https://drive.google.com/open?id=1L7gmV8Pubod7QE-xKzXGRXKBsSLDPght";


String mpunit3 = "https://drive.google.com/open?id=1bfsGrCjX1rk1elSUiy340a-d-LE-qtaz";
String mpunit4 = "https://drive.google.com/open?id=1cIcJh1MDmE53hbycJYvDrVoUBxGJlIZK";
String mpunit5 = "https://drive.google.com/open?id=1FMKHTT0iZHmQ7I5INNQnxIN9Xf09ozzW";

String mpnotesunitall= "https://drive.google.com/open?id=0BzDyTIqs5YMGM2tMN2pnMmdLYkk";

String engineeringscience = "https://drive.google.com/open?id=1GGc-CmSznGqjdFTlLQqWj1b9LC24sdze";
String mathnotes = "https://drive.google.com/open?id=1GIaNhd5IbNQwaVahaWUBnF5Xl0M_FqKBNHWtkR1Qju4";
//Quntum url

  String math4q =
      "https://drive.google.com/open?id=1J31YcBC9-eBhihmcV4xccnpbABZbbyad";

  String mpq =
      "https://drive.google.com/open?id=1JuCOwoDB30WFzJpc2rN4CPOOUeBTU-o-";

  String uhmvq =
      "https://drive.google.com/open?id=1JR9HH71REbSb2DTS1rDJ-0apxkKu8LoH";

  String taflunit1q =
      "https://drive.google.com/open?id=1JSBW7hv_syKNxN_X8VnGM1X_ud8e8Ewl";

  String taflunit2and3q =
      "https://drive.google.com/open?id=1JL6FHdBA-Wn3WPcC84ncZYEEIc8d734Q";

  String taflunit4q =
      "https://coderzoneschool.files.wordpress.com/2020/04/unit-4-tafl.pdf";

      String taflunit5q = "https://drive.google.com/open?id=1K6uPzJeV959nDVwTbeEdLampkOE-X3z_";

  String cssq =
      "https://drive.google.com/open?id=1JezS_3r3cG04pvpbKWVYY20Zoegri4e7";

    String osq = "https://drive.google.com/open?id=1K48ntlO0cwJhRVwycmgbQvpo6xULNDSZ";


String Mysubject(){
     
     if(widget.subject=="math4q"){
       return
       (math4q);
     }
     else if(widget.subject=="cssq"){
       return (cssq);
     }
     else if(widget.subject=="mpq"){
       return (mpq);
     }
     else if(widget.subject == "uhmvq"){

       return (uhmvq);

     }
     else if(widget.subject == "taflunit1q"){

       return (taflunit1q);

     }
     else if(widget.subject=="taflunit2and3q"){
       return(
         taflunit2and3q
       );

     }
     else if(widget.subject == "taflunit4q"){

       return (taflunit4q);

     }
     else if(widget.subject == "osunit1"){

       return (osunit1);

     }
     else if(widget.subject == "osunit2"){

       return (osunit2);

     }
     else if(widget.subject == "osunit3"){

       return (osunit3);

     }
     else if(widget.subject == "osunit4"){

       return (osunit4);

     }
     else if(widget.subject == "osunit5"){

       return (osunit5);

     }else if(widget.subject == "osq"){

       return (osq);

     }else if(widget.subject == "taflunit5q"){

       return (taflunit5q);

     }
     else if(widget.subject == "taflnotes"){

       return (taflnotes);

     }
     else if(widget.subject == "mpunit3"){

       return (mpunit3);

     }
     else if(widget.subject == "mpunit4"){

       return (mpunit4);

     }
     else if(widget.subject == "mpunit5"){

       return (mpunit5);

     }
     else if(widget.subject == "engineeringscience"){

       return (engineeringscience);

     }
     else if(widget.subject == "mathnotes"){

       return (mathnotes);

     }
     else{
       return (osunit3);
     }


    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("notes and quantum",style: TextStyle(
        fontFamily: "Dancing",fontSize: 40,fontWeight: FontWeight.bold
      ),)),
      body: WebView(
        initialUrl: Mysubject(),
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
