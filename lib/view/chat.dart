
// import 'package:Academicmaster/view/helper/constants.dart';
// import 'package:Academicmaster/view/viewservices/database.dart';
// //import 'package:Academicmaster/view/widgets/widget.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:link_text/link_text.dart';
// import "package:intl/intl.dart";
// import 'dart:io';
// Color backgroundcolor=Colors.white;
// Color textcolor = Colors.black;

// class Chat extends StatefulWidget {
//   final String chatRoomId;
//   final String userName;

//   Chat({this.chatRoomId,this.userName});

//   @override
//   _ChatState createState() => _ChatState();
// }

// class _ChatState extends State<Chat> {

// DateTime now = DateTime.now();

//   Stream<QuerySnapshot> chats;
//   TextEditingController messageEditingController = new TextEditingController();

//   Widget chatMessages(){
//     return StreamBuilder(
//       stream: chats,
//       builder: (context, snapshot){
//         return snapshot.hasData ?  ListView.builder(
//           itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index){
//               return MessageTile(
//                 message: snapshot.data.documents[index].data["message"],
//                 sendByMe: Constants.myName == snapshot.data.documents[index].data["sendBy"],
//                 msgtime:snapshot.data.documents[index].data["msgtime"]
//               );
//             }) : Container();
//       },
//     );
//   }

//   addMessage() {
//     if (messageEditingController.text.isNotEmpty) {
//       Map<String, dynamic> chatMessageMap = {
//         "sendBy": Constants.myName,
//         "message": messageEditingController.text,
//         'time': DateTime
//             .now()
//             .millisecondsSinceEpoch,
//         "msgtime":DateFormat("MM-dd - kk:mm").format(now)
//       };

//       DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap);

//       setState(() {
//         messageEditingController.text = "";
//       });
//     }
//   }

//   @override
//   void initState() {
//     DatabaseMethods().getChats(widget.chatRoomId).then((val) {
//       setState(() {
//         chats = val;
//       });
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//       Scaffold(
          
//          resizeToAvoidBottomPadding: false,
        

//           backgroundColor:backgroundcolor,
         
//           appBar: AppBar(
//             backgroundColor: Color(0xFF0000A0),
            
//              title: Text(widget.userName,style: TextStyle(fontSize:22,fontFamily:"Dancing"),),
//             actions: <Widget>[
      
//       SizedBox(width:50),
//       GestureDetector(
//           onTap: () {
//             setState(() {
//               backgroundcolor = Colors.white;
//               textcolor = Colors.black;
//             });
//           },
//           child: Icon(
//             Icons.brightness_2,
//             color: Colors.white,
//             size: 40,
//           )),
//           SizedBox(width: 20,),
//       GestureDetector(
//           onTap: () {
//             setState(() {
//               backgroundcolor = Colors.black;
//               textcolor = Colors.white;
//             });
//           },
//           child: Icon(
//             Icons.brightness_4,
//             color: Colors.black,
//             size: 40,
//           )),
             
//             ],
//           ), 
//           body: Container(
//             child: Stack(
//             // Column(
//        children: [
//           chatMessages(),
            
          
//           Container(
//               alignment: Alignment.bottomCenter,
//               width:MediaQuery.of(context).size.width,
//               child: Container(
                
//                 padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//                // color: Color(0x54FFFFFF),
//                //color:Colors.white60,
//                 child: Row(
                  
//                   children: [
//                     Expanded(
//           child: TextField(
//               controller: messageEditingController,
//               //style: simpleTextStyle(),
//               style: TextStyle(color:textcolor),
//               decoration: InputDecoration(
//                  enabledBorder: OutlineInputBorder(
//                    borderSide:BorderSide(color:textcolor,width:3)
//                  ),
//                   hintText: " send Message...",
//                   hintStyle: TextStyle(
//                     color: textcolor,
//                     fontSize: 16,
//                   ),
//                    border: OutlineInputBorder(
//                   //borderSide: BorderSide(color:Colors.black),
//                   borderRadius: BorderRadius.circular(10)
//               ),
//             ),
//           ),),
//                     SizedBox(width: 16,),
                   
