
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
//import 'package:TheMitian/view/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';




class Chat extends StatefulWidget {
  final String chatRoomId;

  Chat({this.chatRoomId});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {

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
        
        resizeToAvoidBottomPadding: false,
      


       
        appBar: AppBar(
          backgroundColor: Color(0xFF0000A0),
           //title: Text("Let's talk",style: TextStyle(fontSize:30,fontFamily:"Dancing"),),
          actions: <Widget>[
            Icon(
              Icons.message,
              size: 60,
            ),
            Container(
              width: 150,
            )
          ],
        ),
        backgroundColor:Colors.white,
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
                     color:Colors.white60,
                      child: Row(
                        
                        children: [
                          Expanded(
                child: TextField(
                    controller: messageEditingController,
                    //style: simpleTextStyle(),
                    style: TextStyle(color:Colors.black),
                    decoration: InputDecoration(
                        hintText: " send Message...",
                        hintStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                         border: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.black),)
                    ),
                  ),
                ),
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

  MessageTile({@required this.message, @required this.sendByMe});


  @override
  Widget build(BuildContext context) {
    return Container(
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
             Colors.black,
             Colors.black,
           ]:[
             Colors.green,
             Colors.blue,
           ]

           )
        ),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'OverpassRegular',
            fontWeight: FontWeight.w300)),
      ),
    );
  }
}
