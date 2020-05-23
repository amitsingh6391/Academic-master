
// import 'package:TheMitian/pages/homescreen.dart';
// import 'package:flutter/cupertino.dart';
// import "package:flutter/material.dart";
// import "os.dart";
// import "package:TheMitian/pages/homepage.dart";

// import "Loginscreen/loginscreen.dart";

// import "package:TheMitian/view/viewmain.dart";


// class NavDrawer extends StatefulWidget {
//   @override
//   _NavDrawerState createState() => _NavDrawerState();
// }

// class _NavDrawerState extends State<NavDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         children: <Widget>[
//           DrawerHeader(
//             child: Text(
//               "MITian",
//               style: TextStyle(
//                   fontFamily: "Dancing",
//                   fontSize: 30,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.red,
//               image: DecorationImage(
//                 fit: BoxFit.fill,
//                 image: AssetImage("images/firstgif1.gif"),
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.share),
//             title: Text("Share"),
//             onTap: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Share(context),
//                   ));
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.supervised_user_circle),
//             title: Text("User Guidlines"),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => User()));
//             },
//             //trailing: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             leading: Icon(Icons.feedback),
//             title: Text("Feedback"),
//             onTap: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (context) => Feedback()));
//             },
//             //trailing: Icon(Icons.dashboard),
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text("Setting"),
//             onTap: () {
//                Navigator.push(context,MaterialPageRoute(builder: (context)=>Loginuser()));
//             },
//             //trailing: Icon(Icons.dashboard),
//           ),
         

         

        
//         ],
//       ),
//     );
//   }
// }

// Container Share(context) {
//   return Container(
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(30),
//       gradient: LinearGradient(
//         colors: [
//           Colors.blue,
//           Colors.pink,
//           Colors.yellow,
//         ],
//       ),
//     ),
//     child: AlertDialog(
//       title: Text("share with Your friends"),
//       content: Text(
//           "Dear users pleas share this app with your friends and give us rating on playstore"),
//       actions: <Widget>[
//         FlatButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text(
//             "ok",
//             style: TextStyle(fontSize: 30),
//           ),
//         )
//       ],
//     ),
//   );
// }

// SizedBox box(double x, double y) {
//   return SizedBox(
//     height: x,
//     width: y,
//   );
// }

// class User extends StatefulWidget {
//   @override
//   _UserState createState() => _UserState();
// }

// class _UserState extends State<User> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             colors: [
//       Colors.blue,
//       Colors.pink,
//       Colors.yellow,
//             ],
//           ),
//         ),
//           child: Column(
//             children: <Widget>[
//       Box(30, 20),
//       Text("User guidlines",
//           style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
//       Box(20, 20),
//       Text(
//           " **  We provide a platform that's help each and every student how want's to learn something",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           Box(20,20),
//       Text(
//           "**  Inside our app we are try to coverd all the notes and important question regarding to your examination "
//           ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//          Box(20,20),
//       Text(
//           ' **  you can also chat with your friends and your in chat section',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           Box(20,20),
//       Text(
//           "**  if u have any doubt u can ask your question immidetly we are try to solve them",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

//       Box(30, 20),
//       Text(
//           "**  u can  check also video of your each subject we are try to give a best resourse for study so that u can learn in easyway",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//           Box(30,30),
//           RaisedButton(
            
//             onPressed: (){

            
//            // Navigator.push(context,MaterialPageRoute(builder: (context)=>Homepage()));
//            Navigator.pop(context);
            
//           },
//           child: Text("Go to home"),
//           )
//             ],
//           ),
//         ),
//     );
//   }
// }

// class Feedback extends StatefulWidget {
//   @override
//   _FeedbackState createState() => _FeedbackState();
// }

// class _FeedbackState extends State<Feedback> {
//   TextEditingController feedbackcontroller = new TextEditingController();

  

// Container Submmit() {
//    return 
//     Container(
//        decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           gradient: LinearGradient(
//             colors: [
//       Colors.blue,
//       Colors.pink,
//       Colors.yellow,
//             ],
//           ),
//         ),
//       child: AlertDialog(
          
//           title:Text("Thanks"),
  
//             content:Text("we are happy to see that u are give us your valuble feedback"),
  
//             actions: <Widget>[
  
//               RaisedButton(
  
//       onPressed: (){
  
//         Navigator.push(context , MaterialPageRoute(builder:(context)=>Homescreen(),));
//       // Navigator.pop(context);
  
//       },
  
//       child:Text("ok")
  
//               )
  
//             ],
  
  
  
//           ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(30),
//         gradient: LinearGradient(
//           colors: [
//             Colors.blue,
//             Colors.pink,
//             Colors.yellow,
//           ],
//         ),
//       ),
//       child: Column(
//         children: <Widget>[
//           Box(100, 30),
//           Container(
//             child: TextField(
//               controller: feedbackcontroller,
//               decoration: InputDecoration(
//                   hintText: "give us feedback",
//                   icon: Icon(Icons.feedback),
//                   enabled: true,
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25),
//                       borderSide:
//                           BorderSide(color: Colors.cyanAccent, width: 50))),
//             ),
//           ),
//          // Submit(),
//           Box(50,50),
//           RaisedButton(
//             onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>Submmit()));
//             },
//             child: Text("submmit"),
//           ),

//           Container(
//             height: 200,
//             width:MediaQuery.of(context).size.width,
//             child: Text(feedbackcontroller.text),
//           )

        

          

        
         
//         ],
//       ),
//     ));
//   }
// }


//neeraj code here....




import 'package:Academicmaster/pages/homescreen.dart';
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

import "package:Academicmaster/pages/homepage.dart";

import "Loginscreen/loginscreen.dart";

import "package:Academicmaster/view/viewmain.dart";


