import 'package:Academicmaster/services/crud.dart';
import 'package:Academicmaster/view/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:Academicmaster/view/viewservices/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:link_text/link_text.dart';

class Comments extends StatefulWidget {
  //  String x;
  // Comments({@required this.x});

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {


CrudMethods crudMethods = new CrudMethods();
 Stream<QuerySnapshot> comments;

 //now we show our comments in lisview:
 Stream commentsStream;
 DatabaseMethods databaseMethods = new DatabaseMethods();
  
  QuerySnapshot searchResultSnapshot;

  @override
  void initState() {
    crudMethods.getcommentsdata().then((result) {
      setState(() {
        commentsStream = result;
      });
    });
    super.initState();
  }


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: FloatingActionButton(onPressed: (){
    Firestore.instance.collection("comments").getDocuments().then((snapshot){
      for(DocumentSnapshot ds in snapshot.documents){
        ds.reference.delete();
      }
    });
      },
      child:Icon(Icons.delete)),
      backgroundColor: Colors.cyan,
       appBar: AppBar(
          backgroundColor: Colors.green,
          
          title: Text(
            "  comments ",
            style: TextStyle(
                fontSize: 30,
                fontFamily: "Dancing",
                fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            Icon(
              Icons.school,
              size: 50,
              color: Colors.red,
            ),
          ],
        ),

      body: SingleChildScrollView(
        physics: ScrollPhysics(),
              child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Colors.black, Colors.black],
                // ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: commentsStream  != null
                  ? Column(
                      children: <Widget>[
                        StreamBuilder(
                          stream: commentsStream ,
                          builder: (context, snapshot) {
                            return ListView.builder(
                              reverse: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                itemCount: snapshot.data.documents.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CommentsTile(
                                   comments: snapshot.data.documents[index]
                                        .data['comments'],
                                    comments_by: snapshot
                                        .data.documents[index].data["comments_by"],
                                    commenttime: snapshot.data.documents[index].data["commenttime"],

                                  
                                    
                                    
                                  );
                                });
                          },
                        )
                      ],
                    )
                  : Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      ),

    );
  }
}


//here we define inside listview in comments

class CommentsTile extends StatelessWidget {
  String comments, comments_by,commenttime;

  BuildContext context;
  CommentsTile(
      {@required this.comments,
      @required this.comments_by,
    @required this.commenttime
      });

 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
      
      color: Colors.white),

      height:200,
      
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          
          
          Container(
            height: 120,
            // child: Text(
            //   "$comments",
            //   // textAlign: TextAlign.center,
            //   style: TextStyle(
            //       fontSize: 25,
            //       fontWeight: FontWeight.w500,
                  
            //       color: Colors.black),
            // ),
            child: LinkText(
              text:"$comments",
              textStyle: TextStyle(
                  fontSize: 17,
                  //fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Container(
            height: 50,
            child: Text(
              "user:  $comments_by",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Dancing",
                  color: Colors.black),
            ),
          ),

          //for comments only
          Text(commenttime,style:TextStyle(fontSize:10,))
           
          
        ],
      ),
    );
  }
}