//                     GestureDetector(
//                       onTap: () {
//           addMessage();
//                       },
//                       child: Container(
//             height: 40,
//             width: 40,
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [
//                       Colors.pink,
//                       Colors.yellow,
//                     ],
//                     begin: FractionalOffset.topLeft,
//                     end: FractionalOffset.bottomRight
//                 ),
//                 borderRadius: BorderRadius.circular(40)
//             ),
//             padding: EdgeInsets.all(12),
//             child: Icon(Icons.send),
//               ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//         ],
//       //),
//             ),
//           ),
        
//     );
//   }

// }

// class MessageTile extends StatelessWidget {
//   final String message;
//   final bool sendByMe;
//   final String msgtime;
//   MessageTile({@required this.message, @required this.sendByMe,@required this.msgtime});


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.only(
//               top: 8,
//               bottom: 8,
//               left: sendByMe ? 0 : 24,
//               right: sendByMe ? 24 : 0),
//           alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
//           child: Container(
//             margin: sendByMe
//                 ? EdgeInsets.only(left: 30)
//                 : EdgeInsets.only(right: 30),
//             padding: EdgeInsets.only(
//                 top: 17, bottom: 17, left: 20, right: 20),
//             decoration: BoxDecoration(
//                 borderRadius: sendByMe ? BorderRadius.only(
//                     topLeft: Radius.circular(23),
//                     topRight: Radius.circular(23),
//                     bottomLeft: Radius.circular(23)
//                 ) :
//                 BorderRadius.only(
//             topLeft: Radius.circular(23),
//               topRight: Radius.circular(23),
//               bottomRight: Radius.circular(23)),
//                gradient: LinearGradient(
               
//                colors:sendByMe ? [
//                  Colors.red,
//                  Colors.red,
//                ]:[
//                  Colors.green,
//                  Colors.green,
//                ]

//                )
//             ),
//             child: Column(
//               children: <Widget>[
//                 LinkText(
//                           text:message,
//                       textAlign: TextAlign.start,
//                       textStyle: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontFamily: 'OverpassRegular',
//                       )),
//                       SizedBox(height:15),
//                       Text(msgtime,style:TextStyle(fontSize:10) ,textAlign: TextAlign.right,),
//               ],
//             ),
//             ),
//           ),
        
//       ],
//     );
    
//   }
// }


import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
//import 'package:Academicmaster/view/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:link_text/link_text.dart';
import "package:intl/intl.dart";
import 'dart:io';
Color backgroundcolor=Colors.white;
Color textcolor = Colors.black;

class Chat extends StatefulWidget {
  final String chatRoomId;
  final String userName;

  Chat({this.chatRoomId,this.userName});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

DateTime now = DateTime.now();

  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  Widget chatMessages(){
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot){
        return snapshot.hasData ?  ListView.builder(
          itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              return MessageTile(
                message: snapshot.data.documents[index].data["message"],
                sendByMe: Constants.myName == snapshot.data.documents[index].data["sendBy"],
                msgtime:snapshot.data.documents[index].data["msgtime"]
              );
            }) : Container();
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": Constants.myName,
        "message": messageEditingController.text,
        'time': DateTime
            .now()
            .millisecondsSinceEpoch,
        "msgtime":DateFormat("MM-dd - kk:mm").format(now)
      };

      DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    DatabaseMethods().getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
          
        // resizeToAvoidBottomPadding: false,
        

          backgroundColor:backgroundcolor,
         
          appBar: AppBar(
            backgroundColor: Colors.black,
            
             title: Text(widget.userName,style: TextStyle(fontSize:22,fontFamily:"Dancing"),),
            actions: <Widget>[
      
      SizedBox(width:50),
      GestureDetector(
          onTap: () {
            setState(() {
              backgroundcolor = Colors.white;
              textcolor = Colors.black;
            });
          },
          child: Icon(
            Icons.brightness_2,
            color: Colors.white,
            size: 40,
          )),
          SizedBox(width: 20,),
      GestureDetector(
          onTap: () {
            setState(() {
              backgroundcolor = Colors.black;
              textcolor = Colors.white;
            });
          },
          child: Icon(
            Icons.brightness_4,
            color: Colors.white,
            size: 40,
          )),
             
            ],
          ), 
          body: Container(
            child: Stack(
            // Column(
       children: [
          chatMessages(),
            
          
          Container(
              alignment: Alignment.bottomCenter,
              width:MediaQuery.of(context).size.width,
              child: Container(
                
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
               // color: Color(0x54FFFFFF),
               //color:Colors.white60,
                child: Row(
                  
                  children: [
                    Expanded(
          child: TextField(
              controller: messageEditingController,
              //style: simpleTextStyle(),
              style: TextStyle(color:textcolor),
              decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
                   borderSide:BorderSide(color:textcolor,width:3)
                 ),
                  hintText: " send Message...",
                  hintStyle: TextStyle(
                    color: textcolor,
                    fontSize: 16,
                  ),
                   border: OutlineInputBorder(
                  //borderSide: BorderSide(color:Colors.black),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),),
                    SizedBox(width: 16,),
                   
                    GestureDetector(
                      onTap: () {
          addMessage();
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
                    end: FractionalOffset.bottomRight
                ),
                borderRadius: BorderRadius.circular(40)
            ),
            padding: EdgeInsets.all(12),
            child: Icon(Icons.send),
              ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      //),
            ),
          ),
        
    );
  }

}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;
  final String msgtime;
  MessageTile({@required this.message, @required this.sendByMe,@required this.msgtime});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: sendByMe ? 0 : 24,
              right: sendByMe ? 24 : 0),
          alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: sendByMe
                ? EdgeInsets.only(left: 30)
                : EdgeInsets.only(right: 30),
            padding: EdgeInsets.only(
                top: 17, bottom: 17, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: sendByMe ? BorderRadius.only(
                    topLeft: Radius.circular(23),
                    topRight: Radius.circular(23),
                    bottomLeft: Radius.circular(23)
                ) :
                BorderRadius.only(
            topLeft: Radius.circular(23),
              topRight: Radius.circular(23),
              bottomRight: Radius.circular(23)),
               gradient: LinearGradient(
               
               colors:sendByMe ? [
                 Colors.red,
                 Colors.red,
               ]:[
                 Colors.green,
                 Colors.green,
               ]

               )
            ),
            child: Column(
              children: <Widget>[
                LinkText(
                          text:message,
                      textAlign: TextAlign.start,
                      textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'OverpassRegular',
                      )),
                      SizedBox(height:15),
                      Text(msgtime,style:TextStyle(fontSize:10) ,textAlign: TextAlign.right,),
              ],
            ),
            ),
          ),
        
      ],
    );
    
  }
}