class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(

              child:Text("Academic Master",
            style: GoogleFonts.caveat(
            fontWeight: FontWeight.bold,
            fontSize: 40),
            ),
            ),
            decoration: BoxDecoration(gradient: 
            LinearGradient(colors: [Color(0xFF00fd80),Color(0xFF00068b)],
            ),
           
            
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => About(context),
                  ));
            },
          ),
        
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Share(context),
                  ));
            },
          ),
         
            
          
          ListTile(
            leading: Icon(Icons.feedback),
            title: Text("Feedback"),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Feedback()));
            },
            //trailing: Icon(Icons.dashboard),
          ),
        
        ],
      ),
    );
  }
}

Container Share(context) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      gradient: LinearGradient(
        colors: [
          Colors.blue[100],
          Colors.pink[100],
          Colors.yellow[100],
        ],
      ),
    ),
    child: AlertDialog(
      title: Text("share with Your friends"),
      content: Text(
          "Dear users pleas share this app with your friends and give us rating on playstore"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            "ok",
            style: TextStyle(fontSize: 30),
          ),
        )
      ],
    ),
  );
}

SizedBox box(double x, double y) {
  return SizedBox(
    height: x,
    width: y,
  );
}
class About extends StatefulWidget{
  About(BuildContext context);

  @override
  _AboutState createState() => _AboutState();
}
class _AboutState extends State<About>{
  
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFF8cc8fa),
      title:  Text("About Us ",
          style: GoogleFonts.novaMono(
            color: Colors.black,
            fontSize: 40,
             )),
               ),
      
      body: SingleChildScrollView(
              child: Container(
            decoration: BoxDecoration(
             gradient: LinearGradient(
              colors: [
        Colors.white,
        Color(0xFF8cc8fa),
              ],
            ),
          ),
            child: Column(
              children: <Widget>[
                  Container(
                    height: 10,
                  ),
           
        Text("",
        ),

        Text(
            " Founded in 2020 Academic Master  provides a platform that helps each and every student to learn .  Inside our app we have tried to cover all the notes and important question regarding to your examination in our reach "
            ,style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold)),
           
        Text( " * you can also chat with your friends  in chat section  and ask your querries, our response team will try to respond ",
        style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold)
    ),
          

    
        Text(
            "*  videos are provided for your convinience we have tried our best  to give you  a better platform to study free of cost",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              height: 10,
            ),
            Container(
              height: 36,
              child:Row(
                  children:<Widget>[
                  Text("Created by:",
                  style: GoogleFonts.bitter(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold                )
                  ),
                  ]
              
              )
            ),
            Container(padding: EdgeInsets.all(10),
                    child:Column(children: <Widget>[
                      
                  Text("Amit Singh",
                  style: GoogleFonts.indieFlower(fontSize:27,fontWeight: FontWeight.bold
                  ),
                  
                  ),
                  Text("Neeraj Gailakoti",
                  style: GoogleFonts.indieFlower(
                    fontSize:27,fontWeight:FontWeight.bold
                  ),)
                  ],)),
                    Container(
              height: 36,
              child:Row(
                  children:<Widget>[
                  Text("Suported by:",
                  style: GoogleFonts.bitter(fontSize: 30,color: Colors.blueAccent,fontWeight: FontWeight.bold                )
                  ),
                  ]
              
              )
            ),
            Container(padding: EdgeInsets.all(10),
                    child:Column(children: <Widget>[
                  
                  Text("Chandan Mal",
                  style: GoogleFonts.indieFlower(fontSize:25,fontWeight: FontWeight.bold
                  ),
                  ),
                  Text("Sanskar Jaiswal",
                  style: GoogleFonts.indieFlower(fontSize:25,fontWeight: FontWeight.bold
                  ),
                  ),
                  Text("Sanal Yadav",
                  style: GoogleFonts.indieFlower(
                    fontSize:25,fontWeight:FontWeight.bold
                  ),),
                   Text("Vishal",
                  style: GoogleFonts.indieFlower(
                    fontSize:25,fontWeight:FontWeight.bold
                  ),),
                   Text("Sapna singh",
                  style: GoogleFonts.indieFlower(
                    fontSize:25,fontWeight:FontWeight.bold
                  ),)
                  ],)),

          
            
              ],
            ),
          ),
      ),
    );
  }
}


class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  TextEditingController feedbackcontroller = new TextEditingController();

  

Container Submmit() {
   return 
    Container(
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            colors: [
      Colors.blue[100],
      Colors.pink[100],
      Colors.yellow[100],
            ],
          ),
        ),
      child: AlertDialog(
          
          title:Text("Thanks"),
  
            content:Text("we are happy to see that u are give us your valuble feedback"),
  
            actions: <Widget>[
  
              RaisedButton(
  
      onPressed: (){
  
        Navigator.push(context , MaterialPageRoute(builder:(context)=>Homescreen(),));
      // Navigator.pop(context);
  
      },
  
      child:Text("ok")
  
              )
  
            ],
  
  
  
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [
            Colors.blue[100],
            Colors.pink[100],
            Colors.yellow[100],
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Box(100, 30),
          Container(
            child: TextField(
              controller: feedbackcontroller,
              decoration: InputDecoration(
                  hintText: "enter text here",
                  icon: Icon(Icons.feedback,color: Colors.black,),
                  enabled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide:
                          BorderSide(color: Colors.black, width: 50))),
            ),
          ),
         // Submit(),
          Box(50,50),
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Submmit()));
            },
            child: Text("submmit",
              style:TextStyle(color:Colors.white)
            ),
            color: Colors.grey,
          ),

          Container(
            height: 200,
            width:MediaQuery.of(context).size.width,
            child: Text(feedbackcontroller.text),
          )

        

          

        
         
        ],
      ),
    ));
  }
}
