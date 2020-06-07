import 'package:Academicmaster/view/chat.dart';
import 'package:Academicmaster/view/chatrooms.dart';

import 'package:Academicmaster/view/helper/constants.dart';
import 'package:Academicmaster/view/helper/helperfunction.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:Academicmaster/view/widgets/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController searchEditingController = new TextEditingController();
  QuerySnapshot searchResultSnapshot;

  bool isLoading = false;
  bool haveUserSearched = false;

  initiateSearch() async {
    if (searchEditingController.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      await databaseMethods
          .searchByName(searchEditingController.text)
          .then((snapshot) {
        searchResultSnapshot = snapshot;
        print("$searchResultSnapshot");
        setState(() {
          isLoading = false;
          haveUserSearched = true;
        });
      });
    }
  }

  Widget userList() {
    return haveUserSearched
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchResultSnapshot.documents.length,
            itemBuilder: (context, index) {
              return userTile(
                searchResultSnapshot.documents[index].data["userName"],
                searchResultSnapshot.documents[index].data["userEmail"],
              );
            })
        : Container();
  }

  /// 1.create a chatroom, send user to the chatroom, other userdetails
  sendMessage(String userName) {
    List<String> users = [Constants.myName, userName];

    String chatRoomId = getChatRoomId(Constants.myName, userName);

    Map<String, dynamic> chatRoom = {
      "users": users,
      "chatRoomId": chatRoomId,
    };

    databaseMethods.addChatRoom(chatRoom, chatRoomId);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Chat(
                  chatRoomId: chatRoomId,
                )));
  }

  Widget userTile(String userName, String userEmail) {
    return Column(
    
      children: <Widget>[
        SizedBox(height: 20),
        Container(
        
          //color: Colors.orange,
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  sendMessage(userName);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(24)),
                  child: Text(
                    "Message",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  getChatRoomId(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF0000A0),
        title: Text(
          "join new friends",
          style: TextStyle(
            fontSize: 30,
            fontFamily: "Dancing",
          ),
        ),
        actions: <Widget>[Icon(Icons.favorite, size: 40, color: Colors.purple)],
      ),
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: searchEditingController,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                hintText: "search username ...",
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
                            initiateSearch();
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
                            child: Icon(Icons.search),
                          ),
                        )
                      ],
                    ),
                  ),
                  userList()
                ],
              ),
            ),
    );
  }
}
