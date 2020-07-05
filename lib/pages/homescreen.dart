import 'package:Academicmaster/branch.dart';
import 'package:Academicmaster/freecourse/fetchcourse.dart';
import 'package:Academicmaster/view/chatrooms.dart';

import "package:flutter/material.dart";

import '../aktuerp.dart';

import "homepage.dart";

import "package:Academicmaster/pages/posts.dart";

import "package:Academicmaster/view/viewmain.dart";

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int currentpage = 0;

  var pages = [
   MyApp(),
  
   HomPage(),
  
    Branch(),
    FreecoursePage(),
    Aktuerp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentpage,
          onTap: (i) {
            setState(() {
              currentpage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              title: Text("Chat"),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
               
              ),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              title: Text("Note,quantm",style: TextStyle(fontSize: 12),),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.next_week,),
                title: Text("free course")),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              title: Text("Aktu erp", style: TextStyle(fontSize: 13)),
            )
          ]),
      body: pages[currentpage],
    );
  }
}
