
import "package:cloud_firestore/cloud_firestore.dart";

class CrudMethods {
  Future<void> addData(blogData) async {
    Firestore.instance.collection("blogs").add(blogData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await Firestore.instance.collection("blogs").orderBy("time").snapshots();
  }

  //profile....
getprofile() async {
    return await Firestore.instance.collection("user").snapshots();
  }


  //now i add to comments in  database;

  Future<void> addcomments(postcomments) async {
    Firestore.instance.collection("comments").add(postcomments).catchError((e) {
      print(e);
    });
  }

   getcommentsdata() async {
    return await Firestore.instance.collection("comments").snapshots();
  }

}