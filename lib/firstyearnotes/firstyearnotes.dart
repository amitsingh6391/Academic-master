import "package:flutter/material.dart";
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Notes1 extends StatefulWidget {

  String subject;
  Notes1({Key key, this.subject}) : super(key:key);
  @override
  _Notes1State createState() => _Notes1State();
}

class _Notes1State extends State<Notes1> {

  String chemistrynotes = "https://drive.google.com/open?id=1LnwEa-G6VdcCip3wpD2bCReT25S5PYwO";
    //String Chemistrynotes = "https://drive";
 String chemistryq = "https://drive.google.com/file/d/1LnwEa-G6VdcCip3wpD2bCReT25S5PYwO/view?usp=sharing";
    
    //notes of physics
    String physicsunit1 =  "https://drive.google.com/open?id=1EPyTZusI6idqugU7UDyHQQTHhIJuNrr0";
    String physicsunit2 = "https://drive.google.com/open?id=184y66WSSndUDNV22DfwCA8yClaSX838j";
    String physicsunit3 = "https://drive.google.com/open?id=18_HOxSsfxnDTf6XTK49AtQvj74x8AOCJ";
    
    //notes of c
    String cunit1 = "https://drive.google.com/open?id=1EWXD1uEnmq3Wx7o5Duo1HSV_qDcScFTv";
    String cunit2 ="https://drive.google.com/open?id=189JsAKzMq3nwYnSj3RUE4M5aSKOq0JRk";
    String cunit3 = "https://drive.google.com/open?id=1EWnCYSQKn9EmmGRzCToqLmIkOTjnQdqL";
    String cunit4 = "https://drive.google.com/open?id=1E_WbxyEuTic5mAfOa8VZgU5x8xtXtwYn";
    String cunit5 = "https://drive.google.com/open?id=1Ea5reJMl8lFAJjy6IcAMuXDW7FFYXP6_";
    String cquantum = "https://drive.google.com/file/d/1cgaq6AtwwfrF7uWL7nxILYZZRTIFH5Pb/view?usp=sharing";

    String electricalnotes = "https://drive.google.com/open?id=1Equv7AO-_h9EZy7uw-A74HOWpZ3U9BNm";

//quantum for maths 2
    String Math2quantum = "https://drive.google.com/open?id=1EBpkaJRDwfXdIS4PmRCyThchHYpK77sQ";

    String electricalquantum = "https://drive.google.com/open?id=1VLjjro8NJL4oJtXTN32zyH_KaqZsUji6";

    String pcnotes = "https://drive.google.com/open?id=1LGTQTfOrD2C7cw9IHaIKD6wKkMKsTbYF";
    String professionalenglishq ="https://drive.google.com/file/d/1cCTcWXqK1K0WTghJo6Navuc_gI81-sxd/view?usp=sharing";

    String physicsq = "https://drive.google.com/file/d/1cpSpZuE0lWF7DYvcZSZrii4WtNf-EjGZ/view?usp=sharing";

    String doc;
    bool loading ;

    String Mysubject(){
     
     if(widget.subject=="math2q"){
       return
       (Math2quantum);
     }
     else if(widget.subject=="math2notes"){
       return(Math2quantum);
     }
     else if(widget.subject=="electricalquantum"){
       return (electricalquantum);
     }
     else if(widget.subject=="Chemistryn"){
       return (chemistrynotes);
     }
      else if(widget.subject=="Chemistryq"){
       return (chemistryq);
     }
     else if(widget.subject=="electricaln"){
       return (electricalnotes);
     }
     else if(widget.subject == "cunit1"){

       return (cunit1);

     }
     else if(widget.subject == "cunit2"){

       return (cunit2);

     }
     else if(widget.subject=="pcnotes"){
       return(
         pcnotes
       );

     }
    else if(widget.subject=="professionalenglish"){
       return(
         professionalenglishq
       );

     }
     else if(widget.subject == "cunit3"){

       return (cunit3);

     }
     else if(widget.subject == "cunit4"){

       return (cunit4);

     }
     else if(widget.subject == "cunit5"){

       return (cunit5);

     }
     else if(widget.subject == "cquantum"){

       return (cquantum);

     }
     else if(widget.subject == "physicsunit1"){

       return (physicsunit1);

     }
     else if(widget.subject == "physicsunit2"){

       return (physicsunit2);

     }
     else if(widget.subject == "physicsunit3"){

       return (physicsunit3);

     }
     else if(widget.subject=="physicsq"){
       return(physicsq);
     }
     else{
       return (cunit2);
     }


    }

  
  
     @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text(widget.subject),),
    body: WebView(
      initialUrl:Mysubject(),
      javascriptMode: JavascriptMode.unrestricted,
    )
      
    );
  }
}

