//

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future<void> addUserInfo(userData) async {
    FirebaseFirestore.instance
        .collection("users")
        .add(userData)
        .catchError((e) {
      print(e.toString());
    });
  }

  //add likes

  getUserInfo(String email) async {
    return FirebaseFirestore.instance
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {
    return FirebaseFirestore.instance
        .collection("userstoken")
        .where('username', isEqualTo: searchField)
        .get();
  }

  //for comments

  getcomments() async {
    return await FirebaseFirestore.instance.collection("users").snapshots();
  }

  Future<bool> addChatRoom(chatRoom, chatRoomId) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  chats(String group) async {
    return FirebaseFirestore.instance
        .collection(group)
        .orderBy("time")
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) {
    FirebaseFirestore.instance
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  //addbtecchat

  Future<void> addbtechMessage(var chatMessageData) {
    FirebaseFirestore.instance
        .collection("btechchat")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> addbpharmaMessage(var chatMessageData) {
    FirebaseFirestore.instance
        .collection("bpharmachat")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  Future<void> adddpharmaMessage(var chatMessageData) {
    FirebaseFirestore.instance
        .collection("dpharmachat")
        .add(chatMessageData)
        .catchError((e) {
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return await FirebaseFirestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }
}
