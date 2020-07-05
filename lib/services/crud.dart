
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
   Future<void> addcivil2yearData(civil2yearData) async {
    Firestore.instance.collection("civil2year").add(civil2yearData).catchError((e) {
      print(e);
    });
  }
   Future<void> addcivil3yearData(civil3yearData) async {
    Firestore.instance.collection("civil3year").add(civil3yearData).catchError((e) {
      print(e);
    });
  }
   Future<void> addcivil4yearData(civil4yearData) async {
    Firestore.instance.collection("civil4year").add(civil4yearData).catchError((e) {
      print(e);
    });
  }

  //add ece data on firestore..

  Future<void> addeceData(eceData) async {
    Firestore.instance.collection("ece").add(eceData).catchError((e) {
      print(e);
    });
  }
  Future<void> addece2yearData(ece2yearData) async {
    Firestore.instance.collection("ece2year").add(ece2yearData).catchError((e) {
      print(e);
    });
  }
  Future<void> addece3yearData(ece3yearData) async {
    Firestore.instance.collection("ece3year").add(ece3yearData).catchError((e) {
      print(e);
    });
  }
  Future<void> addece4yearData(ece4yearData) async {
    Firestore.instance.collection("ece4year").add(ece4yearData).catchError((e) {
      print(e);
    });
  }

  //add mechnical data...on firestore

   Future<void> addmechnicalData(mechnicalData) async {
    Firestore.instance.collection("mechnical").add(mechnicalData).catchError((e) {
      print(e);
    });
  }

Future<void> addmechnical2yearData(mechnical2yearData) async {
    Firestore.instance.collection("mechnical2year").add(mechnical2yearData).catchError((e) {
      print(e);
    });
  }
Future<void> addmechnical3yearData(mechnical3yearData) async {
    Firestore.instance.collection("mechnical3year").add(mechnical3yearData).catchError((e) {
      print(e);
    });
  }
  Future<void> addmechnical4yearData(mechnical4yearData) async {
    Firestore.instance.collection("mechnical4year").add(mechnical4yearData).catchError((e) {
      print(e);
    });
  }

  //add free courses..
  Future<void> addfreecourseData(freecourseData) async {
    Firestore.instance.collection("freecourse").add(freecourseData).catchError((e) {
      print(e);
    });
  }

  
  //get post from server...
  getData() async {
    return await Firestore.instance.collection("blogs").orderBy("time").snapshots();
  }

   
  //getcivildata/..... 
   getcivilData() async {
    return await Firestore.instance.collection("civil").orderBy("time").snapshots();
  }
 getcivil2yearData() async {
    return await Firestore.instance.collection("civil2year").orderBy("time").snapshots();
  }
  getcivil3yearData() async {
    return await Firestore.instance.collection("civil3year").orderBy("time").snapshots();
  }
  getcivil4yearData() async {
    return await Firestore.instance.collection("civil4year").orderBy("time").snapshots();
  }


//getecedata from server....
 geteceData() async {
    return await Firestore.instance.collection("ece").orderBy("time").snapshots();
  }

   getece2yearData() async {
    return await Firestore.instance.collection("ece2year").orderBy("time").snapshots();
  }
  getece3yearData() async {
    return await Firestore.instance.collection("ece3year").orderBy("time").snapshots();
  }
  getece4yearData() async {
    return await Firestore.instance.collection("ece4year").orderBy("time").snapshots();
  }


//getmechnicaldata from server...
 getmechnicalData() async {
    return await Firestore.instance.collection("mechnical").orderBy("time").snapshots();
  }

  getmechnical2yearData() async {
    return await Firestore.instance.collection("mechnical2year").orderBy("time").snapshots();
  }
  getmechnical3yearData() async {
    return await Firestore.instance.collection("mechnical3year").orderBy("time").snapshots();
  }
  getmechnical4yearData() async {
    return await Firestore.instance.collection("mechnical4year").orderBy("time").snapshots();
  }


//getfree courses from server..
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