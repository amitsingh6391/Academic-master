
import "package:cloud_firestore/cloud_firestore.dart";

class CrudMethods {
  Future<void> addData(blogData) async {
    Firestore.instance.collection("blogs").add(blogData).catchError((e) {
      print(e);
    });
  }


//add civil data..on firestore
   Future<void> addcivilData(civilData) async {
    Firestore.instance.collection("civil").add(civilData).catchError((e) {
      print(e);
    });
  }

  //add ece data on firestore..

  Future<void> addeceData(eceData) async {
    Firestore.instance.collection("ece").add(eceData).catchError((e) {
      print(e);
    });
  }

  //add mechnical data...on firestore

   Future<void> addmechnicalData(mechnicalData) async {
    Firestore.instance.collection("mechnical").add(mechnicalData).catchError((e) {
      print(e);
    });
  }

  //add free courses..
  Future<void> addfreecourseData(freecourseData) async {
    Firestore.instance.collection("freecourse").add(freecourseData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return await Firestore.instance.collection("blogs").orderBy("time").snapshots();
  }

   getcivilData() async {
    return await Firestore.instance.collection("civil").orderBy("time").snapshots();
  }


 geteceData() async {
    return await Firestore.instance.collection("ece").orderBy("time").snapshots();
  }

 getmechnicalData() async {
    return await Firestore.instance.collection("mechnical").orderBy("time").snapshots();
  }

 getfreecourseData() async {
    return await Firestore.instance.collection("freecourse").orderBy("time").snapshots();
  }

  //profile....
getprofile() async {
    return await Firestore.instance.collection("user").snapshots();
  }





  //now we add to comments in  database;

  Future<void> addcomments(postcomments) async {
    Firestore.instance.collection("comments").add(postcomments).catchError((e) {
      print(e);
    });
  }

   getcommentsdata() async {
    return await Firestore.instance.collection("comments").snapshots();
  }

}